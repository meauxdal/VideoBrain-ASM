;Checkers - EN04

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00,$31,$19,$0b,$31,$15,$0b,$09,$21,$00,$00,$00,$00	;name - CHECKERS
                                
START:          DCI  $08f5               ; 1012 2a 08 f5
                LIS  $0                  ; 1015 70
                ST                       ; 1016 17
                PI   $41d5               ; 1017 28 41 d5
                PI   $22db               ; 101a 28 22 db
                LISU 2                   ; 101d 62
                LISL 6                   ; 101e 6e
                LIS  $0                  ; 101f 70
                XS   (IS)                ; 1020 ec
                BF   $1,A1028            ; 1021 91 06
                LI   $81                 ; 1023 20 81
                LR   (IS)-,A             ; 1025 5e
                LIS  $2                  ; 1026 72
                LR   (IS),A              ; 1027 5c
A1028:          LIS  $5                  ; 1028 75
                LR   $0,A                ; 1029 50
                PI   A13d0               ; 102a 28 13 d0
                DCI  A15ef               ; 102d 2a 15 ef
                PI   $4205               ; 1030 28 42 05
                PI   A1309               ; 1033 28 13 09
                CI   $2d                 ; 1036 25 2d
                BT   4,A104e             ; 1038 84 15
                CI   $31                 ; 103a 25 31
                BT   4,A104a             ; 103c 84 0d
                CI   $1f                 ; 103e 25 1f
                BT   4,A1046             ; 1040 84 05
                LI   $f0                 ; 1042 20 f0
                BF   $0,A1050            ; 1044 90 0b
A1046:          LI   $d8                 ; 1046 20 d8
                BF   $0,A1050            ; 1048 90 07
A104a:          LI   $e0                 ; 104a 20 e0
                BF   $0,A1050            ; 104c 90 03
A104e:          LI   $e8                 ; 104e 20 e8
A1050:          DCI  $0c28               ; 1050 2a 0c 28
                ST                       ; 1053 17
                DS   $0                  ; 1054 30
                DS   $0                  ; 1055 30
                DS   $0                  ; 1056 30
                PI   $41d5               ; 1057 28 41 d5
                PI   A13d0               ; 105a 28 13 d0
                LIS  $5                  ; 105d 75
                COM                      ; 105e 18
                AS   (IS)                ; 105f cc
                LR   (IS),A              ; 1060 5c
                DCI  A15d5               ; 1061 2a 15 d5
                PI   $4205               ; 1064 28 42 05
                PI   A1309               ; 1067 28 13 09
                CI   $2b                 ; 106a 25 2b
                DCI  $0c29               ; 106c 2a 0c 29
                LIS  $0                  ; 106f 70
                LR   $7,A                ; 1070 57
                BT   4,A1079             ; 1071 84 07
                COM                      ; 1073 18
                ST                       ; 1074 17
                COM                      ; 1075 18
                ST                       ; 1076 17
                BF   $0,A107b            ; 1077 90 03
A1079:          ST                       ; 1079 17
                ST                       ; 107a 17
A107b:          DCI  A131d               ; 107b 2a 13 1d
                XDC                      ; 107e 2c
                DCI  $0ed0               ; 107f 2a 0e d0
                LIS  $7                  ; 1082 77
                LISU 2                   ; 1083 62
                LISL 0                   ; 1084 68
                LR   (IS),A              ; 1085 5c
                PI   $43cd               ; 1086 28 43 cd
                DCI  $0c25               ; 1089 2a 0c 25
                LIS  $0                  ; 108c 70
                ST                       ; 108d 17
                DCI  $0fea               ; 108e 2a 0f ea
                LI   $65                 ; 1091 20 65
                ST                       ; 1093 17
                PI   $4762               ; 1094 28 47 62
                DCI  $0ffa               ; 1097 2a 0f fa
                LIS  $3                  ; 109a 73
                ST                       ; 109b 17
                LIS  $0                  ; 109c 70
                ST                       ; 109d 17
                LI   $15                 ; 109e 20 15
                ST                       ; 10a0 17
                LI   $a7                 ; 10a1 20 a7
                ST                       ; 10a3 17
                PI   $41c8               ; 10a4 28 41 c8
                LIS  $5                  ; 10a7 75
                LR   (IS),A              ; 10a8 5c
                DCI  A13cb               ; 10a9 2a 13 cb
                XDC                      ; 10ac 2c
                DCI  $0ffb               ; 10ad 2a 0f fb
                PI   $43cd               ; 10b0 28 43 cd
                PI   $41c8               ; 10b3 28 41 c8
                PI   A166a               ; 10b6 28 16 6a
                LISU 3                   ; 10b9 63
                LISL 7                   ; 10ba 6f
                LIS  $0                  ; 10bb 70
A10bc:          LR   (IS)-,A             ; 10bc 5e
                BR7  A10bc               ; 10bd 8f fe
                COM                      ; 10bf 18
                LR   (IS)+,A             ; 10c0 5d
                LR   (IS)+,A             ; 10c1 5d
                SL   4                   ; 10c2 15
                LR   (IS)+,A             ; 10c3 5d
                LISL 6                   ; 10c4 6e
                LIS  $f                  ; 10c5 7f
                LR   (IS)+,A             ; 10c6 5d
                LISU 4                   ; 10c7 64
                LISL 7                   ; 10c8 6f
                LIS  $0                  ; 10c9 70
A10ca:          LR   (IS)-,A             ; 10ca 5e
                BR7  A10ca               ; 10cb 8f fe
                LI   $18                 ; 10cd 20 18
                LR   (IS)-,A             ; 10cf 5e
                LR   (IS)-,A             ; 10d0 5e
                DCI  $0e20               ; 10d1 2a 0e 20
                PI   A1699               ; 10d4 28 16 99
                DCI  $0e10               ; 10d7 2a 0e 10
                PI   A1699               ; 10da 28 16 99
                PI   A1324               ; 10dd 28 13 24
                DCI  $0f0c               ; 10e0 2a 0f 0c
                LIS  $0                  ; 10e3 70
                ST                       ; 10e4 17
                LIS  $3                  ; 10e5 73
                ST                       ; 10e6 17
                LIS  $0                  ; 10e7 70
                ST                       ; 10e8 17
                DCI  $0f0f               ; 10e9 2a 0f 0f
                ST                       ; 10ec 17
                DCI  $0ef0               ; 10ed 2a 0e f0
                LI   $c1                 ; 10f0 20 c1
                ST                       ; 10f2 17
                LI   $c0                 ; 10f3 20 c0
                ST                       ; 10f5 17
                DCI  $0c29               ; 10f6 2a 0c 29
                LIS  $0                  ; 10f9 70
                XM                       ; 10fa 8c
                BF   $1,A112d            ; 10fb 91 31
                LISU 2                   ; 10fd 62
                LISL 5                   ; 10fe 6d
                LIS  $7                  ; 10ff 77
                NS   (IS)                ; 1100 fc
                LR   $0,A                ; 1101 50
                DCI  $0c25               ; 1102 2a 0c 25
                SL   4                   ; 1105 15
                SR   1                   ; 1106 12
                ST                       ; 1107 17
                DCI  $0ed0               ; 1108 2a 0e d0
A110b:          LM                       ; 110b 16
                LR   $1,A                ; 110c 51
A110d:          LR   A,$1                ; 110d 41
                NS   $1                  ; 110e f1
                BF   $4,A1114            ; 110f 94 04
                LM                       ; 1111 16
                BF   $0,A110b            ; 1112 90 f8
A1114:          LR   $2,A                ; 1114 52
                AI   $ff                 ; 1115 24 ff
                NS   $1                  ; 1117 f1
                LR   $1,A                ; 1118 51
                XS   $2                  ; 1119 e2
                DS   $0                  ; 111a 30
                BT   1,A110d             ; 111b 81 f1
                LR   $6,A                ; 111d 56
                LM                       ; 111e 16
                LR   $4,A                ; 111f 54
                DCI  $0e20               ; 1120 2a 0e 20
                LR   H,DC                ; 1123 11
                LIS  $c                  ; 1124 7c
                ADC                      ; 1125 8e
                LR   A,$6                ; 1126 46
                ST                       ; 1127 17
                LR   A,$4                ; 1128 44
                ST                       ; 1129 17
                JMP  A17ff               ; 112a 29 17 ff
A112d:          PI   A163f               ; 112d 28 16 3f
                PI   A150b               ; 1130 28 15 0b
                DCI  $0e10               ; 1133 2a 0e 10
                LR   H,DC                ; 1136 11
A1137:          LIS  $0                  ; 1137 70
A1138:          LR   $0,A                ; 1138 50
                PI   A125b               ; 1139 28 12 5b
                DCI  $0c21               ; 113c 2a 0c 21
                LIS  $0                  ; 113f 70
                ST                       ; 1140 17
                PI   A13ed               ; 1141 28 13 ed
                DCI  $0ed0               ; 1144 2a 0e d0
A1147:          LIS  $0                  ; 1147 70
                XM                       ; 1148 8c
                BF   $4,A1154            ; 1149 94 0a
                LR   A,$5                ; 114b 45
                NI   $10                 ; 114c 21 10
                LIS  $5                  ; 114e 75
                BT   4,A1152             ; 114f 84 02
                LIS  $1                  ; 1151 71
A1152:          BF   $0,A1138            ; 1152 90 e5
A1154:          NS   $3                  ; 1154 f3
                BF   $4,A115b            ; 1155 94 05
                LM                       ; 1157 16
                LR   $5,A                ; 1158 55
                BF   $0,A1147            ; 1159 90 ed
A115b:          LM                       ; 115b 16
                LR   $5,A                ; 115c 55
                SR   1                   ; 115d 12
                SR   1                   ; 115e 12
                NI   $03                 ; 115f 21 03
                XS   $4                  ; 1161 e4
                BF   $4,A1147            ; 1162 94 e4
                DCI  $0e5b               ; 1164 2a 0e 5b
                LR   A,$1                ; 1167 41
                ST                       ; 1168 17
                LR   A,$2                ; 1169 42
                ST                       ; 116a 17
                LR   A,$3                ; 116b 43
                ST                       ; 116c 17
                LR   A,$4                ; 116d 44
                ST                       ; 116e 17
                LIS  $3                  ; 116f 73
                COM                      ; 1170 18
                DCI  $0c24               ; 1171 2a 0c 24
                ST                       ; 1174 17
                DCI  $0c21               ; 1175 2a 0c 21
                LIS  $1                  ; 1178 71
                ST                       ; 1179 17
                LR   A,$1                ; 117a 41
                ST                       ; 117b 17
                LR   A,$2                ; 117c 42
                ST                       ; 117d 17
A117e:          PI   A13ed               ; 117e 28 13 ed
                DCI  $0e57               ; 1181 2a 0e 57
                LR   A,$1                ; 1184 41
                ST                       ; 1185 17
                LR   A,$2                ; 1186 42
                ST                       ; 1187 17
                LR   A,$3                ; 1188 43
                ST                       ; 1189 17
                LR   A,$4                ; 118a 44
                ST                       ; 118b 17
                DCI  $0e5d               ; 118c 2a 0e 5d
                LM                       ; 118f 16
                LR   $3,A                ; 1190 53
                LM                       ; 1191 16
                LR   $4,A                ; 1192 54
                DCI  $0e5b               ; 1193 2a 0e 5b
                LM                       ; 1196 16
                COM                      ; 1197 18
                INC                      ; 1198 1f
                AS   $1                  ; 1199 c1
                LR   $1,A                ; 119a 51
                BT   1,A119f             ; 119b 81 03
                COM                      ; 119d 18
                INC                      ; 119e 1f
A119f:          LR   $0,A                ; 119f 50
                CI   $02                 ; 11a0 25 02
                BT   1,A11a7             ; 11a2 81 04
                JMP  A1225               ; 11a4 29 12 25
A11a7:          LIS  $0                  ; 11a7 70
                BF   $4,A11ac            ; 11a8 94 03
                LI   $10                 ; 11aa 20 10
A11ac:          LR   $6,A                ; 11ac 56
                LM                       ; 11ad 16
                COM                      ; 11ae 18
                INC                      ; 11af 1f
                AS   $2                  ; 11b0 c2
                LR   $2,A                ; 11b1 52
                BF   $1,A11b6            ; 11b2 91 03
                COM                      ; 11b4 18
                INC                      ; 11b5 1f
A11b6:          AS   $0                  ; 11b6 c0
                BF   $4,A1222            ; 11b7 94 6a
                LR   A,$2                ; 11b9 42
                NS   $2                  ; 11ba f2
                BT   1,A11c0             ; 11bb 81 04
                LIS  $2                  ; 11bd 72
                AS   $6                  ; 11be c6
                LR   $6,A                ; 11bf 56
A11c0:          LR   A,$1                ; 11c0 41
                NS   $1                  ; 11c1 f1
                BF   $1,A11c7            ; 11c2 91 04
                LIS  $1                  ; 11c4 71
                AS   $6                  ; 11c5 c6
                LR   $6,A                ; 11c6 56
A11c7:          LR   A,$4                ; 11c7 44
                SL   1                   ; 11c8 13
                SL   1                   ; 11c9 13
                AS   $6                  ; 11ca c6
                LR   $6,A                ; 11cb 56
                DCI  $0ed0               ; 11cc 2a 0e d0
                LIS  $8                  ; 11cf 78
                LR   $0,A                ; 11d0 50
A11d1:          LIS  $0                  ; 11d1 70
                XM                       ; 11d2 8c
                BT   4,A1219             ; 11d3 84 45
                LR   $1,A                ; 11d5 51
                LM                       ; 11d6 16
                LR   $5,A                ; 11d7 55
A11d8:          LIS  $0                  ; 11d8 70
                XS   $1                  ; 11d9 e1
                BT   4,A11d1             ; 11da 84 f6
                LR   $2,A                ; 11dc 52
                AI   $ff                 ; 11dd 24 ff
                NS   $1                  ; 11df f1
                LR   $1,A                ; 11e0 51
                XS   $2                  ; 11e1 e2
                DS   $0                  ; 11e2 30
                NS   $3                  ; 11e3 f3
                BT   4,A11d8             ; 11e4 84 f3
                LR   A,$5                ; 11e6 45
                XS   $6                  ; 11e7 e6
                BF   $4,A11d8            ; 11e8 94 ef
                LIS  $7                  ; 11ea 77
                XS   $0                  ; 11eb e0
                DCI  $0c25               ; 11ec 2a 0c 25
                ST                       ; 11ef 17
                PI   A163f               ; 11f0 28 16 3f
                PI   A150b               ; 11f3 28 15 0b
                PI   A166a               ; 11f6 28 16 6a
                DCI  $0e10               ; 11f9 2a 0e 10
                LR   H,DC                ; 11fc 11
                LIS  $c                  ; 11fd 7c
                ADC                      ; 11fe 8e
                LR   A,$3                ; 11ff 43
                ST                       ; 1200 17
                LR   A,$6                ; 1201 46
                ST                       ; 1202 17
                DCI  $0c22               ; 1203 2a 0c 22
                XDC                      ; 1206 2c
                DCI  $0c2d               ; 1207 2a 0c 2d
                LM                       ; 120a 16
                XDC                      ; 120b 2c
                ST                       ; 120c 17
                XDC                      ; 120d 2c
                LM                       ; 120e 16
                XDC                      ; 120f 2c
                ST                       ; 1210 17
                DCI  $0c21               ; 1211 2a 0c 21
                LIS  $1                  ; 1214 71
                ST                       ; 1215 17
                JMP  A17ff               ; 1216 29 17 ff
A1219:          LR   A,$5                ; 1219 45
                NI   $10                 ; 121a 21 10
                LIS  $2                  ; 121c 72
                BT   4,A1226             ; 121d 84 08
                LIS  $1                  ; 121f 71
                BF   $0,A1226            ; 1220 90 05
A1222:          LIS  $2                  ; 1222 72
                BF   $0,A1226            ; 1223 90 02
A1225:          LIS  $3                  ; 1225 73
A1226:          LR   $0,A                ; 1226 50
                DCI  $0c24               ; 1227 2a 0c 24
                LM                       ; 122a 16
                INC                      ; 122b 1f
                DCI  $0c24               ; 122c 2a 0c 24
                ST                       ; 122f 17
                BF   $1,A1235            ; 1230 91 04
                JMP  A1137               ; 1232 29 11 37
A1235:          PI   A125b               ; 1235 28 12 5b
                JMP  A117e               ; 1238 29 11 7e
A123b:          DCI  $0c24               ; 123b 2a 0c 24
                LI   $82                 ; 123e 20 82
                ST                       ; 1240 17
                DCI  $0e5b               ; 1241 2a 0e 5b
                XDC                      ; 1244 2c
                DCI  $0e57               ; 1245 2a 0e 57
                LIS  $4                  ; 1248 74
                LR   $0,A                ; 1249 50
A124a:          LM                       ; 124a 16
                XDC                      ; 124b 2c
                ST                       ; 124c 17
                XDC                      ; 124d 2c
                DS   $0                  ; 124e 30
                BF   $4,A124a            ; 124f 94 fa
                PI   A163f               ; 1251 28 16 3f
                PI   A150b               ; 1254 28 15 0b
                LIS  $6                  ; 1257 76
                LR   $0,A                ; 1258 50
                BF   $0,A1235            ; 1259 90 db
A125b:          LR   K,P                 ; 125b 08
                PI   $40a9               ; 125c 28 40 a9
                DCI  $0872               ; 125f 2a 08 72
                LI   $82                 ; 1262 20 82
                ST                       ; 1264 17
                DCI  $0c26               ; 1265 2a 0c 26
                LR   A,$a                ; 1268 4a
                ST                       ; 1269 17
                LR   A,$b                ; 126a 4b
                ST                       ; 126b 17
                PI   A163f               ; 126c 28 16 3f
                DCI  A12ac               ; 126f 2a 12 ac
                LR   A,$0                ; 1272 40
                SL   1                   ; 1273 13
                AS   $0                  ; 1274 c0
                ADC                      ; 1275 8e
                LISU 2                   ; 1276 62
                LISL 4                   ; 1277 6c
                LM                       ; 1278 16
                LR   (IS),A              ; 1279 5c
                LM                       ; 127a 16
                LR   QU,A                ; 127b 06
                LM                       ; 127c 16
                LR   QL,A                ; 127d 07
                DCI  $0fdf               ; 127e 2a 0f df
                LIS  $5                  ; 1281 75
                SL   4                   ; 1282 15
                ST                       ; 1283 17
                DCI  $0e5f               ; 1284 2a 0e 5f
                LIS  $7                  ; 1287 77
                SL   4                   ; 1288 15
                LR   $1,A                ; 1289 51
                LIS  $0                  ; 128a 70
A128b:          ST                       ; 128b 17
                DS   $1                  ; 128c 31
                BF   $4,A128b            ; 128d 94 fd
                PI   $41c8               ; 128f 28 41 c8
                DCI  $0872               ; 1292 2a 08 72
                LIS  $2                  ; 1295 72
                ST                       ; 1296 17
                LR   DC,Q                ; 1297 0f
                PI   $4205               ; 1298 28 42 05
                PI   A163f               ; 129b 28 16 3f
                DCI  $0c26               ; 129e 2a 0c 26
                LM                       ; 12a1 16
                LR   $a,A                ; 12a2 5a
                LM                       ; 12a3 16
                LR   $b,A                ; 12a4 5b
                PI   A166a               ; 12a5 28 16 6a
                PI   $40bc               ; 12a8 28 40 bc
                PK                       ; 12ab 0c
A12ac:          LR   P,K                 ; 12ac 09
                SR   1                   ; 12ad 12
                AS   $7                  ; 12ae c7
                LR   P,K                 ; 12af 09
                SR   1                   ; 12b0 12
                ASD  $0                  ; 12b1 d0
                LR   QL,A                ; 12b2 07
                SR   1                   ; 12b3 12
                ASD  $9                  ; 12b4 d9
                LR   QL,A                ; 12b5 07
                SR   1                   ; 12b6 12
                XS   $0                  ; 12b7 e0
                LR   A,KL                ; 12b8 01
                SR   1                   ; 12b9 12
                AS   $b                  ; 12ba cb
                LR   P,K                 ; 12bb 09
                SR   1                   ; 12bc 12
                XS   $7                  ; 12bd e7
                LR   P0,Q                ; 12be 0d
                SR   1                   ; 12bf 12
                NS   $0                  ; 12c0 f0
                LR   KL,A                ; 12c1 05
                SR   1                   ; 12c2 12
                NS   (IS)+               ; 12c3 fd
                LR   QL,A                ; 12c4 07
                SL   1                   ; 12c5 13
                LR   A,QU                ; 12c6 02
                LR   KL,A                ; 12c7 05
                SL   1                   ; 12c8 13
                LR   A,QL                ; 12c9 03
                LR   P,K                 ; 12ca 09
                LR   A,KU                ; 12cb 00
                JMP  A132f               ; 12cc 29 13 2f
                LR   IS,A                ; 12cf 0b
                JMP  $0321               ; 12d0 29 03 21
                LR   QL,A                ; 12d3 07
                LR   A,KU                ; 12d4 00
                ST                       ; 12d5 17
                LR   A,QL                ; 12d6 03
                JMP  $2501               ; 12d7 29 25 01
                OUT  $27                 ; 12da 27 27
                LR   IS,A                ; 12dc 0b
                EI                       ; 12dd 1b
                LR   H,DC                ; 12de 11
                OUT  $07                 ; 12df 27 07
                SL   1                   ; 12e1 13
                SL   1                   ; 12e2 13
                LR   A,KU                ; 12e3 00
                LR   W,J                 ; 12e4 1d
                LR   H,DC                ; 12e5 11
                LR   P,K                 ; 12e6 09
                LR   QL,A                ; 12e7 07
                LR   P,K                 ; 12e8 09
                LR   KL,A                ; 12e9 05
                LR   A,KU                ; 12ea 00
                LR   H,DC                ; 12eb 11
                EI                       ; 12ec 1b
                LR   H,DC                ; 12ed 11
                LR   A,KL                ; 12ee 01
                NOP                      ; 12ef 2b
                DS   $1                  ; 12f0 31
                SL   1                   ; 12f1 13
                NOP                      ; 12f2 2b
                LR   QL,A                ; 12f3 07
                LR   A,KL                ; 12f4 01
                NOP                      ; 12f5 2b
                LR   A,QL                ; 12f6 03
                LR   IS,A                ; 12f7 0b
                LR   A,KU                ; 12f8 00
                ST                       ; 12f9 17
                LR   A,QL                ; 12fa 03
                JMP  $2501               ; 12fb 29 25 01
                LR   A,KU                ; 12fe 00
                LR   P0,Q                ; 12ff 0d
                LR   A,KL                ; 1300 01
                NOP                      ; 1301 2b
                LR   KL,A                ; 1302 05
                SL   1                   ; 1303 13
                LR   A,QL                ; 1304 03
                LR   A,KU                ; 1305 00
                LR   P0,Q                ; 1306 0d
                LR   A,KL                ; 1307 01
                NOP                      ; 1308 2b
A1309:          LR   K,P                 ; 1309 08
                PI   $40a9               ; 130a 28 40 a9
                LISU 2                   ; 130d 62
                LISL 4                   ; 130e 6c
                LIS  $0                  ; 130f 70
                LR   (IS),A              ; 1310 5c
A1311:          PI   $43d6               ; 1311 28 43 d6
                BT   4,A1311             ; 1314 84 fc
                BF   $1,A1311            ; 1316 91 fa
                PI   $40bc               ; 1318 28 40 bc
                LR   A,$8                ; 131b 48
                PK                       ; 131c 0c
A131d:          NS   $0                  ; 131d f0
                LR   KU,A                ; 131e 04
                XS   $0                  ; 131f e0
                LR   KL,A                ; 1320 05
                LR   A,$0                ; 1321 40
                LR   KU,A                ; 1322 04
                LR   A,KU                ; 1323 00
A1324:          LR   K,P                 ; 1324 08
                LIS  $0                  ; 1325 70
                COM                      ; 1326 18
                LR   $3,A                ; 1327 53
                DCI  $0c30               ; 1328 2a 0c 30
                LIS  $2                  ; 132b 72
                LR   $4,A                ; 132c 54
                LIS  $6                  ; 132d 76
A132e:          LR   $0,A                ; 132e 50
A132f:          LIS  $a                  ; 132f 7a
                LR   $1,A                ; 1330 51
A1331:          LIS  $4                  ; 1331 74
                LR   $2,A                ; 1332 52
A1333:          LR   A,$3                ; 1333 43
                ST                       ; 1334 17
                COM                      ; 1335 18
                ST                       ; 1336 17
                DS   $2                  ; 1337 32
                BF   $4,A1333            ; 1338 94 fa
                DS   $1                  ; 133a 31
                BF   $4,A1331            ; 133b 94 f5
                LR   A,$3                ; 133d 43
                COM                      ; 133e 18
                LR   $3,A                ; 133f 53
                DS   $0                  ; 1340 30
                BF   $4,A132f            ; 1341 94 ed
                DS   $4                  ; 1343 34
                BT   4,A134c             ; 1344 84 07
                DCI  $0f10               ; 1346 2a 0f 10
                LIS  $2                  ; 1349 72
                BF   $0,A132e            ; 134a 90 e3
A134c:          LISU 3                   ; 134c 63
                LIS  $1                  ; 134d 71
                LR   $4,A                ; 134e 54
                DCI  $0c29               ; 134f 2a 0c 29
                LIS  $0                  ; 1352 70
                XM                       ; 1353 8c
                LR   $0,A                ; 1354 50
                LISL 7                   ; 1355 6f
                BF   $4,A1359            ; 1356 94 02
                LISL 0                   ; 1358 68
A1359:          LIS  $3                  ; 1359 73
                LR   $1,A                ; 135a 51
A135b:          LIS  $7                  ; 135b 77
                LR   $2,A                ; 135c 52
                DCI  A15c5               ; 135d 2a 15 c5
                LR   A,$1                ; 1360 41
                SL   1                   ; 1361 13
                ADC                      ; 1362 8e
                LM                       ; 1363 16
                LR   QU,A                ; 1364 06
                LM                       ; 1365 16
                LR   QL,A                ; 1366 07
                LR   A,$0                ; 1367 40
                NS   $0                  ; 1368 f0
                BF   $4,A1377            ; 1369 94 0d
                LR   A,(IS)+             ; 136b 4d
                BF   $0,A1370            ; 136c 90 03
A136e:          LR   A,$3                ; 136e 43
                SL   1                   ; 136f 13
A1370:          LR   $3,A                ; 1370 53
                NI   $80                 ; 1371 21 80
                BT   4,A13ae             ; 1373 84 3a
                BF   $0,A1381            ; 1375 90 0b
A1377:          LR   A,(IS)-             ; 1377 4e
                BF   $0,A137c            ; 1378 90 03
A137a:          LR   A,$3                ; 137a 43
                SR   1                   ; 137b 12
A137c:          LR   $3,A                ; 137c 53
                NI   $01                 ; 137d 21 01
                BT   4,A13ae             ; 137f 84 2e
A1381:          DCI  A15cd               ; 1381 2a 15 cd
                LR   A,$2                ; 1384 42
                ADC                      ; 1385 8e
                LM                       ; 1386 16
                LR   DC,Q                ; 1387 0f
                ADC                      ; 1388 8e
                LR   A,$4                ; 1389 44
                NS   $4                  ; 138a f4
                BF   $1,A139d            ; 138b 91 11
                LIS  $4                  ; 138d 74
                LR   $5,A                ; 138e 55
                LI   $20                 ; 138f 20 20
                ADC                      ; 1391 8e
                XDC                      ; 1392 2c
                DCI  A1f9e               ; 1393 2a 1f 9e
                BT   4,A13a5             ; 1396 84 0e
                DCI  A1f9a               ; 1398 2a 1f 9a
                BF   $0,A13a5            ; 139b 90 09
A139d:          LIS  $2                  ; 139d 72
                LR   $5,A                ; 139e 55
                LIS  $8                  ; 139f 78
                ADC                      ; 13a0 8e
                XDC                      ; 13a1 2c
                DCI  A1f97               ; 13a2 2a 1f 97
A13a5:          LM                       ; 13a5 16
                XDC                      ; 13a6 2c
                ST                       ; 13a7 17
                LIS  $7                  ; 13a8 77
                ADC                      ; 13a9 8e
                XDC                      ; 13aa 2c
                DS   $5                  ; 13ab 35
                BT   1,A13a5             ; 13ac 81 f8
A13ae:          DS   $2                  ; 13ae 32
                BF   $1,A13b7            ; 13af 91 07
                LR   A,$0                ; 13b1 40
                NS   $0                  ; 13b2 f0
                BF   $4,A137a            ; 13b3 94 c6
                BF   $0,A136e            ; 13b5 90 b8
A13b7:          DS   $1                  ; 13b7 31
                BT   1,A135b             ; 13b8 81 a2
                LR   A,$4                ; 13ba 44
                NS   $4                  ; 13bb f4
                BF   $1,A13ca            ; 13bc 91 0d
                DS   $4                  ; 13be 34
                BT   1,A1359             ; 13bf 81 99
                LISU 4                   ; 13c1 64
                LR   A,$0                ; 13c2 40
                NS   $0                  ; 13c3 f0
                LISL 3                   ; 13c4 6b
                BF   $4,A1359            ; 13c5 94 93
                LISL 0                   ; 13c7 68
                BF   $0,A1359            ; 13c8 90 90
A13ca:          PK                       ; 13ca 0c
A13cb:          LR   A,KL                ; 13cb 01
                SL   4                   ; 13cc 15
                OUTS 12                  ; 13cd bc
                SL   4                   ; 13ce 15
                OUTS 12                  ; 13cf bc
A13d0:          DCI  $0fdf               ; 13d0 2a 0f df
                LIS  $2                  ; 13d3 72
                SL   4                   ; 13d4 15
                ST                       ; 13d5 17
                LR   A,$0                ; 13d6 40
                SL   4                   ; 13d7 15
                LISL 4                   ; 13d8 6c
                LR   (IS),A              ; 13d9 5c
                LIS  $0                  ; 13da 70
                LR   $1,A                ; 13db 51
                POP                      ; 13dc 1c
                PK                       ; 13dd 0c
                DS   $0                  ; 13de 30
                PK                       ; 13df 0c
                BT   0,A13ed             ; 13e0 80 0c
                ASD  $0                  ; 13e2 d0
                LR   P0,Q                ; 13e3 0d
                LI   $0d                 ; 13e4 20 0d
                LIS  $0                  ; 13e6 70
                LR   P0,Q                ; 13e7 0d
                AS   $0                  ; 13e8 c0
                LR   DC,Q                ; 13e9 0f
                LR   DC,H                ; 13ea 10
                LR   DC,Q                ; 13eb 0f
                LISU 0                   ; 13ec 60
A13ed:          LR   K,P                 ; 13ed 08
                PI   $40a9               ; 13ee 28 40 a9
                DCI  $0f0c               ; 13f1 2a 0f 0c
                LIS  $7                  ; 13f4 77
                XM                       ; 13f5 8c
                LI   $ff                 ; 13f6 20 ff
                BT   4,A13fb             ; 13f8 84 02
                LIS  $1                  ; 13fa 71
A13fb:          LR   $3,A                ; 13fb 53
                LIS  $1                  ; 13fc 71
                LR   $4,A                ; 13fd 54
                BF   $0,A142e            ; 13fe 90 2f
A1400:          PI   A163f               ; 1400 28 16 3f
                LIS  $1                  ; 1403 71
                LR   $a,A                ; 1404 5a
                PI   $21ad               ; 1405 28 21 ad
                LR   $3,A                ; 1408 53
                LIS  $0                  ; 1409 70
                LR   $a,A                ; 140a 5a
                PI   $21ad               ; 140b 28 21 ad
                LR   $0,A                ; 140e 50
                PI   A1545               ; 140f 28 15 45
                LR   $4,A                ; 1412 54
                LR   A,$3                ; 1413 43
                LR   $0,A                ; 1414 50
                PI   A1545               ; 1415 28 15 45
                LR   $3,A                ; 1418 53
                PI   A163f               ; 1419 28 16 3f
                PI   A1555               ; 141c 28 15 55
                LIS  $4                  ; 141f 74
                LR   $0,A                ; 1420 50
A1421:          PI   A163f               ; 1421 28 16 3f
                DS   $0                  ; 1424 30
                BF   $4,A1421            ; 1425 94 fb
                PI   A1555               ; 1427 28 15 55
                LIS  $0                  ; 142a 70
                XS   $3                  ; 142b e3
                BT   4,A1476             ; 142c 84 49
A142e:          DCI  $0f0c               ; 142e 2a 0f 0c
                LM                       ; 1431 16
                LR   $1,A                ; 1432 51
                LISU 2                   ; 1433 62
                LISL 0                   ; 1434 68
                LIS  $0                  ; 1435 70
                LR   (IS)+,A             ; 1436 5d
                LM                       ; 1437 16
                LR   (IS)+,A             ; 1438 5d
                LM                       ; 1439 16
                LR   (IS),A              ; 143a 5c
                LIS  $0                  ; 143b 70
                XS   $3                  ; 143c e3
                BF   $1,A144e            ; 143d 91 10
                PI   $27d3               ; 143f 28 27 d3
                LIS  $7                  ; 1442 77
                XS   $1                  ; 1443 e1
                BF   $4,A1469            ; 1444 94 24
                LISL 2                   ; 1446 6a
                XS   (IS)                ; 1447 ec
                BT   4,A1469             ; 1448 84 20
A144a:          LIS  $0                  ; 144a 70
                LR   $3,A                ; 144b 53
                BF   $0,A1476            ; 144c 90 29
A144e:          PI   $27c6               ; 144e 28 27 c6
                LIS  $0                  ; 1451 70
                XS   $1                  ; 1452 e1
                BF   $4,A1459            ; 1453 94 05
                LISL 0                   ; 1455 68
                XS   (IS)                ; 1456 ec
                BF   $4,A144a            ; 1457 94 f2
A1459:          LISL 0                   ; 1459 68
                LIS  $0                  ; 145a 70
                XS   (IS)                ; 145b ec
                BT   4,A1476             ; 145c 84 19
                LISL 1                   ; 145e 69
                LR   A,(IS)+             ; 145f 4d
                LR   (IS),A              ; 1460 5c
                LISL 0                   ; 1461 68
                LR   A,(IS)+             ; 1462 4d
                LR   (IS)-,A             ; 1463 5e
                LIS  $0                  ; 1464 70
                LR   (IS),A              ; 1465 5c
                DS   $1                  ; 1466 31
                BF   $0,A1476            ; 1467 90 0e
A1469:          LISL 1                   ; 1469 69
                LIS  $0                  ; 146a 70
                XS   (IS)                ; 146b ec
                BF   $4,A1476            ; 146c 94 09
                LISL 2                   ; 146e 6a
                LR   A,(IS)-             ; 146f 4e
                LR   (IS)+,A             ; 1470 5d
                LIS  $0                  ; 1471 70
                LR   (IS)-,A             ; 1472 5e
                LIS  $1                  ; 1473 71
                AS   $1                  ; 1474 c1
                LR   $1,A                ; 1475 51
A1476:          LIS  $0                  ; 1476 70
                XS   $4                  ; 1477 e4
                BT   4,A1489             ; 1478 84 10
                DCI  $0f0f               ; 147a 2a 0f 0f
                AM                       ; 147d 88
                BF   $1,A1484            ; 147e 91 05
                CI   $4d                 ; 1480 25 4d
                BT   2,A1488             ; 1482 82 05
A1484:          LIS  $0                  ; 1484 70
                LR   $4,A                ; 1485 54
                BF   $0,A1489            ; 1486 90 02
A1488:          LR   $2,A                ; 1488 52
A1489:          LR   A,$4                ; 1489 44
                SL   1                   ; 148a 13
                XS   $3                  ; 148b e3
                BT   4,A14ab             ; 148c 84 1e
                PI   A150b               ; 148e 28 15 0b
                LIS  $0                  ; 1491 70
                XS   $4                  ; 1492 e4
                BT   4,A149e             ; 1493 84 0a
                DCI  $0f0f               ; 1495 2a 0f 0f
                LR   A,$2                ; 1498 42
                ST                       ; 1499 17
                LIS  $0                  ; 149a 70
                XS   $3                  ; 149b e3
                BT   4,A14a8             ; 149c 84 0b
A149e:          DCI  $0f0c               ; 149e 2a 0f 0c
                LR   A,$1                ; 14a1 41
                ST                       ; 14a2 17
                LISL 1                   ; 14a3 69
                LR   A,(IS)+             ; 14a4 4d
                ST                       ; 14a5 17
                LR   A,(IS)              ; 14a6 4c
                ST                       ; 14a7 17
A14a8:          PI   A150b               ; 14a8 28 15 0b
A14ab:          LIS  $0                  ; 14ab 70
                OUTS 1                   ; 14ac b1
                NOP                      ; 14ad 2b
                NOP                      ; 14ae 2b
                NOP                      ; 14af 2b
                INS  1                   ; 14b0 a1
                NI   $01                 ; 14b1 21 01
                DCI  $0c20               ; 14b3 2a 0c 20
                LIS  $0                  ; 14b6 70
                BF   $4,A14bd            ; 14b7 94 05
                ST                       ; 14b9 17
A14ba:          JMP  A1400               ; 14ba 29 14 00
A14bd:          LR   Q,DC                ; 14bd 0e
                XM                       ; 14be 8c
                BF   $4,A14ba            ; 14bf 94 fa
                LIS  $1                  ; 14c1 71
                LR   DC,Q                ; 14c2 0f
                ST                       ; 14c3 17
                LIS  $0                  ; 14c4 70
                LR   $0,A                ; 14c5 50
A14c6:          LR   A,$2                ; 14c6 42
                CI   $09                 ; 14c7 25 09
                BT   2,A14d4             ; 14c9 82 0a
                LR   A,$0                ; 14cb 40
                INC                      ; 14cc 1f
                LR   $0,A                ; 14cd 50
                LI   $f6                 ; 14ce 20 f6
                AS   $2                  ; 14d0 c2
                LR   $2,A                ; 14d1 52
                BF   $0,A14c6            ; 14d2 90 f3
A14d4:          LR   A,$0                ; 14d4 40
                LR   $2,A                ; 14d5 52
                AS   $1                  ; 14d6 c1
                NI   $01                 ; 14d7 21 01
                BT   4,A14ba             ; 14d9 84 e0
                DCI  $0c29               ; 14db 2a 0c 29
                LIS  $0                  ; 14de 70
                XM                       ; 14df 8c
                BT   1,A14e8             ; 14e0 81 07
                LIS  $7                  ; 14e2 77
                XS   $2                  ; 14e3 e2
                LR   $2,A                ; 14e4 52
                LIS  $7                  ; 14e5 77
                XS   $1                  ; 14e6 e1
                LR   $1,A                ; 14e7 51
A14e8:          LR   A,$2                ; 14e8 42
                SR   1                   ; 14e9 12
                LR   $4,A                ; 14ea 54
                DCI  A1503               ; 14eb 2a 15 03
                LR   A,$1                ; 14ee 41
                ADC                      ; 14ef 8e
                LM                       ; 14f0 16
                LR   $3,A                ; 14f1 53
                DCI  $0c2d               ; 14f2 2a 0c 2d
                LR   A,$1                ; 14f5 41
                ST                       ; 14f6 17
                LR   A,$2                ; 14f7 42
                ST                       ; 14f8 17
                PI   A163f               ; 14f9 28 16 3f
                PI   A166a               ; 14fc 28 16 6a
                PI   $40bc               ; 14ff 28 40 bc
                PK                       ; 1502 0c
A1503:          LR   K,P                 ; 1503 08
;                BT   0,4                 ; 1504 80 04
				db   $80,$04
                LR   A,$0                ; 1506 40
                LR   A,QU                ; 1507 02
                LI   $01                 ; 1508 20 01
                LR   DC,H                ; 150a 10
A150b:          LR   K,P                 ; 150b 08
                DCI  $0f0c               ; 150c 2a 0f 0c
                LM                       ; 150f 16
                LR   $0,A                ; 1510 50
                LISU 2                   ; 1511 62
                LISL 3                   ; 1512 6b
                LM                       ; 1513 16
                LR   (IS)+,A             ; 1514 5d
                LM                       ; 1515 16
                LR   (IS)-,A             ; 1516 5e
                LM                       ; 1517 16
                DCI  $0c30               ; 1518 2a 0c 30
                ADC                      ; 151b 8e
                ADC                      ; 151c 8e
                ADC                      ; 151d 8e
                ADC                      ; 151e 8e
                ADC                      ; 151f 8e
                ADC                      ; 1520 8e
                ADC                      ; 1521 8e
                ADC                      ; 1522 8e
                LR   A,$0                ; 1523 40
                ADC                      ; 1524 8e
                LIS  $3                  ; 1525 73
                LR   $0,A                ; 1526 50
A1527:          LR   Q,DC                ; 1527 0e
                LR   A,QU                ; 1528 02
                CI   $0e                 ; 1529 25 0e
                BF   $4,A1535            ; 152b 94 09
                LR   A,QL                ; 152d 03
                CI   $0f                 ; 152e 25 0f
                BT   2,A1535             ; 1530 82 04
                LIS  $f                  ; 1532 7f
                LR   QU,A                ; 1533 06
                LR   DC,Q                ; 1534 0f
A1535:          LR   A,(IS)+             ; 1535 4d
                LR   Q,DC                ; 1536 0e
                XM                       ; 1537 8c
                LR   DC,Q                ; 1538 0f
                ST                       ; 1539 17
                LR   Q,DC                ; 153a 0e
                LR   A,(IS)-             ; 153b 4e
                XM                       ; 153c 8c
                LR   DC,Q                ; 153d 0f
                ST                       ; 153e 17
                LIS  $6                  ; 153f 76
                ADC                      ; 1540 8e
                DS   $0                  ; 1541 30
                BF   $4,A1527            ; 1542 94 e4
                PK                       ; 1544 0c
A1545:          LR   A,$0                ; 1545 40
                CI   $40                 ; 1546 25 40
                BF   $2,A154e            ; 1548 92 05
                LI   $ff                 ; 154a 20 ff
                BF   $0,A1554            ; 154c 90 07
A154e:          CI   $c0                 ; 154e 25 c0
                LIS  $0                  ; 1550 70
                BT   2,A1554             ; 1551 82 02
                LIS  $1                  ; 1553 71
A1554:          POP                      ; 1554 1c
A1555:          LR   K,P                 ; 1555 08
                DCI  $0c21               ; 1556 2a 0c 21
                LIS  $0                  ; 1559 70
                XM                       ; 155a 8c
                BT   4,A1593             ; 155b 84 37
                LISU 2                   ; 155d 62
                LISL 3                   ; 155e 6b
                LM                       ; 155f 16
                LR   (IS)+,A             ; 1560 5d
                LM                       ; 1561 16
                LR   (IS)-,A             ; 1562 5e
                DCI  $0c29               ; 1563 2a 0c 29
                LIS  $0                  ; 1566 70
                XM                       ; 1567 8c
                BT   4,A1570             ; 1568 84 07
                LIS  $7                  ; 156a 77
                XS   (IS)                ; 156b ec
                LR   (IS)+,A             ; 156c 5d
                LIS  $7                  ; 156d 77
                XS   (IS)                ; 156e ec
                LR   (IS)-,A             ; 156f 5e
A1570:          DCI  $0be0               ; 1570 2a 0b e0
                LISL 4                   ; 1573 6c
                LIS  $5                  ; 1574 75
                SL   4                   ; 1575 15
A1576:          ADC                      ; 1576 8e
                DS   (IS)                ; 1577 3c
                BT   1,A1576             ; 1578 81 fd
                LR   Q,DC                ; 157a 0e
                LR   A,QU                ; 157b 02
                CI   $0e                 ; 157c 25 0e
                BF   $4,A1582            ; 157e 94 03
                LIS  $f                  ; 1580 7f
                LR   QU,A                ; 1581 06
A1582:          LR   DC,Q                ; 1582 0f
                LISL 3                   ; 1583 6b
                LR   A,(IS)              ; 1584 4c
                ADC                      ; 1585 8e
                LIS  $3                  ; 1586 73
                LR   $0,A                ; 1587 50
A1588:          LR   Q,DC                ; 1588 0e
                LI   $c0                 ; 1589 20 c0
                XM                       ; 158b 8c
                LR   DC,Q                ; 158c 0f
                ST                       ; 158d 17
                LIS  $7                  ; 158e 77
                ADC                      ; 158f 8e
                DS   $0                  ; 1590 30
                BF   $4,A1588            ; 1591 94 f6
A1593:          PK                       ; 1593 0c
A1594:          LR   QL,A                ; 1594 07
                LR   A,IS                ; 1595 0a
                LR   DC,Q                ; 1596 0f
                LR   IS,A                ; 1597 0b
                LR   A,KU                ; 1598 00
A1599:          DS   $3                  ; 1599 33
A159a:          DS   $3                  ; 159a 33
                LR   A,$3                ; 159b 43
                LI   $22                 ; 159c 20 22
                OI   $55                 ; 159e 22 55
                LR   $5,A                ; 15a0 55
                DS   $1                  ; 15a1 31
                LR   A,$5                ; 15a2 45
                LISU 6                   ; 15a3 66
                LISU 6                   ; 15a4 66
                LR   $5,A                ; 15a5 55
                LR   $5,A                ; 15a6 55
                DS   $0                  ; 15a7 30
                LR   DC,H                ; 15a8 10
                db   $5f                 
                XM                       ; 15aa 8c
                BR7  A159a               ; 15ab 8f ee
                LR   A,$8                ; 15ad 48
                LR   A,$8                ; 15ae 48
A15af:          LIS  $0                  ; 15af 70
                DS   (IS)                ; 15b0 3c
                SR   4                   ; 15b1 14
                LR   QL,A                ; 15b2 07
                LR   P0,Q                ; 15b3 0d
                LR   P0,Q                ; 15b4 0d
                POP                      ; 15b5 1c
                LR   A,$8                ; 15b6 48
                AS   $0                  ; 15b7 c0
                IN   $00                 ; 15b8 26 00
                LR   A,KL                ; 15ba 01
                BT   2,A15ec             ; 15bb 82 30
                LR   DC,H                ; 15bd 10
                db   $5f                 
                XM                       ; 15bf 8c
                BR7  A15af               ; 15c0 8f ee
                DS   (IS)                ; 15c2 3c
                SR   4                   ; 15c3 14
                LR   QL,A                ; 15c4 07
A15c5:          LR   DC,Q                ; 15c5 0f
                LR   DC,H                ; 15c6 10
                LR   P0,Q                ; 15c7 0d
                LIS  $0                  ; 15c8 70
                PK                       ; 15c9 0c
                ASD  $0                  ; 15ca d0
                PK                       ; 15cb 0c
                DS   $0                  ; 15cc 30
A15cd:          LR   $6,A                ; 15cd 56
                LR   $4,A                ; 15ce 54
                LR   $2,A                ; 15cf 52
                LR   $0,A                ; 15d0 50
                LR   QL,A                ; 15d1 07
                LR   KL,A                ; 15d2 05
                LR   A,QL                ; 15d3 03
                LR   A,KL                ; 15d4 01
A15d5:          LR   KL,A                ; 15d5 05
                SL   1                   ; 15d6 13
                LR   A,QL                ; 15d7 03
                LR   A,KU                ; 15d8 00
                JMP  A132f               ; 15d9 29 13 2f
                LR   IS,A                ; 15dc 0b
                LR   A,KU                ; 15dd 00
                LR   W,J                 ; 15de 1d
                LR   A,KL                ; 15df 01
                LR   P,K                 ; 15e0 09
                NI   $07                 ; 15e1 21 07
                LR   A,KU                ; 15e3 00
                DS   $5                  ; 15e4 35
                LR   A,KU                ; 15e5 00
                LR   A,KU                ; 15e6 00
                LR   A,KU                ; 15e7 00
                LR   A,KU                ; 15e8 00
                LR   KL,A                ; 15e9 05
                LR   A,KU                ; 15ea 00
                SL   1                   ; 15eb 13
A15ec:          LR   P,K                 ; 15ec 09
                LR   A,KU                ; 15ed 00
                NOP                      ; 15ee 2b
; Opponent-selection menu: ABE, BETTY, CHARLIE and DOROTHY.
; A/B/C/D select opponent settings; these names are not known credits.
A15ef:          LR   QL,A                ; 15ef 07
                SL   1                   ; 15f0 13
                LR   A,KU                ; 15f1 00
                CI   $27                 ; 15f2 25 27
                LR   H,DC                ; 15f4 11
                LR   KL,A                ; 15f5 05
                LR   A,KU                ; 15f6 00
                LR   A,KU                ; 15f7 00
                LR   A,KU                ; 15f8 00
                LR   A,KU                ; 15f9 00
                LR   A,KU                ; 15fa 00
                LR   QL,A                ; 15fb 07
                LR   KL,A                ; 15fc 05
                CI   $0b                 ; 15fd 25 0b
                LR   A,KU                ; 15ff 00
                LR   A,KU                ; 1600 00
                LR   H,DC                ; 1601 11
                db   $2d                 
                LR   IS,A                ; 1603 0b
                LR   A,KU                ; 1604 00
                LR   A,KU                ; 1605 00
                LR   A,KU                ; 1606 00
                LR   A,KU                ; 1607 00
                LR   A,KU                ; 1608 00
                LR   A,KU                ; 1609 00
                LR   A,KU                ; 160a 00
                LR   A,KU                ; 160b 00
                LR   H,DC                ; 160c 11
                LR   A,KU                ; 160d 00
                LR   A,KU                ; 160e 00
                LR   A,KU                ; 160f 00
                LR   A,KU                ; 1610 00
                db   $2d                 
                LR   IS,A                ; 1612 0b
                LR   QL,A                ; 1613 07
                LR   QL,A                ; 1614 07
                LR   KL,A                ; 1615 05
                LR   A,KU                ; 1616 00
                LR   A,KU                ; 1617 00
                LR   A,KU                ; 1618 00
                LR   A,KU                ; 1619 00
                LR   A,KU                ; 161a 00
                LR   A,KU                ; 161b 00
                db   $2d                 
                LR   A,KU                ; 161d 00
                LR   A,KU                ; 161e 00
                LR   A,KU                ; 161f 00
                LR   A,KU                ; 1620 00
                DS   $1                  ; 1621 31
                LNK                      ; 1622 19
                LR   H,DC                ; 1623 11
                LR   P,K                 ; 1624 09
                OUT  $01                 ; 1625 27 01
                LR   IS,A                ; 1627 0b
                LR   A,KU                ; 1628 00
                LR   A,KU                ; 1629 00
                LR   A,KU                ; 162a 00
                LR   A,KU                ; 162b 00
                DS   $1                  ; 162c 31
                LR   A,KU                ; 162d 00
                LR   A,KU                ; 162e 00
                LR   A,KU                ; 162f 00
                LR   A,KU                ; 1630 00
                INC                      ; 1631 1f
                SL   1                   ; 1632 13
                LR   P,K                 ; 1633 09
                SL   1                   ; 1634 13
                LR   QL,A                ; 1635 07
                LNK                      ; 1636 19
                LR   KL,A                ; 1637 05
                LR   A,KU                ; 1638 00
                LR   A,KU                ; 1639 00
                LR   A,KU                ; 163a 00
                LR   A,KU                ; 163b 00
                INC                      ; 163c 1f
                LR   A,KU                ; 163d 00
                LR   A,KU                ; 163e 00
A163f:          LR   K,P                 ; 163f 08
                PI   $40a9               ; 1640 28 40 a9
                PI   A1687               ; 1643 28 16 87
                PI   $4501               ; 1646 28 45 01
                DCI  $0fea               ; 1649 2a 0f ea
                LI   $01                 ; 164c 20 01
                XM                       ; 164e 8c
                DCI  $08f7               ; 164f 2a 08 f7
                ST                       ; 1652 17
                PI   $424d               ; 1653 28 42 4d
                LI   $34                 ; 1656 20 34
A1658:          DCI  $08fb               ; 1658 2a 08 fb
                CM                       ; 165b 8d
                BF   $4,A1658            ; 165c 94 fb
                DCI  $0fea               ; 165e 2a 0f ea
                LM                       ; 1661 16
                DCI  $08f7               ; 1662 2a 08 f7
                ST                       ; 1665 17
                PI   $40bc               ; 1666 28 40 bc
                PK                       ; 1669 0c
A166a:          LI   $16                 ; 166a 20 16
                OUTS 12                  ; 166c bc
                LI   $aa                 ; 166d 20 aa
                OUTS 13                  ; 166f bd
                DCI  $08f0               ; 1670 2a 08 f0
                LI   $fa                 ; 1673 20 fa
                ST                       ; 1675 17
                DCI  $0fea               ; 1676 2a 0f ea
                LR   Q,DC                ; 1679 0e
                LIS  $8                  ; 167a 78
                OM                       ; 167b 8b
                LR   DC,Q                ; 167c 0f
                ST                       ; 167d 17
                DCI  $08f7               ; 167e 2a 08 f7
                ST                       ; 1681 17
                LIS  $1                  ; 1682 71
                OUTS 14                  ; 1683 be
                EI                       ; 1684 1b
                LR   J,W                 ; 1685 1e
                POP                      ; 1686 1c
A1687:          DI                       ; 1687 1a
                LR   J,W                 ; 1688 1e
                DCI  $0fea               ; 1689 2a 0f ea
                LR   Q,DC                ; 168c 0e
                LIS  $8                  ; 168d 78
                COM                      ; 168e 18
                NM                       ; 168f 8a
                LR   DC,Q                ; 1690 0f
                ST                       ; 1691 17
                DCI  $08f7               ; 1692 2a 08 f7
                ST                       ; 1695 17
                LIS  $0                  ; 1696 70
                OUTS 14                  ; 1697 be
                POP                      ; 1698 1c
A1699:          LR   K,P                 ; 1699 08
                LISU 3                   ; 169a 63
                LISL 0                   ; 169b 68
A169c:          LR   A,(IS)+             ; 169c 4d
                ST                       ; 169d 17
                BR7  A169c               ; 169e 8f fd
                LR   A,(IS)+             ; 16a0 4d
                ST                       ; 16a1 17
                LISU 4                   ; 16a2 64
A16a3:          LR   A,(IS)+             ; 16a3 4d
                ST                       ; 16a4 17
                BR7  A16a3               ; 16a5 8f fd
                LR   A,(IS)+             ; 16a7 4d
                ST                       ; 16a8 17
                PK                       ; 16a9 0c
                LR   $8,A                ; 16aa 58
                LR   A,IS                ; 16ab 0a
                LISU 6                   ; 16ac 66
                LISL 0                   ; 16ad 68
                LR   (IS)+,A             ; 16ae 5d
                LR   A,$a                ; 16af 4a
                LR   (IS)+,A             ; 16b0 5d
                LR   A,$b                ; 16b1 4b
                LR   (IS)+,A             ; 16b2 5d
                LR   A,$9                ; 16b3 49
                LR   (IS)+,A             ; 16b4 5d
                LR   H,DC                ; 16b5 11
                DCI  $0fc8               ; 16b6 2a 0f c8
                LR   A,$a                ; 16b9 4a
                ST                       ; 16ba 17
                LR   A,$b                ; 16bb 4b
                ST                       ; 16bc 17
                XDC                      ; 16bd 2c
                LR   H,DC                ; 16be 11
                XDC                      ; 16bf 2c
                LR   A,$a                ; 16c0 4a
                ST                       ; 16c1 17
                LR   A,$b                ; 16c2 4b
                ST                       ; 16c3 17
                LR   A,KU                ; 16c4 00
                ST                       ; 16c5 17
                LR   A,KL                ; 16c6 01
                ST                       ; 16c7 17
                LR   K,P                 ; 16c8 08
                LR   A,KU                ; 16c9 00
                ST                       ; 16ca 17
                LR   A,KL                ; 16cb 01
                ST                       ; 16cc 17
                LR   J,W                 ; 16cd 1e
                LISU 2                   ; 16ce 62
                LISL 3                   ; 16cf 6b
A16d0:          LR   A,(IS)-             ; 16d0 4e
                ST                       ; 16d1 17
                BR7  A16d0               ; 16d2 8f fd
                DCI  $0fea               ; 16d4 2a 0f ea
                LI   $01                 ; 16d7 20 01
                XM                       ; 16d9 8c
                DCI  $08f7               ; 16da 2a 08 f7
                ST                       ; 16dd 17
                PI   $424d               ; 16de 28 42 4d
                LI   $34                 ; 16e1 20 34
A16e3:          DCI  $08fb               ; 16e3 2a 08 fb
                CM                       ; 16e6 8d
                BF   $4,A16e3            ; 16e7 94 fb
                DCI  $0fea               ; 16e9 2a 0f ea
                LM                       ; 16ec 16
                DCI  $08f7               ; 16ed 2a 08 f7
                ST                       ; 16f0 17
                DCI  $0fc8               ; 16f1 2a 0f c8
                LM                       ; 16f4 16
                LR   $a,A                ; 16f5 5a
                LM                       ; 16f6 16
                LR   $b,A                ; 16f7 5b
                XDC                      ; 16f8 2c
                LR   DC,H                ; 16f9 10
                XDC                      ; 16fa 2c
                LM                       ; 16fb 16
                LR   $a,A                ; 16fc 5a
                LM                       ; 16fd 16
                LR   $b,A                ; 16fe 5b
                LIS  $2                  ; 16ff 72
                ADC                      ; 1700 8e
                LM                       ; 1701 16
                LR   KU,A                ; 1702 04
                LM                       ; 1703 16
                LR   KL,A                ; 1704 05
                LR   P,K                 ; 1705 09
                LISU 2                   ; 1706 62
                LISL 3                   ; 1707 6b
A1708:          LM                       ; 1708 16
                LR   (IS)-,A             ; 1709 5e
                BR7  A1708               ; 170a 8f fd
                DCI  $0fcc               ; 170c 2a 0f cc
                LM                       ; 170f 16
                LR   KU,A                ; 1710 04
                LM                       ; 1711 16
                LR   KL,A                ; 1712 05
                LR   DC,H                ; 1713 10
                XDC                      ; 1714 2c
                LR   W,J                 ; 1715 1d
                LISU 6                   ; 1716 66
                LISL 3                   ; 1717 6b
                LR   A,(IS)-             ; 1718 4e
                LR   $9,A                ; 1719 59
                LR   A,(IS)-             ; 171a 4e
                LR   $b,A                ; 171b 5b
                LR   A,(IS)-             ; 171c 4e
                LR   $a,A                ; 171d 5a
                LR   A,(IS)-             ; 171e 4e
                LR   IS,A                ; 171f 0b
                LR   A,$8                ; 1720 48
                EI                       ; 1721 1b
                POP                      ; 1722 1c
A1723:          LR   K,P                 ; 1723 08
                LIS  $f                  ; 1724 7f
                LR   $1,A                ; 1725 51
A1726:          LIS  $0                  ; 1726 70
                LR   $2,A                ; 1727 52
A1728:          DS   $2                  ; 1728 32
                BF   $4,A1728            ; 1729 94 fe
                DS   $1                  ; 172b 31
                BF   $4,A1726            ; 172c 94 f9
                PK                       ; 172e 0c
A172f:          PI   A1324               ; 172f 28 13 24
                LIS  $7                  ; 1732 77
                BF   $0,A1747            ; 1733 90 13
A1735:          LIS  $1                  ; 1735 71
                SL   4                   ; 1736 15
                LR   $b,A                ; 1737 5b
                LR   DC,H                ; 1738 10
                PI   A1a39               ; 1739 28 1a 39
                LR   DC,H                ; 173c 10
                PI   A1a28               ; 173d 28 1a 28
                LR   A,$7                ; 1740 47
                COM                      ; 1741 18
                LR   $7,A                ; 1742 57
                PI   A1324               ; 1743 28 13 24
                LIS  $8                  ; 1746 78
A1747:          LR   $0,A                ; 1747 50
                PI   A125b               ; 1748 28 12 5b
                PI   A163f               ; 174b 28 16 3f
                PI   A166a               ; 174e 28 16 6a
                LI   $40                 ; 1751 20 40
                LR   $3,A                ; 1753 53
A1754:          PI   A1723               ; 1754 28 17 23
                DS   $3                  ; 1757 33
                BF   $4,A1754            ; 1758 94 fb
                PI   A163f               ; 175a 28 16 3f
                DCI  $0872               ; 175d 2a 08 72
                LI   $82                 ; 1760 20 82
                ST                       ; 1762 17
                LR   A,$0                ; 1763 40
                LR   $6,A                ; 1764 56
                LIS  $d                  ; 1765 7d
                LR   $1,A                ; 1766 51
A1767:          LIS  $7                  ; 1767 77
                XS   $6                  ; 1768 e6
                DCI  A1fa3               ; 1769 2a 1f a3
                BF   $4,A1771            ; 176c 94 04
                DCI  A1fcd               ; 176e 2a 1f cd
A1771:          LR   A,$1                ; 1771 41
                SL   1                   ; 1772 13
                AS   $1                  ; 1773 c1
                ADC                      ; 1774 8e
                LISU 4                   ; 1775 64
                LISL 4                   ; 1776 6c
                LM                       ; 1777 16
                LR   (IS)-,A             ; 1778 5e
                LM                       ; 1779 16
                LR   (IS),A              ; 177a 5c
                LM                       ; 177b 16
                LR   $5,A                ; 177c 55
                PI   $46d6               ; 177d 28 46 d6
A1780:          PI   $41c8               ; 1780 28 41 c8
                DS   $5                  ; 1783 35
                BF   $4,A1780            ; 1784 94 fb
                DS   $1                  ; 1786 31
                BT   1,A1767             ; 1787 81 df
                LI   $a0                 ; 1789 20 a0
                LR   $1,A                ; 178b 51
A178c:          PI   A163f               ; 178c 28 16 3f
                DS   $1                  ; 178f 31
                BF   $4,A178c            ; 1790 94 fb
                JMP  $4000               ; 1792 29 40 00
A1795:          DCI  $0c2a               ; 1795 2a 0c 2a
                LIS  $2                  ; 1798 72
                CM                       ; 1799 8d
                BT   2,A17a2             ; 179a 82 07
                PI   A1324               ; 179c 28 13 24
A179f:          JMP  A112d               ; 179f 29 11 2d
A17a2:          PI   A163f               ; 17a2 28 16 3f
                DCI  $0872               ; 17a5 2a 08 72
                LI   $82                 ; 17a8 20 82
                ST                       ; 17aa 17
                LISU 4                   ; 17ab 64
                LISL 4                   ; 17ac 6c
                LI   $30                 ; 17ad 20 30
                LR   (IS)-,A             ; 17af 5e
                LIS  $3                  ; 17b0 73
                LR   (IS),A              ; 17b1 5c
                PI   $46d6               ; 17b2 28 46 d6
                LIS  $f                  ; 17b5 7f
                LR   $6,A                ; 17b6 56
A17b7:          PI   $41c8               ; 17b7 28 41 c8
                DS   $6                  ; 17ba 36
                BF   $4,A17b7            ; 17bb 94 fb
                PI   A1687               ; 17bd 28 16 87
                LIS  $5                  ; 17c0 75
                LR   $6,A                ; 17c1 56
A17c2:          DCI  $0e20               ; 17c2 2a 0e 20
                PI   A1a28               ; 17c5 28 1a 28
                DCI  $0e30               ; 17c8 2a 0e 30
                LR   Q,DC                ; 17cb 0e
                PI   A1a39               ; 17cc 28 1a 39
                LR   DC,Q                ; 17cf 0f
                PI   A1a28               ; 17d0 28 1a 28
                PI   $41c8               ; 17d3 28 41 c8
                PI   A166a               ; 17d6 28 16 6a
                PI   A1324               ; 17d9 28 13 24
                LI   $20                 ; 17dc 20 20
                LR   $3,A                ; 17de 53
A17df:          PI   A163f               ; 17df 28 16 3f
                DS   $3                  ; 17e2 33
                BF   $4,A17df            ; 17e3 94 fb
                DCI  $0e10               ; 17e5 2a 0e 10
                PI   A1a28               ; 17e8 28 1a 28
                PI   A166a               ; 17eb 28 16 6a
                PI   A1324               ; 17ee 28 13 24
                LI   $20                 ; 17f1 20 20
                LR   $3,A                ; 17f3 53
A17f4:          PI   A163f               ; 17f4 28 16 3f
                DS   $3                  ; 17f7 33
                BF   $4,A17f4            ; 17f8 94 fb
                DS   $6                  ; 17fa 36
                BF   $4,A17c2            ; 17fb 94 c6
                BF   $0,A179f            ; 17fd 90 a1
A17ff:          LISU 3                   ; 17ff 63
                LISL 0                   ; 1800 68
                LR   DC,H                ; 1801 10
                LIS  $c                  ; 1802 7c
                ADC                      ; 1803 8e
                LM                       ; 1804 16
                LR   $0,A                ; 1805 50
                NS   $0                  ; 1806 f0
                BF   $4,A180c            ; 1807 94 04
                JMP  A1aa8               ; 1809 29 1a a8
A180c:          LIS  $0                  ; 180c 70
                COM                      ; 180d 18
                ADC                      ; 180e 8e
                AS   $0                  ; 180f c0
                NS   $0                  ; 1810 f0
                ST                       ; 1811 17
                XS   $0                  ; 1812 e0
                LR   $6,A                ; 1813 56
                LM                       ; 1814 16
                LR   $5,A                ; 1815 55
                SR   1                   ; 1816 12
                SR   1                   ; 1817 12
                NI   $03                 ; 1818 21 03
                LR   $4,A                ; 181a 54
                LR   A,$5                ; 181b 45
                NI   $13                 ; 181c 21 13
                LR   $5,A                ; 181e 55
                LI   $18                 ; 181f 20 18
                AS   $4                  ; 1821 c4
                LR   IS,A                ; 1822 0b
                LR   A,(IS)              ; 1823 4c
                LR   $3,A                ; 1824 53
                XS   $6                  ; 1825 e6
                LR   (IS),A              ; 1826 5c
                LISU 4                   ; 1827 64
                LR   A,(IS)              ; 1828 4c
                NS   $6                  ; 1829 f6
                BT   4,A182f             ; 182a 84 04
                XS   (IS)                ; 182c ec
                LR   (IS),A              ; 182d 5c
                LIS  $7                  ; 182e 77
A182f:          LR   $2,A                ; 182f 52
                LISU 3                   ; 1830 63
                LR   A,$6                ; 1831 46
                SR   4                   ; 1832 14
                BT   4,A1844             ; 1833 84 10
                LR   $3,A                ; 1835 53
                LIS  $1                  ; 1836 71
                NS   $5                  ; 1837 f5
                BT   4,A183d             ; 1838 84 04
                LR   A,$3                ; 183a 43
                SR   1                   ; 183b 12
                LR   $3,A                ; 183c 53
A183d:          LIS  $2                  ; 183d 72
                NS   $5                  ; 183e f5
                BT   4,A1853             ; 183f 84 13
                LR   A,(IS)-             ; 1841 4e
                BF   $0,A1853            ; 1842 90 10
A1844:          LR   A,$6                ; 1844 46
                SL   4                   ; 1845 15
                LR   $3,A                ; 1846 53
                LIS  $1                  ; 1847 71
                NS   $5                  ; 1848 f5
                BF   $4,A184e            ; 1849 94 04
                LR   A,$3                ; 184b 43
                SL   1                   ; 184c 13
                LR   $3,A                ; 184d 53
A184e:          LIS  $2                  ; 184e 72
                NS   $5                  ; 184f f5
                BF   $4,A1853            ; 1850 94 02
                LR   A,(IS)+             ; 1852 4d
A1853:          LR   A,$5                ; 1853 45
                SR   4                   ; 1854 14
                BF   $4,A185a            ; 1855 94 04
                JMP  A1926               ; 1857 29 19 26
A185a:          LR   A,IS                ; 185a 0a
                AI   $04                 ; 185b 24 04
                LR   IS,A                ; 185d 0b
                LR   A,(IS)              ; 185e 4c
                XS   $3                  ; 185f e3
                LR   (IS),A              ; 1860 5c
                LR   A,IS                ; 1861 0a
                AI   $04                 ; 1862 24 04
                LR   IS,A                ; 1864 0b
                LR   A,(IS)              ; 1865 4c
                NS   $3                  ; 1866 f3
                BT   4,A186f             ; 1867 84 07
                XS   (IS)                ; 1869 ec
                LR   (IS),A              ; 186a 5c
                LIS  $2                  ; 186b 72
                COM                      ; 186c 18
                BF   $0,A1871            ; 186d 90 03
A186f:          LIS  $1                  ; 186f 71
                COM                      ; 1870 18
A1871:          LR   $0,A                ; 1871 50
                LI   $27                 ; 1872 20 27
                LR   IS,A                ; 1874 0b
                LR   A,(IS)              ; 1875 4c
                AS   $0                  ; 1876 c0
                LR   (IS),A              ; 1877 5c
                LI   $18                 ; 1878 20 18
                AS   $4                  ; 187a c4
                LR   IS,A                ; 187b 0b
                LIS  $2                  ; 187c 72
                NS   $5                  ; 187d f5
                BT   4,A1883             ; 187e 84 04
                LR   A,(IS)-             ; 1880 4e
                BF   $0,A1884            ; 1881 90 02
A1883:          LR   A,(IS)+             ; 1883 4d
A1884:          LR   A,IS                ; 1884 0a
                AI   $e8                 ; 1885 24 e8
                LR   $4,A                ; 1887 54
                LIS  $1                  ; 1888 71
                NS   $5                  ; 1889 f5
                LR   A,$6                ; 188a 46
                BT   4,A1890             ; 188b 84 04
                SR   1                   ; 188d 12
                BF   $0,A1891            ; 188e 90 02
A1890:          SL   1                   ; 1890 13
A1891:          LR   $3,A                ; 1891 53
                LR   $1,A                ; 1892 51
                LR   A,(IS)              ; 1893 4c
                XS   $3                  ; 1894 e3
                LR   (IS),A              ; 1895 5c
                LIS  $0                  ; 1896 70
                AS   $2                  ; 1897 c2
                BT   4,A189e             ; 1898 84 05
                LIS  $0                  ; 189a 70
                LR   $0,A                ; 189b 50
                BF   $0,A18b7            ; 189c 90 1a
A189e:          LIS  $2                  ; 189e 72
                NS   $5                  ; 189f f5
                LR   A,IS                ; 18a0 0a
                BT   4,A18ab             ; 18a1 84 09
                CI   $18                 ; 18a3 25 18
                BF   $4,A18cd            ; 18a5 94 27
                LIS  $f                  ; 18a7 7f
                SL   4                   ; 18a8 15
                BF   $0,A18b0            ; 18a9 90 06
A18ab:          CI   $1b                 ; 18ab 25 1b
                BF   $4,A18cd            ; 18ad 94 1f
                LIS  $f                  ; 18af 7f
A18b0:          NS   $3                  ; 18b0 f3
                BT   4,A18cd             ; 18b1 84 1b
                LIS  $1                  ; 18b3 71
                LR   $2,A                ; 18b4 52
                LR   $0,A                ; 18b5 50
                LR   $6,A                ; 18b6 56
A18b7:          LISU 4                   ; 18b7 64
                LR   A,(IS)              ; 18b8 4c
                AS   $3                  ; 18b9 c3
                LR   (IS),A              ; 18ba 5c
                LIS  $0                  ; 18bb 70
                XS   $0                  ; 18bc e0
                BT   4,A18cd             ; 18bd 84 0f
                LISU 4                   ; 18bf 64
                LISL 6                   ; 18c0 6e
                LR   A,(IS)              ; 18c1 4c
                INC                      ; 18c2 1f
                LR   (IS),A              ; 18c3 5c
                BF   $0,A18ca            ; 18c4 90 05
                LIS  $0                  ; 18c6 70
                XS   $0                  ; 18c7 e0
                BT   4,A18cd             ; 18c8 84 04
A18ca:          JMP  A1956               ; 18ca 29 19 56
A18cd:          LR   A,$b                ; 18cd 4b
                SR   4                   ; 18ce 14
                CI   $0c                 ; 18cf 25 0c
                BF   $1,A18ca            ; 18d1 91 f8
                CI   $01                 ; 18d3 25 01
                BF   $4,A18de            ; 18d5 94 08
                DCI  $0ed0               ; 18d7 2a 0e d0
                LIS  $0                  ; 18da 70
                ST                       ; 18db 17
                BF   $0,A1917            ; 18dc 90 3a
A18de:          DCI  $0fb0               ; 18de 2a 0f b0
                AI   $fe                 ; 18e1 24 fe
                ADC                      ; 18e3 8e
                LM                       ; 18e4 16
                LR   $2,A                ; 18e5 52
                LIS  $0                  ; 18e6 70
                ST                       ; 18e7 17
                LR   DC,H                ; 18e8 10
                LI   $1c                 ; 18e9 20 1c
                ADC                      ; 18eb 8e
                LR   A,$3                ; 18ec 43
                ST                       ; 18ed 17
                LR   A,$4                ; 18ee 44
                ST                       ; 18ef 17
                LIS  $0                  ; 18f0 70
                COM                      ; 18f1 18
                ST                       ; 18f2 17
                LR   A,$2                ; 18f3 42
                ST                       ; 18f4 17
                DCI  $0eec               ; 18f5 2a 0e ec
                LR   A,$b                ; 18f8 4b
                SR   4                   ; 18f9 14
                SL   1                   ; 18fa 13
                ADC                      ; 18fb 8e
                LR   Q,DC                ; 18fc 0e
                XDC                      ; 18fd 2c
                LR   DC,Q                ; 18fe 0f
                LIS  $4                  ; 18ff 74
                ADC                      ; 1900 8e
                LIS  $2                  ; 1901 72
                LR   $0,A                ; 1902 50
A1903:          XDC                      ; 1903 2c
                LM                       ; 1904 16
                XDC                      ; 1905 2c
                ST                       ; 1906 17
                XDC                      ; 1907 2c
                CI   $c1                 ; 1908 25 c1
                LM                       ; 190a 16
                XDC                      ; 190b 2c
                BF   $4,A190f            ; 190c 94 02
                INC                      ; 190e 1f
A190f:          ST                       ; 190f 17
                DS   $0                  ; 1910 30
                BF   $4,A1903            ; 1911 94 f1
                LIS  $2                  ; 1913 72
                SL   4                   ; 1914 15
                AS   $b                  ; 1915 cb
                LR   $b,A                ; 1916 5b
A1917:          LR   DC,H                ; 1917 10
                PI   A1699               ; 1918 28 16 99
                PI   A1f72               ; 191b 28 1f 72
                LR   A,$3                ; 191e 43
                LR   $1,A                ; 191f 51
                LIS  $0                  ; 1920 70
                LR   $2,A                ; 1921 52
                LR   $6,A                ; 1922 56
                JMP  A1b25               ; 1923 29 1b 25
A1926:          LR   DC,H                ; 1926 10
                LIS  $0                  ; 1927 70
                LR   $0,A                ; 1928 50
                LISU 3                   ; 1929 63
                LR   A,(IS)              ; 192a 4c
                AS   $3                  ; 192b c3
                LR   (IS),A              ; 192c 5c
                LR   A,$2                ; 192d 42
                NS   $2                  ; 192e f2
                BF   $4,A1948            ; 192f 94 18
                LIS  $2                  ; 1931 72
                NS   $5                  ; 1932 f5
                LR   A,IS                ; 1933 0a
                BT   4,A193e             ; 1934 84 09
                CI   $18                 ; 1936 25 18
                BF   $4,A1956            ; 1938 94 1d
                LIS  $f                  ; 193a 7f
                SL   4                   ; 193b 15
                BF   $0,A1943            ; 193c 90 06
A193e:          CI   $1b                 ; 193e 25 1b
                BF   $4,A1956            ; 1940 94 15
                LIS  $f                  ; 1942 7f
A1943:          NS   $3                  ; 1943 f3
                BT   4,A1956             ; 1944 84 11
                LIS  $1                  ; 1946 71
                LR   $0,A                ; 1947 50
A1948:          LISU 4                   ; 1948 64
                LR   A,(IS)              ; 1949 4c
                AS   $3                  ; 194a c3
                LR   (IS),A              ; 194b 5c
                LIS  $0                  ; 194c 70
                AS   $0                  ; 194d c0
                BT   4,A1956             ; 194e 84 07
                LI   $26                 ; 1950 20 26
                LR   IS,A                ; 1952 0b
                LR   A,(IS)              ; 1953 4c
                INC                      ; 1954 1f
                LR   (IS),A              ; 1955 5c
A1956:          LR   A,$b                ; 1956 4b
                SR   4                   ; 1957 14
                CI   $01                 ; 1958 25 01
                BF   $4,A195f            ; 195a 94 04
                JMP  A19b8               ; 195c 29 19 b8
A195f:          LR   A,$7                ; 195f 47
                COM                      ; 1960 18
                LR   $7,A                ; 1961 57
                LIS  $1                  ; 1962 71
                SL   4                   ; 1963 15
                AS   $b                  ; 1964 cb
                LR   $b,A                ; 1965 5b
                LR   DC,H                ; 1966 10
                PI   A1a39               ; 1967 28 1a 39
                LR   A,$b                ; 196a 4b
                SR   4                   ; 196b 14
                CI   $03                 ; 196c 25 03
                BF   $1,A197c            ; 196e 91 0d
                BF   $4,A1996            ; 1970 94 25
                DCI  $0ef4               ; 1972 2a 0e f4
                LI   $c1                 ; 1975 20 c1
                ST                       ; 1977 17
                INC                      ; 1978 1f
                ST                       ; 1979 17
                BF   $0,A1996            ; 197a 90 1b
A197c:          SL   1                   ; 197c 13
                DCI  $0eee               ; 197d 2a 0e ee
                ADC                      ; 1980 8e
                LR   Q,DC                ; 1981 0e
                XDC                      ; 1982 2c
                LR   DC,Q                ; 1983 0f
                LIS  $3                  ; 1984 73
                COM                      ; 1985 18
                ADC                      ; 1986 8e
                LM                       ; 1987 16
                XDC                      ; 1988 2c
                ST                       ; 1989 17
                XDC                      ; 198a 2c
                CI   $c1                 ; 198b 25 c1
                LM                       ; 198d 16
                XDC                      ; 198e 2c
                BF   $4,A1992            ; 198f 94 02
                INC                      ; 1991 1f
A1992:          ST                       ; 1992 17
A1993:          JMP  A1b08               ; 1993 29 1b 08
A1996:          DCI  $0c2a               ; 1996 2a 0c 2a
                LR   Q,DC                ; 1999 0e
                LM                       ; 199a 16
                CI   $01                 ; 199b 25 01
                BF   $1,A1993            ; 199d 91 f5
                INC                      ; 199f 1f
                LR   DC,Q                ; 19a0 0f
                ST                       ; 19a1 17
                LIS  $0                  ; 19a2 70
                DCI  $0ed0               ; 19a3 2a 0e d0
                ST                       ; 19a6 17
                LR   DC,H                ; 19a7 10
                XDC                      ; 19a8 2c
                DCI  $0e10               ; 19a9 2a 0e 10
                LR   H,DC                ; 19ac 11
                LIS  $1                  ; 19ad 71
                SL   4                   ; 19ae 15
                LISU 2                   ; 19af 62
                LISL 0                   ; 19b0 68
                LR   (IS),A              ; 19b1 5c
                PI   $43cd               ; 19b2 28 43 cd
                JMP  A1b08               ; 19b5 29 1b 08
A19b8:          PI   A1324               ; 19b8 28 13 24
                LIS  $4                  ; 19bb 74
                LR   $0,A                ; 19bc 50
                PI   A125b               ; 19bd 28 12 5b
                DCI  $0ef2               ; 19c0 2a 0e f2
                LI   $c1                 ; 19c3 20 c1
                ST                       ; 19c5 17
                ST                       ; 19c6 17
                ST                       ; 19c7 17
                INC                      ; 19c8 1f
                ST                       ; 19c9 17
                LR   A,$7                ; 19ca 47
                COM                      ; 19cb 18
                LR   $7,A                ; 19cc 57
                DCI  $0e20               ; 19cd 2a 0e 20
                LR   H,DC                ; 19d0 11
                PI   A1a39               ; 19d1 28 1a 39
                LR   DC,H                ; 19d4 10
                PI   A1a28               ; 19d5 28 1a 28
                DCI  $0c2a               ; 19d8 2a 0c 2a
                LR   Q,DC                ; 19db 0e
                LM                       ; 19dc 16
                INC                      ; 19dd 1f
                LR   DC,Q                ; 19de 0f
                ST                       ; 19df 17
                CI   $01                 ; 19e0 25 01
                BT   4,A19e7             ; 19e2 84 04
                JMP  A1b08               ; 19e4 29 1b 08
A19e7:          LISU 2                   ; 19e7 62
                LISL 5                   ; 19e8 6d
                LIS  $3                  ; 19e9 73
                NS   (IS)                ; 19ea fc
                LR   $0,A                ; 19eb 50
                SR   1                   ; 19ec 12
                LR   $1,A                ; 19ed 51
                LIS  $1                  ; 19ee 71
                NS   $0                  ; 19ef f0
                LR   $0,A                ; 19f0 50
                DCI  $0c25               ; 19f1 2a 0c 25
                LM                       ; 19f4 16
                SL   1                   ; 19f5 13
                AS   $0                  ; 19f6 c0
                DCI  A1599               ; 19f7 2a 15 99
                ADC                      ; 19fa 8e
                LM                       ; 19fb 16
                LR   $0,A                ; 19fc 50
                LIS  $0                  ; 19fd 70
                XS   $1                  ; 19fe e1
                LR   A,$0                ; 19ff 40
                BT   4,A1a03             ; 1a00 84 02
                SR   4                   ; 1a02 14
A1a03:          NI   $07                 ; 1a03 21 07
                LR   $0,A                ; 1a05 50
                DCI  A1594               ; 1a06 2a 15 94
A1a09:          LM                       ; 1a09 16
                LR   $1,A                ; 1a0a 51
A1a0b:          LR   A,$1                ; 1a0b 41
                NS   $1                  ; 1a0c f1
                BF   $4,A1a12            ; 1a0d 94 04
                LM                       ; 1a0f 16
                BF   $0,A1a09            ; 1a10 90 f8
A1a12:          LR   $2,A                ; 1a12 52
                AI   $ff                 ; 1a13 24 ff
                NS   $1                  ; 1a15 f1
                LR   $1,A                ; 1a16 51
                XS   $2                  ; 1a17 e2
                DS   $0                  ; 1a18 30
                BT   1,A1a0b             ; 1a19 81 f1
                LR   $6,A                ; 1a1b 56
                LM                       ; 1a1c 16
                LR   $4,A                ; 1a1d 54
                LR   DC,H                ; 1a1e 10
                LIS  $c                  ; 1a1f 7c
                ADC                      ; 1a20 8e
                LR   A,$6                ; 1a21 46
                ST                       ; 1a22 17
                LR   A,$4                ; 1a23 44
                ST                       ; 1a24 17
                JMP  A17ff               ; 1a25 29 17 ff
A1a28:          LR   K,P                 ; 1a28 08
                LISU 3                   ; 1a29 63
                LISL 0                   ; 1a2a 68
A1a2b:          LM                       ; 1a2b 16
                LR   (IS)+,A             ; 1a2c 5d
                BR7  A1a2b               ; 1a2d 8f fd
                LM                       ; 1a2f 16
                LR   (IS)+,A             ; 1a30 5d
                LISU 4                   ; 1a31 64
A1a32:          LM                       ; 1a32 16
                LR   (IS)+,A             ; 1a33 5d
                BR7  A1a32               ; 1a34 8f fd
                LM                       ; 1a36 16
                LR   (IS)+,A             ; 1a37 5d
                PK                       ; 1a38 0c
A1a39:          LR   K,P                 ; 1a39 08
                LISU 3                   ; 1a3a 63
                LISL 4                   ; 1a3b 6c
                LIS  $8                  ; 1a3c 78
                LR   $0,A                ; 1a3d 50
A1a3e:          LR   A,(IS)+             ; 1a3e 4d
                ST                       ; 1a3f 17
                DS   $0                  ; 1a40 30
                BF   $4,A1a3e            ; 1a41 94 fc
                LISU 4                   ; 1a43 64
                LISL 0                   ; 1a44 68
                LIS  $4                  ; 1a45 74
                LR   $0,A                ; 1a46 50
A1a47:          LR   A,(IS)+             ; 1a47 4d
                ST                       ; 1a48 17
                DS   $0                  ; 1a49 30
                BF   $4,A1a47            ; 1a4a 94 fc
                LIS  $0                  ; 1a4c 70
                ST                       ; 1a4d 17
                ST                       ; 1a4e 17
                LISL 7                   ; 1a4f 6f
                LR   A,(IS)-             ; 1a50 4e
                ST                       ; 1a51 17
                LR   A,(IS)-             ; 1a52 4e
                ST                       ; 1a53 17
                PK                       ; 1a54 0c
A1a55:          LR   K,P                 ; 1a55 08
                LIS  $0                  ; 1a56 70
                AS   $7                  ; 1a57 c7
                BF   $4,A1a62            ; 1a58 94 09
A1a5a:          LIS  $0                  ; 1a5a 70
                XS   $3                  ; 1a5b e3
                PK                       ; 1a5c 0c
A1a5d:          LR   K,P                 ; 1a5d 08
                LIS  $0                  ; 1a5e 70
                AS   $7                  ; 1a5f c7
                BF   $4,A1a5a            ; 1a60 94 f9
A1a62:          LIS  $2                  ; 1a62 72
                SL   4                   ; 1a63 15
                AS   $4                  ; 1a64 c4
                LR   IS,A                ; 1a65 0b
                LR   A,(IS)              ; 1a66 4c
                NS   $3                  ; 1a67 f3
                LR   $3,A                ; 1a68 53
                PK                       ; 1a69 0c
A1a6a:          LR   K,P                 ; 1a6a 08
                LR   A,$b                ; 1a6b 4b
                SR   4                   ; 1a6c 14
                CI   $01                 ; 1a6d 25 01
                BF   $4,A1a89            ; 1a6f 94 19
                DCI  $0ed0               ; 1a71 2a 0e d0
A1a74:          LIS  $0                  ; 1a74 70
                XM                       ; 1a75 8c
                BT   4,A1a7b             ; 1a76 84 04
                LM                       ; 1a78 16
                BF   $0,A1a74            ; 1a79 90 fa
A1a7b:          LIS  $0                  ; 1a7b 70
                COM                      ; 1a7c 18
                ADC                      ; 1a7d 8e
                LR   A,$3                ; 1a7e 43
                ST                       ; 1a7f 17
                LR   A,$4                ; 1a80 44
                SL   1                   ; 1a81 13
                SL   1                   ; 1a82 13
                AS   $5                  ; 1a83 c5
                ST                       ; 1a84 17
                LIS  $0                  ; 1a85 70
                ST                       ; 1a86 17
                BF   $0,A1a98            ; 1a87 90 10
A1a89:          LIS  $0                  ; 1a89 70
                XS   $2                  ; 1a8a e2
                BF   $4,A1a98            ; 1a8b 94 0c
                LR   DC,H                ; 1a8d 10
                LIS  $c                  ; 1a8e 7c
                ADC                      ; 1a8f 8e
                LR   A,$3                ; 1a90 43
                ST                       ; 1a91 17
                LR   A,$4                ; 1a92 44
                SL   1                   ; 1a93 13
                SL   1                   ; 1a94 13
                AS   $5                  ; 1a95 c5
                ST                       ; 1a96 17
                LR   DC,H                ; 1a97 10
A1a98:          LIS  $0                  ; 1a98 70
                LR   $0,A                ; 1a99 50
                LR   A,$3                ; 1a9a 43
A1a9b:          DS   $0                  ; 1a9b 30
                AI   $ff                 ; 1a9c 24 ff
                NS   $3                  ; 1a9e f3
                LR   $3,A                ; 1a9f 53
                BF   $4,A1a9b            ; 1aa0 94 fa
                LR   A,$0                ; 1aa2 40
                COM                      ; 1aa3 18
                INC                      ; 1aa4 1f
                AS   $2                  ; 1aa5 c2
                LR   $2,A                ; 1aa6 52
                PK                       ; 1aa7 0c
A1aa8:          PI   A1f72               ; 1aa8 28 1f 72
                LR   DC,H                ; 1aab 10
                LR   A,$b                ; 1aac 4b
                SR   4                   ; 1aad 14
                CI   $03                 ; 1aae 25 03
                BT   1,A1ad0             ; 1ab0 81 1f
                LIS  $3                  ; 1ab2 73
                COM                      ; 1ab3 18
                ADC                      ; 1ab4 8e
                LM                       ; 1ab5 16
                LR   $1,A                ; 1ab6 51
                LM                       ; 1ab7 16
                LR   $4,A                ; 1ab8 54
                LIS  $0                  ; 1ab9 70
                LR   $2,A                ; 1aba 52
                XM                       ; 1abb 8c
                BT   1,A1ad0             ; 1abc 81 13
                LR   DC,H                ; 1abe 10
                LIS  $d                  ; 1abf 7d
                ADC                      ; 1ac0 8e
                LIS  $3                  ; 1ac1 73
                NM                       ; 1ac2 8a
                INC                      ; 1ac3 1f
                CI   $03                 ; 1ac4 25 03
                BF   $1,A1add            ; 1ac6 91 16
                LR   $5,A                ; 1ac8 55
                LIS  $0                  ; 1ac9 70
                LR   $2,A                ; 1aca 52
                COM                      ; 1acb 18
                LR   $6,A                ; 1acc 56
                JMP  A1b7f               ; 1acd 29 1b 7f
A1ad0:          LR   DC,H                ; 1ad0 10
                LIS  $d                  ; 1ad1 7d
                ADC                      ; 1ad2 8e
                LM                       ; 1ad3 16
                LR   $5,A                ; 1ad4 55
                NI   $0f                 ; 1ad5 21 0f
                INC                      ; 1ad7 1f
                LR   $0,A                ; 1ad8 50
                CI   $0f                 ; 1ad9 25 0f
                BT   1,A1ae0             ; 1adb 81 04
A1add:          JMP  A1d7c               ; 1add 29 1d 7c
A1ae0:          LR   DC,H                ; 1ae0 10
                LIS  $1                  ; 1ae1 71
                LR   $6,A                ; 1ae2 56
                LIS  $0                  ; 1ae3 70
                LR   $2,A                ; 1ae4 52
                COM                      ; 1ae5 18
                LR   $1,A                ; 1ae6 51
                LR   DC,H                ; 1ae7 10
                LR   A,$0                ; 1ae8 40
                SR   1                   ; 1ae9 12
                SR   1                   ; 1aea 12
                NI   $03                 ; 1aeb 21 03
                LR   $4,A                ; 1aed 54
                LR   A,$5                ; 1aee 45
                CI   $0f                 ; 1aef 25 0f
                LIS  $3                  ; 1af1 73
                BF   $1,A1afe            ; 1af2 91 0b
                NS   $0                  ; 1af4 f0
                LR   $5,A                ; 1af5 55
                BT   4,A1afb             ; 1af6 84 04
                JMP  A1cde               ; 1af8 29 1c de
A1afb:          JMP  A1c92               ; 1afb 29 1c 92
A1afe:          NS   $0                  ; 1afe f0
                LR   $5,A                ; 1aff 55
                BT   4,A1b05             ; 1b00 84 04
                JMP  A1b7f               ; 1b02 29 1b 7f
A1b05:          JMP  A1b25               ; 1b05 29 1b 25
A1b08:          LR   DC,H                ; 1b08 10
                LR   A,$b                ; 1b09 4b
                SR   4                   ; 1b0a 14
                CI   $02                 ; 1b0b 25 02
                BF   $4,A1b19            ; 1b0d 94 0b
                LIS  $e                  ; 1b0f 7e
                ADC                      ; 1b10 8e
                LIS  $b                  ; 1b11 7b
                AM                       ; 1b12 88
                AM                       ; 1b13 88
                DCI  $0c2c               ; 1b14 2a 0c 2c
                ST                       ; 1b17 17
                LR   DC,H                ; 1b18 10
A1b19:          PI   A1a28               ; 1b19 28 1a 28
                PI   A1f72               ; 1b1c 28 1f 72
                LIS  $0                  ; 1b1f 70
                LR   $4,A                ; 1b20 54
                LR   $2,A                ; 1b21 52
                LR   $6,A                ; 1b22 56
                COM                      ; 1b23 18
                LR   $1,A                ; 1b24 51
A1b25:          LI   $18                 ; 1b25 20 18
                AS   $4                  ; 1b27 c4
                LR   IS,A                ; 1b28 0b
                LR   A,(IS)              ; 1b29 4c
                NS   $1                  ; 1b2a f1
                LR   $3,A                ; 1b2b 53
                PI   A1a55               ; 1b2c 28 1a 55
                BT   4,A1b86             ; 1b2f 84 56
                LI   $2a                 ; 1b31 20 2a
                AS   $4                  ; 1b33 c4
                LR   IS,A                ; 1b34 0b
                LR   A,(IS)              ; 1b35 4c
                SR   1                   ; 1b36 12
                NS   $3                  ; 1b37 f3
                LR   $3,A                ; 1b38 53
                LI   $1c                 ; 1b39 20 1c
                AS   $4                  ; 1b3b c4
                LR   IS,A                ; 1b3c 0b
                LR   A,(IS)+             ; 1b3d 4d
                SL   4                   ; 1b3e 15
                LR   $0,A                ; 1b3f 50
                LR   A,(IS)              ; 1b40 4c
                SR   4                   ; 1b41 14
                SR   1                   ; 1b42 12
                AS   $0                  ; 1b43 c0
                NS   $3                  ; 1b44 f3
                LR   $3,A                ; 1b45 53
                BT   4,A1b52             ; 1b46 84 0b
                LIS  $1                  ; 1b48 71
                SL   4                   ; 1b49 15
                LR   $5,A                ; 1b4a 55
                PI   A1a6a               ; 1b4b 28 1a 6a
                LIS  $0                  ; 1b4e 70
                AS   $6                  ; 1b4f c6
                BF   $4,A1b7d            ; 1b50 94 2c
A1b52:          LI   $18                 ; 1b52 20 18
                AS   $4                  ; 1b54 c4
                LR   IS,A                ; 1b55 0b
                LR   A,(IS)              ; 1b56 4c
                NS   $1                  ; 1b57 f1
                LR   $3,A                ; 1b58 53
                PI   A1a55               ; 1b59 28 1a 55
                LI   $2a                 ; 1b5c 20 2a
                AS   $4                  ; 1b5e c4
                LR   IS,A                ; 1b5f 0b
                LR   A,(IS)              ; 1b60 4c
                SL   1                   ; 1b61 13
                NS   $3                  ; 1b62 f3
                LR   $3,A                ; 1b63 53
                LI   $1c                 ; 1b64 20 1c
                AS   $4                  ; 1b66 c4
                LR   IS,A                ; 1b67 0b
                LR   A,(IS)+             ; 1b68 4d
                SL   4                   ; 1b69 15
                SL   1                   ; 1b6a 13
                LR   $0,A                ; 1b6b 50
                LR   A,(IS)              ; 1b6c 4c
                SR   4                   ; 1b6d 14
                AS   $0                  ; 1b6e c0
                NS   $3                  ; 1b6f f3
                LR   $3,A                ; 1b70 53
                BT   4,A1b86             ; 1b71 84 14
                LI   $11                 ; 1b73 20 11
                LR   $5,A                ; 1b75 55
                PI   A1a6a               ; 1b76 28 1a 6a
                LIS  $0                  ; 1b79 70
                XS   $6                  ; 1b7a e6
                BT   4,A1b86             ; 1b7b 84 0a
A1b7d:          BF   $0,A1bb1            ; 1b7d 90 33
A1b7f:          LR   A,$5                ; 1b7f 45
                CI   $02                 ; 1b80 25 02
                BF   $1,A1bb3            ; 1b82 91 30
                BF   $4,A1b52            ; 1b84 94 cd
A1b86:          LI   $18                 ; 1b86 20 18
                AS   $4                  ; 1b88 c4
                LR   IS,A                ; 1b89 0b
                LR   A,(IS)              ; 1b8a 4c
                NS   $1                  ; 1b8b f1
                LR   $3,A                ; 1b8c 53
                PI   A1a5d               ; 1b8d 28 1a 5d
                BT   4,A1be1             ; 1b90 84 50
                LI   $28                 ; 1b92 20 28
                AS   $4                  ; 1b94 c4
                LR   IS,A                ; 1b95 0b
                LR   A,(IS)              ; 1b96 4c
                SR   1                   ; 1b97 12
                NS   $3                  ; 1b98 f3
                LR   $3,A                ; 1b99 53
                LI   $1b                 ; 1b9a 20 1b
                AS   $4                  ; 1b9c c4
                LR   IS,A                ; 1b9d 0b
                LR   A,(IS)+             ; 1b9e 4d
                SL   4                   ; 1b9f 15
                LR   $0,A                ; 1ba0 50
                LR   A,(IS)              ; 1ba1 4c
                SR   4                   ; 1ba2 14
                SR   1                   ; 1ba3 12
                AS   $0                  ; 1ba4 c0
                NS   $3                  ; 1ba5 f3
                LR   $3,A                ; 1ba6 53
                BT   4,A1bb3             ; 1ba7 84 0b
                LI   $12                 ; 1ba9 20 12
                LR   $5,A                ; 1bab 55
                PI   A1a6a               ; 1bac 28 1a 6a
                LIS  $0                  ; 1baf 70
                XS   $6                  ; 1bb0 e6
A1bb1:          BF   $4,A1bde            ; 1bb1 94 2c
A1bb3:          LI   $18                 ; 1bb3 20 18
                AS   $4                  ; 1bb5 c4
                LR   IS,A                ; 1bb6 0b
                LR   A,(IS)              ; 1bb7 4c
                NS   $1                  ; 1bb8 f1
                LR   $3,A                ; 1bb9 53
                PI   A1a5d               ; 1bba 28 1a 5d
                LI   $28                 ; 1bbd 20 28
                AS   $4                  ; 1bbf c4
                LR   IS,A                ; 1bc0 0b
                LR   A,(IS)              ; 1bc1 4c
                SL   1                   ; 1bc2 13
                NS   $3                  ; 1bc3 f3
                LR   $3,A                ; 1bc4 53
                LI   $1b                 ; 1bc5 20 1b
                AS   $4                  ; 1bc7 c4
                LR   IS,A                ; 1bc8 0b
                LR   A,(IS)+             ; 1bc9 4d
                SL   4                   ; 1bca 15
                SL   1                   ; 1bcb 13
                LR   $0,A                ; 1bcc 50
                LR   A,(IS)              ; 1bcd 4c
                SR   4                   ; 1bce 14
                AS   $0                  ; 1bcf c0
                NS   $3                  ; 1bd0 f3
                LR   $3,A                ; 1bd1 53
                BT   4,A1be1             ; 1bd2 84 0e
                LI   $13                 ; 1bd4 20 13
                LR   $5,A                ; 1bd6 55
                PI   A1a6a               ; 1bd7 28 1a 6a
                LIS  $0                  ; 1bda 70
                XS   $6                  ; 1bdb e6
                BT   4,A1bea             ; 1bdc 84 0d
A1bde:          JMP  A17ff               ; 1bde 29 17 ff
A1be1:          LIS  $0                  ; 1be1 70
                XS   $6                  ; 1be2 e6
                BT   4,A1bea             ; 1be3 84 06
                BT   1,A1bef             ; 1be5 81 09
                JMP  A1d7c               ; 1be7 29 1d 7c
A1bea:          LR   A,$1                ; 1bea 41
                CI   $ff                 ; 1beb 25 ff
                BF   $4,A1bf9            ; 1bed 94 0b
A1bef:          LR   A,$4                ; 1bef 44
                INC                      ; 1bf0 1f
                NI   $03                 ; 1bf1 21 03
                LR   $4,A                ; 1bf3 54
                BT   4,A1c5d             ; 1bf4 84 68
                JMP  A1b25               ; 1bf6 29 1b 25
A1bf9:          LIS  $0                  ; 1bf9 70
                XS   $2                  ; 1bfa e2
                BT   4,A1c0d             ; 1bfb 84 11
                LR   A,$b                ; 1bfd 4b
                SR   4                   ; 1bfe 14
                CI   $05                 ; 1bff 25 05
                BF   $1,A1c32            ; 1c01 91 30
                CI   $01                 ; 1c03 25 01
                BF   $4,A1c68            ; 1c05 94 62
                PI   A1324               ; 1c07 28 13 24
                JMP  A123b               ; 1c0a 29 12 3b
A1c0d:          LR   A,$b                ; 1c0d 4b
                SR   4                   ; 1c0e 14
                CI   $01                 ; 1c0f 25 01
                BF   $1,A1c16            ; 1c11 91 04
                JMP  A19b8               ; 1c13 29 19 b8
A1c16:          LIS  $1                  ; 1c16 71
                COM                      ; 1c17 18
                SL   4                   ; 1c18 15
                AS   $b                  ; 1c19 cb
                LR   $b,A                ; 1c1a 5b
                CI   $20                 ; 1c1b 25 20
                BF   $4,A1c2f            ; 1c1d 94 11
                DCI  $0fb0               ; 1c1f 2a 0f b0
                LIS  $1                  ; 1c22 71
                XM                       ; 1c23 8c
                BF   $4,A1c2f            ; 1c24 94 0a
                DCI  $0e10               ; 1c26 2a 0e 10
                PI   A1a39               ; 1c29 28 1a 39
                JMP  A1d82               ; 1c2c 29 1d 82
A1c2f:          JMP  A1956               ; 1c2f 29 19 56
A1c32:          DCI  $0e3e               ; 1c32 2a 0e 3e
                LIS  $0                  ; 1c35 70
                XM                       ; 1c36 8c
                BF   $1,A1c68            ; 1c37 91 30
                DCI  $0e4e               ; 1c39 2a 0e 4e
                LIS  $0                  ; 1c3c 70
                XM                       ; 1c3d 8c
                BF   $1,A1c68            ; 1c3e 91 29
                LR   DC,H                ; 1c40 10
                LI   $ff                 ; 1c41 20 ff
                ADC                      ; 1c43 8e
                LM                       ; 1c44 16
                CI   $01                 ; 1c45 25 01
                BF   $4,A1c68            ; 1c47 94 20
                LR   DC,H                ; 1c49 10
                XDC                      ; 1c4a 2c
                LIS  $1                  ; 1c4b 71
                COM                      ; 1c4c 18
                SL   4                   ; 1c4d 15
                AS   $b                  ; 1c4e cb
                LR   $b,A                ; 1c4f 5b
                LR   DC,H                ; 1c50 10
                LISU 2                   ; 1c51 62
                LISL 0                   ; 1c52 68
                LIS  $1                  ; 1c53 71
                SL   4                   ; 1c54 15
                LR   (IS),A              ; 1c55 5c
                PI   $43cd               ; 1c56 28 43 cd
                LR   A,$b                ; 1c59 4b
                SR   4                   ; 1c5a 14
                BF   $0,A1c75            ; 1c5b 90 19
A1c5d:          LIS  $0                  ; 1c5d 70
                XS   $2                  ; 1c5e e2
                BF   $4,A1c68            ; 1c5f 94 08
                LIS  $0                  ; 1c61 70
                XS   $6                  ; 1c62 e6
                BT   4,A1c92             ; 1c63 84 2e
                JMP  A1d7c               ; 1c65 29 1d 7c
A1c68:          LR   A,$b                ; 1c68 4b
                SR   4                   ; 1c69 14
                CI   $0c                 ; 1c6a 25 0c
                BF   $1,A1c89            ; 1c6c 91 1c
                CI   $01                 ; 1c6e 25 01
                BF   $4,A1c75            ; 1c70 94 04
                JMP  A1795               ; 1c72 29 17 95
A1c75:          AI   $fe                 ; 1c75 24 fe
                DCI  $0fb0               ; 1c77 2a 0f b0
                ADC                      ; 1c7a 8e
                LR   A,$2                ; 1c7b 42
                ST                       ; 1c7c 17
                LR   DC,H                ; 1c7d 10
                LI   $1e                 ; 1c7e 20 1e
                ADC                      ; 1c80 8e
                LIS  $0                  ; 1c81 70
                COM                      ; 1c82 18
                ST                       ; 1c83 17
                LR   A,$2                ; 1c84 42
                ST                       ; 1c85 17
                JMP  A17ff               ; 1c86 29 17 ff
A1c89:          LISU 4                   ; 1c89 64
                LISL 7                   ; 1c8a 6f
                LIS  $1                  ; 1c8b 71
                COM                      ; 1c8c 18
                AS   (IS)                ; 1c8d cc
                LR   (IS),A              ; 1c8e 5c
                JMP  A1e51               ; 1c8f 29 1e 51
A1c92:          LI   $18                 ; 1c92 20 18
                AS   $4                  ; 1c94 c4
                LR   IS,A                ; 1c95 0b
                LR   A,(IS)              ; 1c96 4c
                LR   $3,A                ; 1c97 53
                PI   A1a55               ; 1c98 28 1a 55
                BT   4,A1ce5             ; 1c9b 84 49
                LI   $29                 ; 1c9d 20 29
                AS   $4                  ; 1c9f c4
                LR   IS,A                ; 1ca0 0b
                LR   A,(IS)+             ; 1ca1 4d
                SL   4                   ; 1ca2 15
                LR   $0,A                ; 1ca3 50
                LR   A,(IS)              ; 1ca4 4c
                SR   4                   ; 1ca5 14
                SR   1                   ; 1ca6 12
                AS   $0                  ; 1ca7 c0
                NS   $3                  ; 1ca8 f3
                LR   $3,A                ; 1ca9 53
                BT   4,A1cb8             ; 1caa 84 0d
                LIS  $0                  ; 1cac 70
                LR   $5,A                ; 1cad 55
                PI   A1a6a               ; 1cae 28 1a 6a
                LIS  $0                  ; 1cb1 70
                XS   $6                  ; 1cb2 e6
                BT   4,A1cb8             ; 1cb3 84 04
                JMP  A17ff               ; 1cb5 29 17 ff
A1cb8:          LI   $18                 ; 1cb8 20 18
                AS   $4                  ; 1cba c4
                LR   IS,A                ; 1cbb 0b
                LR   A,(IS)              ; 1cbc 4c
                LR   $3,A                ; 1cbd 53
                PI   A1a55               ; 1cbe 28 1a 55
                BT   4,A1ce5             ; 1cc1 84 23
                LI   $29                 ; 1cc3 20 29
                AS   $4                  ; 1cc5 c4
                LR   IS,A                ; 1cc6 0b
                LR   A,(IS)+             ; 1cc7 4d
                SL   4                   ; 1cc8 15
                SL   1                   ; 1cc9 13
                LR   $0,A                ; 1cca 50
                LR   A,(IS)              ; 1ccb 4c
                SR   4                   ; 1ccc 14
                AS   $0                  ; 1ccd c0
                NS   $3                  ; 1cce f3
                LR   $3,A                ; 1ccf 53
                BT   4,A1ce5             ; 1cd0 84 14
                LIS  $1                  ; 1cd2 71
                LR   $5,A                ; 1cd3 55
                PI   A1a6a               ; 1cd4 28 1a 6a
                LIS  $0                  ; 1cd7 70
                XS   $6                  ; 1cd8 e6
                BT   4,A1ce5             ; 1cd9 84 0b
                JMP  A17ff               ; 1cdb 29 17 ff
A1cde:          LR   A,$5                ; 1cde 45
                CI   $02                 ; 1cdf 25 02
                BF   $1,A1d08            ; 1ce1 91 26
                BF   $4,A1cb8            ; 1ce3 94 d4
A1ce5:          LI   $18                 ; 1ce5 20 18
                AS   $4                  ; 1ce7 c4
                LR   IS,A                ; 1ce8 0b
                LR   A,(IS)              ; 1ce9 4c
                LR   $3,A                ; 1cea 53
                PI   A1a5d               ; 1ceb 28 1a 5d
                BT   4,A1d2e             ; 1cee 84 3f
                LI   $28                 ; 1cf0 20 28
                AS   $4                  ; 1cf2 c4
                LR   IS,A                ; 1cf3 0b
                LR   A,(IS)+             ; 1cf4 4d
                SL   4                   ; 1cf5 15
                LR   $0,A                ; 1cf6 50
                LR   A,(IS)              ; 1cf7 4c
                SR   4                   ; 1cf8 14
                SR   1                   ; 1cf9 12
                AS   $0                  ; 1cfa c0
                NS   $3                  ; 1cfb f3
                LR   $3,A                ; 1cfc 53
                BT   4,A1d08             ; 1cfd 84 0a
                LIS  $2                  ; 1cff 72
                LR   $5,A                ; 1d00 55
                PI   A1a6a               ; 1d01 28 1a 6a
                LIS  $0                  ; 1d04 70
                XS   $6                  ; 1d05 e6
                BF   $4,A1d2b            ; 1d06 94 24
A1d08:          LI   $18                 ; 1d08 20 18
                AS   $4                  ; 1d0a c4
                LR   IS,A                ; 1d0b 0b
                LR   A,(IS)              ; 1d0c 4c
                LR   $3,A                ; 1d0d 53
                PI   A1a5d               ; 1d0e 28 1a 5d
                BT   4,A1d2e             ; 1d11 84 1c
                LI   $28                 ; 1d13 20 28
                AS   $4                  ; 1d15 c4
                LR   IS,A                ; 1d16 0b
                LR   A,(IS)+             ; 1d17 4d
                SL   4                   ; 1d18 15
                SL   1                   ; 1d19 13
                LR   $0,A                ; 1d1a 50
                LR   A,(IS)              ; 1d1b 4c
                SR   4                   ; 1d1c 14
                AS   $0                  ; 1d1d c0
                NS   $3                  ; 1d1e f3
                LR   $3,A                ; 1d1f 53
                BT   4,A1d2e             ; 1d20 84 0d
                LIS  $3                  ; 1d22 73
                LR   $5,A                ; 1d23 55
                PI   A1a6a               ; 1d24 28 1a 6a
                LIS  $0                  ; 1d27 70
                XS   $6                  ; 1d28 e6
                BT   4,A1d2e             ; 1d29 84 04
A1d2b:          JMP  A17ff               ; 1d2b 29 17 ff
A1d2e:          LR   A,$4                ; 1d2e 44
                INC                      ; 1d2f 1f
                NI   $03                 ; 1d30 21 03
                LR   $4,A                ; 1d32 54
                BT   4,A1d38             ; 1d33 84 04
                JMP  A1c92               ; 1d35 29 1c 92
A1d38:          LIS  $0                  ; 1d38 70
                XS   $2                  ; 1d39 e2
                BF   $4,A1d4e            ; 1d3a 94 13
                LIS  $0                  ; 1d3c 70
                XS   $6                  ; 1d3d e6
                BF   $4,A1d7c            ; 1d3e 94 3d
                LR   A,$b                ; 1d40 4b
                SR   4                   ; 1d41 14
                CI   $02                 ; 1d42 25 02
                BF   $1,A1d91            ; 1d44 91 4c
                BT   4,A1d4b             ; 1d46 84 04
                JMP  A172f               ; 1d48 29 17 2f
A1d4b:          JMP  A1735               ; 1d4b 29 17 35
A1d4e:          LR   A,$b                ; 1d4e 4b
                SR   4                   ; 1d4f 14
                CI   $01                 ; 1d50 25 01
                BF   $4,A1d57            ; 1d52 94 04
                JMP  A1795               ; 1d54 29 17 95
A1d57:          CI   $0d                 ; 1d57 25 0d
                BF   $1,A1d79            ; 1d59 91 1f
                AI   $fe                 ; 1d5b 24 fe
                LR   $0,A                ; 1d5d 50
                DCI  $0c28               ; 1d5e 2a 0c 28
                LM                       ; 1d61 16
                DCI  $0fb0               ; 1d62 2a 0f b0
                BF   $0,A1d69            ; 1d65 90 03
A1d67:          AM                       ; 1d67 88
                NOP                      ; 1d68 2b
A1d69:          DS   $0                  ; 1d69 30
                BT   1,A1d67             ; 1d6a 81 fc
                AS   $2                  ; 1d6c c2
                BF   $1,A1d74            ; 1d6d 91 06
                LR   A,$b                ; 1d6f 4b
                CI   $30                 ; 1d70 25 30
                BF   $4,A1d79            ; 1d72 94 06
A1d74:          LR   A,$2                ; 1d74 42
                ST                       ; 1d75 17
                JMP  A17ff               ; 1d76 29 17 ff
A1d79:          JMP  A1e51               ; 1d79 29 1e 51
A1d7c:          LR   A,$b                ; 1d7c 4b
                SR   4                   ; 1d7d 14
                CI   $02                 ; 1d7e 25 02
                BF   $4,A1d91            ; 1d80 94 10
A1d82:          DCI  $0e10               ; 1d82 2a 0e 10
                LR   H,DC                ; 1d85 11
                LR   A,$7                ; 1d86 47
                COM                      ; 1d87 18
                LR   $7,A                ; 1d88 57
                DCI  $0ed0               ; 1d89 2a 0e d0
                LIS  $0                  ; 1d8c 70
                ST                       ; 1d8d 17
                JMP  A1b08               ; 1d8e 29 1b 08
A1d91:          SL   1                   ; 1d91 13
                DCI  $0eee               ; 1d92 2a 0e ee
                ADC                      ; 1d95 8e
                LR   Q,DC                ; 1d96 0e
                LM                       ; 1d97 16
                LR   $0,A                ; 1d98 50
                LM                       ; 1d99 16
                LR   $6,A                ; 1d9a 56
A1d9b:          LR   A,$b                ; 1d9b 4b
                CI   $30                 ; 1d9c 25 30
                BF   $4,A1da9            ; 1d9e 94 0a
                DCI  $0ef2               ; 1da0 2a 0e f2
                LR   Q,DC                ; 1da3 0e
                LIS  $1                  ; 1da4 71
                LR   $1,A                ; 1da5 51
                JMP  A1dfc               ; 1da6 29 1d fc
A1da9:          LR   DC,H                ; 1da9 10
                LIS  $1                  ; 1daa 71
                COM                      ; 1dab 18
                ADC                      ; 1dac 8e
                LIS  $0                  ; 1dad 70
                XM                       ; 1dae 8c
                BF   $1,A1dc5            ; 1daf 91 15
                LI   $ef                 ; 1db1 20 ef
                ADC                      ; 1db3 8e
                LIS  $0                  ; 1db4 70
                XM                       ; 1db5 8c
                BF   $1,A1de0            ; 1db6 91 29
                LR   A,$b                ; 1db8 4b
                SR   4                   ; 1db9 14
                AI   $fe                 ; 1dba 24 fe
                LR   $1,A                ; 1dbc 51
                SL   1                   ; 1dbd 13
                DCI  $0eee               ; 1dbe 2a 0e ee
                ADC                      ; 1dc1 8e
                LR   Q,DC                ; 1dc2 0e
                BF   $0,A1de8            ; 1dc3 90 24
A1dc5:          PI   A1e38               ; 1dc5 28 1e 38
                LIS  $1                  ; 1dc8 71
                AS   $1                  ; 1dc9 c1
                LR   $1,A                ; 1dca 51
                LIS  $2                  ; 1dcb 72
                ADC                      ; 1dcc 8e
                LR   Q,DC                ; 1dcd 0e
                LR   A,$0                ; 1dce 40
                CM                       ; 1dcf 8d
                BF   $1,A1dd8            ; 1dd0 91 07
                BF   $4,A1ddd            ; 1dd2 94 0a
                LR   A,$6                ; 1dd4 46
                CM                       ; 1dd5 8d
                BT   1,A1ddd             ; 1dd6 81 06
A1dd8:          LR   DC,Q                ; 1dd8 0f
                LR   A,$0                ; 1dd9 40
                ST                       ; 1dda 17
                LR   A,$6                ; 1ddb 46
                ST                       ; 1ddc 17
A1ddd:          JMP  A1e26               ; 1ddd 29 1e 26
A1de0:          PI   A1e38               ; 1de0 28 1e 38
                LR   A,$1                ; 1de3 41
                CI   $01                 ; 1de4 25 01
                BT   4,A1df8             ; 1de6 84 11
A1de8:          LR   A,$0                ; 1de8 40
                CM                       ; 1de9 8d
                BF   $1,A1df8            ; 1dea 91 0d
                BF   $4,A1df2            ; 1dec 94 05
                LR   A,$6                ; 1dee 46
                CM                       ; 1def 8d
                BF   $1,A1df8            ; 1df0 91 07
A1df2:          LR   A,$1                ; 1df2 41
                SL   4                   ; 1df3 15
                LR   $b,A                ; 1df4 5b
                JMP  A1e31               ; 1df5 29 1e 31
A1df8:          LIS  $2                  ; 1df8 72
                LR   DC,Q                ; 1df9 0f
                ADC                      ; 1dfa 8e
                LR   Q,DC                ; 1dfb 0e
A1dfc:          LR   A,$6                ; 1dfc 46
                COM                      ; 1dfd 18
                INC                      ; 1dfe 1f
                LR   $6,A                ; 1dff 56
                LR   A,$0                ; 1e00 40
                COM                      ; 1e01 18
                INC                      ; 1e02 1f
                LR   $0,A                ; 1e03 50
                CM                       ; 1e04 8d
                BF   $1,A1e0d            ; 1e05 91 07
                BF   $4,A1e2a            ; 1e07 94 22
                LR   A,$6                ; 1e09 46
                CM                       ; 1e0a 8d
                BT   1,A1e2a             ; 1e0b 81 1e
A1e0d:          LR   DC,Q                ; 1e0d 0f
                LR   A,$0                ; 1e0e 40
                ST                       ; 1e0f 17
                LR   A,$6                ; 1e10 46
                ST                       ; 1e11 17
                LR   A,$1                ; 1e12 41
                CI   $01                 ; 1e13 25 01
                BF   $4,A1e2a            ; 1e15 94 14
                LR   DC,H                ; 1e17 10
                XDC                      ; 1e18 2c
                DCI  $0e10               ; 1e19 2a 0e 10
                LISU 2                   ; 1e1c 62
                LISL 0                   ; 1e1d 68
                LIS  $1                  ; 1e1e 71
                SL   4                   ; 1e1f 15
                LR   (IS),A              ; 1e20 5c
                PI   $43cd               ; 1e21 28 43 cd
                BF   $0,A1e2a            ; 1e24 90 05
A1e26:          LIS  $e                  ; 1e26 7e
                SL   4                   ; 1e27 15
                BF   $0,A1e2f            ; 1e28 90 06
A1e2a:          LR   A,$7                ; 1e2a 47
                COM                      ; 1e2b 18
                LR   $7,A                ; 1e2c 57
                LIS  $f                  ; 1e2d 7f
                SL   4                   ; 1e2e 15
A1e2f:          AS   $b                  ; 1e2f cb
                LR   $b,A                ; 1e30 5b
A1e31:          LR   DC,H                ; 1e31 10
                PI   A1a28               ; 1e32 28 1a 28
                JMP  A17ff               ; 1e35 29 17 ff
A1e38:          LR   K,P                 ; 1e38 08
                LI   $ff                 ; 1e39 20 ff
                ADC                      ; 1e3b 8e
                LR   Q,DC                ; 1e3c 0e
A1e3d:          LR   DC,Q                ; 1e3d 0f
                LIS  $1                  ; 1e3e 71
                COM                      ; 1e3f 18
                SL   4                   ; 1e40 15
                ADC                      ; 1e41 8e
                LR   Q,DC                ; 1e42 0e
                LIS  $0                  ; 1e43 70
                XM                       ; 1e44 8c
                BF   $1,A1e3d            ; 1e45 91 f7
                LR   A,QL                ; 1e47 03
                SR   4                   ; 1e48 14
                LR   $1,A                ; 1e49 51
                SL   1                   ; 1e4a 13
                DCI  $0eee               ; 1e4b 2a 0e ee
                ADC                      ; 1e4e 8e
                LR   Q,DC                ; 1e4f 0e
                PK                       ; 1e50 0c
A1e51:          LISU 4                   ; 1e51 64
                LISL 6                   ; 1e52 6e
                LR   A,(IS)+             ; 1e53 4d
                LR   $0,A                ; 1e54 50
                LR   A,(IS)+             ; 1e55 4d
                LR   $4,A                ; 1e56 54
                COM                      ; 1e57 18
                INC                      ; 1e58 1f
                AS   $0                  ; 1e59 c0
                LR   $3,A                ; 1e5a 53
                BT   1,A1e5f             ; 1e5b 81 03
                COM                      ; 1e5d 18
                INC                      ; 1e5e 1f
A1e5f:          LR   $1,A                ; 1e5f 51
                LR   A,$0                ; 1e60 40
                AS   $4                  ; 1e61 c4
                COM                      ; 1e62 18
                INC                      ; 1e63 1f
                DCI  $0c2c               ; 1e64 2a 0c 2c
                AM                       ; 1e67 88
                SR   1                   ; 1e68 12
                LR   $4,A                ; 1e69 54
                LIS  $0                  ; 1e6a 70
                LR   $0,A                ; 1e6b 50
                LR   A,$1                ; 1e6c 41
A1e6d:          NI   $01                 ; 1e6d 21 01
                BT   4,A1e74             ; 1e6f 84 04
                LR   A,$4                ; 1e71 44
                AS   $0                  ; 1e72 c0
                LR   $0,A                ; 1e73 50
A1e74:          LR   A,$4                ; 1e74 44
                SL   1                   ; 1e75 13
                LR   $4,A                ; 1e76 54
                LR   A,$1                ; 1e77 41
                SR   1                   ; 1e78 12
                LR   $1,A                ; 1e79 51
                BF   $4,A1e6d            ; 1e7a 94 f2
                AS   $0                  ; 1e7c c0
                CI   $50                 ; 1e7d 25 50
                BT   1,A1e84             ; 1e7f 81 04
                LI   $50                 ; 1e81 20 50
                LR   $0,A                ; 1e83 50
A1e84:          LIS  $0                  ; 1e84 70
                XS   $3                  ; 1e85 e3
                LR   A,$0                ; 1e86 40
                BT   1,A1e8c             ; 1e87 81 04
                COM                      ; 1e89 18
                INC                      ; 1e8a 1f
                LR   $0,A                ; 1e8b 50
A1e8c:          LISU 3                   ; 1e8c 63
                LIS  $0                  ; 1e8d 70
                LR   $3,A                ; 1e8e 53
                XS   $7                  ; 1e8f e7
                BT   4,A1ead             ; 1e90 84 1c
                LISL 4                   ; 1e92 6c
                LIS  $a                  ; 1e93 7a
                SL   4                   ; 1e94 15
                NS   (IS)                ; 1e95 fc
                LR   $1,A                ; 1e96 51
                AI   $ff                 ; 1e97 24 ff
                NS   $1                  ; 1e99 f1
                BT   4,A1e9f             ; 1e9a 84 04
                LIS  $0                  ; 1e9c 70
                COM                      ; 1e9d 18
                LR   $3,A                ; 1e9e 53
A1e9f:          LISL 3                   ; 1e9f 6b
                LIS  $5                  ; 1ea0 75
                NS   (IS)                ; 1ea1 fc
                LR   $1,A                ; 1ea2 51
                AI   $ff                 ; 1ea3 24 ff
                NS   $1                  ; 1ea5 f1
                BT   4,A1ec6             ; 1ea6 84 1f
                LR   A,$3                ; 1ea8 43
                INC                      ; 1ea9 1f
                LR   $3,A                ; 1eaa 53
                BF   $0,A1ec6            ; 1eab 90 1a
A1ead:          LISL 7                   ; 1ead 6f
                LIS  $5                  ; 1eae 75
                NS   (IS)                ; 1eaf fc
                LR   $1,A                ; 1eb0 51
                AI   $ff                 ; 1eb1 24 ff
                NS   $1                  ; 1eb3 f1
                BT   4,A1eb9             ; 1eb4 84 04
                LIS  $0                  ; 1eb6 70
                COM                      ; 1eb7 18
                LR   $3,A                ; 1eb8 53
A1eb9:          LISL 0                   ; 1eb9 68
                LIS  $a                  ; 1eba 7a
                SR   4                   ; 1ebb 14
                NS   (IS)                ; 1ebc fc
                LR   $1,A                ; 1ebd 51
                AI   $ff                 ; 1ebe 24 ff
                NS   $1                  ; 1ec0 f1
                BT   4,A1ec6             ; 1ec1 84 04
                LR   A,$3                ; 1ec3 43
                INC                      ; 1ec4 1f
                LR   $3,A                ; 1ec5 53
A1ec6:          LR   A,$3                ; 1ec6 43
                SL   1                   ; 1ec7 13
                AS   $0                  ; 1ec8 c0
                LR   $0,A                ; 1ec9 50
                LIS  $0                  ; 1eca 70
                LR   $3,A                ; 1ecb 53
                LISL 5                   ; 1ecc 6d
A1ecd:          LI   $66                 ; 1ecd 20 66
                NS   (IS)+               ; 1ecf fd
                BT   4,A1eeb             ; 1ed0 84 1a
                LR   $5,A                ; 1ed2 55
A1ed3:          LR   $1,A                ; 1ed3 51
                DS   $3                  ; 1ed4 33
                LIS  $0                  ; 1ed5 70
                COM                      ; 1ed6 18
                AS   $1                  ; 1ed7 c1
                NS   $1                  ; 1ed8 f1
                BF   $4,A1ed3            ; 1ed9 94 f9
                LR   A,IS                ; 1edb 0a
                AI   $03                 ; 1edc 24 03
                LR   IS,A                ; 1ede 0b
                LR   A,$5                ; 1edf 45
                NS   (IS)+               ; 1ee0 fd
                BT   4,A1eeb             ; 1ee1 84 09
A1ee3:          LR   $1,A                ; 1ee3 51
                DS   $3                  ; 1ee4 33
                LIS  $0                  ; 1ee5 70
                COM                      ; 1ee6 18
                AS   $1                  ; 1ee7 c1
                NS   $1                  ; 1ee8 f1
                BF   $4,A1ee3            ; 1ee9 94 f9
A1eeb:          LR   A,IS                ; 1eeb 0a
                AI   $fc                 ; 1eec 24 fc
                LR   IS,A                ; 1eee 0b
                NI   $01                 ; 1eef 21 01
                BT   4,A1ecd             ; 1ef1 84 db
                LR   A,$3                ; 1ef3 43
                AS   $0                  ; 1ef4 c0
                LR   $0,A                ; 1ef5 50
                LIS  $0                  ; 1ef6 70
                LR   $3,A                ; 1ef7 53
                LISL 1                   ; 1ef8 69
A1ef9:          LI   $66                 ; 1ef9 20 66
                NS   (IS)+               ; 1efb fd
                BT   4,A1f17             ; 1efc 84 1a
                LR   $5,A                ; 1efe 55
A1eff:          LR   $1,A                ; 1eff 51
                DS   $3                  ; 1f00 33
                LIS  $0                  ; 1f01 70
                COM                      ; 1f02 18
                AS   $1                  ; 1f03 c1
                NS   $1                  ; 1f04 f1
                BF   $4,A1eff            ; 1f05 94 f9
                LR   A,IS                ; 1f07 0a
                AI   $07                 ; 1f08 24 07
                LR   IS,A                ; 1f0a 0b
                LR   A,$5                ; 1f0b 45
                NS   (IS)+               ; 1f0c fd
                BT   4,A1f17             ; 1f0d 84 09
A1f0f:          LR   $1,A                ; 1f0f 51
                DS   $3                  ; 1f10 33
                LIS  $0                  ; 1f11 70
                COM                      ; 1f12 18
                AS   $1                  ; 1f13 c1
                NS   $1                  ; 1f14 f1
                BF   $4,A1f0f            ; 1f15 94 f9
A1f17:          LR   A,IS                ; 1f17 0a
                AI   $f8                 ; 1f18 24 f8
                LR   IS,A                ; 1f1a 0b
                NI   $01                 ; 1f1b 21 01
                BT   4,A1ef9             ; 1f1d 84 db
                LR   A,$3                ; 1f1f 43
                COM                      ; 1f20 18
                INC                      ; 1f21 1f
                AS   $0                  ; 1f22 c0
                LR   $0,A                ; 1f23 50
                BT   4,A1f37             ; 1f24 84 12
                BF   $1,A1f30            ; 1f26 91 09
                CI   $3e                 ; 1f28 25 3e
                BT   1,A1f37             ; 1f2a 81 0c
                LI   $3e                 ; 1f2c 20 3e
                BF   $0,A1f36            ; 1f2e 90 07
A1f30:          CI   $c1                 ; 1f30 25 c1
                BF   $1,A1f37            ; 1f32 91 04
                LI   $c2                 ; 1f34 20 c2
A1f36:          LR   $0,A                ; 1f36 50
A1f37:          LR   A,$b                ; 1f37 4b
                SR   4                   ; 1f38 14
                AI   $fe                 ; 1f39 24 fe
                LR   $5,A                ; 1f3b 55
                DCI  $0fb0               ; 1f3c 2a 0f b0
                AI   $ff                 ; 1f3f 24 ff
                ADC                      ; 1f41 8e
                LM                       ; 1f42 16
                COM                      ; 1f43 18
                INC                      ; 1f44 1f
                AS   $2                  ; 1f45 c2
                CI   $0c                 ; 1f46 25 0c
                BT   1,A1f4b             ; 1f48 81 02
                LIS  $c                  ; 1f4a 7c
A1f4b:          CI   $f4                 ; 1f4b 25 f4
                BF   $1,A1f51            ; 1f4d 91 03
                LI   $f4                 ; 1f4f 20 f4
A1f51:          SL   1                   ; 1f51 13
                SL   1                   ; 1f52 13
                LR   $6,A                ; 1f53 56
                LIS  $0                  ; 1f54 70
                AS   $0                  ; 1f55 c0
                BF   $4,A1f5a            ; 1f56 94 03
                LIS  $0                  ; 1f58 70
                AS   $6                  ; 1f59 c6
A1f5a:          LR   A,$5                ; 1f5a 45
                BF   $1,A1f63            ; 1f5b 91 07
                COM                      ; 1f5d 18
                INC                      ; 1f5e 1f
                AI   $0c                 ; 1f5f 24 0c
                BF   $0,A1f65            ; 1f61 90 03
A1f63:          AI   $f4                 ; 1f63 24 f4
A1f65:          AS   $6                  ; 1f65 c6
                LR   $6,A                ; 1f66 56
                LR   A,$b                ; 1f67 4b
                SR   4                   ; 1f68 14
                SL   1                   ; 1f69 13
                DCI  $0eee               ; 1f6a 2a 0e ee
                ADC                      ; 1f6d 8e
                LR   Q,DC                ; 1f6e 0e
                JMP  A1d9b               ; 1f6f 29 1d 9b
A1f72:          LR   K,P                 ; 1f72 08
                LISU 5                   ; 1f73 65
                LISL 0                   ; 1f74 68
                LIS  $0                  ; 1f75 70
                LR   (IS),A              ; 1f76 5c
                LISU 3                   ; 1f77 63
                LIS  $4                  ; 1f78 74
                LR   $0,A                ; 1f79 50
                BF   $0,A1f80            ; 1f7a 90 05
A1f7c:          LR   A,IS                ; 1f7c 0a
                AI   $30                 ; 1f7d 24 30
                LR   IS,A                ; 1f7f 0b
A1f80:          LR   A,(IS)              ; 1f80 4c
                LR   $1,A                ; 1f81 51
                LR   A,IS                ; 1f82 0a
                AI   $04                 ; 1f83 24 04
                LR   IS,A                ; 1f85 0b
                LR   A,(IS)              ; 1f86 4c
                AS   $1                  ; 1f87 c1
                LR   $1,A                ; 1f88 51
                LR   A,IS                ; 1f89 0a
                AI   $0d                 ; 1f8a 24 0d
                LR   IS,A                ; 1f8c 0b
                LR   A,$1                ; 1f8d 41
                COM                      ; 1f8e 18
                LR   (IS),A              ; 1f8f 5c
                DS   $0                  ; 1f90 30
                BF   $4,A1f7c            ; 1f91 94 ea
                LR   A,(IS)+             ; 1f93 4d
                LIS  $0                  ; 1f94 70
                LR   (IS),A              ; 1f95 5c
                PK                       ; 1f96 0c
A1f97:          LR   $a,A                ; 1f97 5a
                DS   (IS)                ; 1f98 3c
                COM                      ; 1f99 18
A1f9a:          DS   (IS)                ; 1f9a 3c
                LIS  $e                  ; 1f9b 7e
                LIS  $e                  ; 1f9c 7e
                LIS  $e                  ; 1f9d 7e
A1f9e:          DS   (IS)                ; 1f9e 3c
                LR   A,$2                ; 1f9f 42
                LR   A,$2                ; 1fa0 42
                LR   A,$2                ; 1fa1 42
                DS   (IS)                ; 1fa2 3c
A1fa3:          LR   A,$7                ; 1fa3 47
                LR   QL,A                ; 1fa4 07
                LIS  $8                  ; 1fa5 78
                LR   A,$0                ; 1fa6 40
                LR   A,QL                ; 1fa7 03
                INC                      ; 1fa8 1f
                DS   (IS)                ; 1fa9 3c
                LR   A,QL                ; 1faa 03
                LR   J,W                 ; 1fab 1e
                DS   $5                  ; 1fac 35
                LR   QL,A                ; 1fad 07
                LR   J,W                 ; 1fae 1e
                DS   $0                  ; 1faf 30
                LR   A,QL                ; 1fb0 03
                LR   J,W                 ; 1fb1 1e
                db   $2d                 
                LR   A,QL                ; 1fb3 03
                LR   DC,Q                ; 1fb4 0f
                db   $2d                 
                LR   A,QL                ; 1fb6 03
                LR   DC,Q                ; 1fb7 0f
                PI   $075a               ; 1fb8 28 07 5a
                DS   (IS)                ; 1fbb 3c
                LR   A,QL                ; 1fbc 03
                LR   DC,Q                ; 1fbd 0f
                DS   $5                  ; 1fbe 35
                LR   QL,A                ; 1fbf 07
                LR   DC,Q                ; 1fc0 0f
                DS   $0                  ; 1fc1 30
                LR   A,QL                ; 1fc2 03
                LR   J,W                 ; 1fc3 1e
                DS   (IS)                ; 1fc4 3c
                LR   A,QL                ; 1fc5 03
                LR   J,W                 ; 1fc6 1e
                DS   (IS)                ; 1fc7 3c
                LR   A,QL                ; 1fc8 03
                LR   J,W                 ; 1fc9 1e
                LR   $0,A                ; 1fca 50
                LR   QL,A                ; 1fcb 07
                LR   DC,Q                ; 1fcc 0f
A1fcd:          PI   $072d               ; 1fcd 28 07 2d
                LI   $03                 ; 1fd0 20 03
                LR   DC,Q                ; 1fd2 0f
                LR   J,W                 ; 1fd3 1e
                LR   A,QL                ; 1fd4 03
                LR   DC,Q                ; 1fd5 0f
                LI   $03                 ; 1fd6 20 03
                LR   DC,Q                ; 1fd8 0f
                AI   $03                 ; 1fd9 24 03
                LR   DC,Q                ; 1fdb 0f
                PI   $071e               ; 1fdc 28 07 1e
                LR   J,W                 ; 1fdf 1e
                LR   A,QL                ; 1fe0 03
                LR   DC,Q                ; 1fe1 0f
                LI   $03                 ; 1fe2 20 03
                LR   J,W                 ; 1fe4 1e
                PI   $072d               ; 1fe5 28 07 2d
                LI   $03                 ; 1fe8 20 03
                LR   DC,Q                ; 1fea 0f
                LR   J,W                 ; 1feb 1e
                LR   A,QL                ; 1fec 03
                LR   DC,Q                ; 1fed 0f
                LI   $03                 ; 1fee 20 03
                LR   DC,Q                ; 1ff0 0f
                PI   $072d               ; 1ff1 28 07 2d
                LI   $03                 ; 1ff4 20 03
                db   $2d                 
                LR   A,KU                ; 1ff7 00
                LR   A,KU                ; 1ff8 00
                LR   A,KU                ; 1ff9 00
                LR   A,KU                ; 1ffa 00
                LR   A,KU                ; 1ffb 00
                LR   A,KU                ; 1ffc 00
                LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
