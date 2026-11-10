; Financier (VB-81). This listing covers only $1000-$1FFF (4096 bytes)
; Calls and data references into $3000-$3FFF go to bytes missing from this dump
; Source: https://orphanedgames.com/videobrain/f8_programming/f8_source.htm

org $1000

                INS  10                  ; 1000 aa
                LR   $5,A                ; 1001 55
                LR   A,QU                ; 1002 02
                LR   A,KU                ; 1003 00
                LR   A,KU                ; 1004 00
                LR   A,KU                ; 1005 00
                LR   A,KU                ; 1006 00
                LR   A,KU                ; 1007 00
                db   $2f                 
                db   $2d                 
                POP                      ; 100a 1c
                PK                       ; 100b 0c
                AI   $00                 ; 100c 24 00
                LR   A,KU                ; 100e 00
                LR   A,KU                ; 100f 00
                LR   A,KU                ; 1010 00
                LR   A,KU                ; 1011 00
                DCI  $0fdf               ; 1012 2a 0f df
                LIS  $0                  ; 1015 70
                ST                       ; 1016 17
                PI   $45b0               ; 1017 28 45 b0
                LI   $5b                 ; 101a 20 5b
                LISU 2                   ; 101c 62
                LISL 4                   ; 101d 6c
                LR   (IS),A              ; 101e 5c
                DCI  A1079               ; 101f 2a 10 79
                PI   $4205               ; 1022 28 42 05
                DCI  $0fe3               ; 1025 2a 0f e3
                LIS  $0                  ; 1028 70
                ST                       ; 1029 17
A102a:          PI   $43d6               ; 102a 28 43 d6
                BT   4,A102a             ; 102d 84 fc
                BF   $1,A102a            ; 102f 91 fa
                LI   $c5                 ; 1031 20 c5
                AS   $8                  ; 1033 c8
                BF   $2,A1038            ; 1034 92 03
                LIS  $0                  ; 1036 70
                LR   $8,A                ; 1037 58
A1038:          PI   $175d               ; 1038 28 17 5d
                DCI  $0f7f               ; 103b 2a 0f 7f
                LIS  $0                  ; 103e 70
                ST                       ; 103f 17
                LR   A,$7                ; 1040 47
                ST                       ; 1041 17
                LIS  $0                  ; 1042 70
                LISU 5                   ; 1043 65
                LISL 3                   ; 1044 6b
                LR   (IS),A              ; 1045 5c
                LISU 6                   ; 1046 66
                LISL 7                   ; 1047 6f
                LR   (IS),A              ; 1048 5c
                DCI  $0fdd               ; 1049 2a 0f dd
                LIS  $0                  ; 104c 70
                ST                       ; 104d 17
                ST                       ; 104e 17
                DCI  $0c18               ; 104f 2a 0c 18
                LI   $11                 ; 1052 20 11
                ST                       ; 1054 17
                LI   $b7                 ; 1055 20 b7
                ST                       ; 1057 17
                LI   $10                 ; 1058 20 10
                OUTS 12                  ; 105a bc
                LI   $d5                 ; 105b 20 d5
                OUTS 13                  ; 105d bd
                DCI  $0fea               ; 105e 2a 0f ea
                LR   H,DC                ; 1061 11
                LIS  $8                  ; 1062 78
                OM                       ; 1063 8b
                NI   $5c                 ; 1064 21 5c
                LR   DC,H                ; 1066 10
                ST                       ; 1067 17
                DCI  $08f7               ; 1068 2a 08 f7
                ST                       ; 106b 17
                LISL 4                   ; 106c 6c
                LI   $11                 ; 106d 20 11
                LR   (IS)+,A             ; 106f 5d
                LI   $25                 ; 1070 20 25
                LR   (IS),A              ; 1072 5c
                PI   $10d4               ; 1073 28 10 d4
                JMP  A13a6               ; 1076 29 13 a6
; Menu text in VideoBrain character codes, not executable instructions:
; ENTER FUNCTION:  LOAN SAVE ROI   CALC ACP  ACI   IPP  AOL  R78   DB
; SOD  SL   OR FORMULA:
A1079:          LR   IS,A                ; 1079 0b
                NOP                      ; 107a 2b
                LR   QL,A                ; 107b 07
                LR   IS,A                ; 107c 0b
                LR   P,K                 ; 107d 09
                LR   A,KU                ; 107e 00
                LR   W,J                 ; 107f 1d
                LR   A,QL                ; 1080 03
                NOP                      ; 1081 2b
                DS   $1                  ; 1082 31
                LR   QL,A                ; 1083 07
                LR   A,KL                ; 1084 01
                SL   1                   ; 1085 13
                NOP                      ; 1086 2b
                DCI  $0000               ; 1087 2a 00 00
                OUT  $13                 ; 108a 27 13
                LR   H,DC                ; 108c 11
                NOP                      ; 108d 2b
                LR   A,KU                ; 108e 00
                NI   $11                 ; 108f 21 11
                db   $2f                 
                LR   IS,A                ; 1092 0b
                LR   A,KU                ; 1093 00
                LR   P,K                 ; 1094 09
                SL   1                   ; 1095 13
                LR   A,KL                ; 1096 01
                LR   A,KU                ; 1097 00
                LR   A,KU                ; 1098 00
                LR   A,KU                ; 1099 00
                DS   $1                  ; 109a 31
                LR   H,DC                ; 109b 11
                OUT  $31                 ; 109c 27 31
                LR   A,KU                ; 109e 00
                LR   H,DC                ; 109f 11
                DS   $1                  ; 10a0 31
                CI   $00                 ; 10a1 25 00
                LR   A,KU                ; 10a3 00
                LR   H,DC                ; 10a4 11
                DS   $1                  ; 10a5 31
                LR   A,KL                ; 10a6 01
                LR   A,KU                ; 10a7 00
                LR   A,KU                ; 10a8 00
                LR   A,KU                ; 10a9 00
                LR   A,KL                ; 10aa 01
                CI   $25                 ; 10ab 25 25
                LR   A,KU                ; 10ad 00
                LR   A,KU                ; 10ae 00
                LR   H,DC                ; 10af 11
                SL   1                   ; 10b0 13
                OUT  $00                 ; 10b1 27 00
                LR   A,KU                ; 10b3 00
                LR   P,K                 ; 10b4 09
                LR   Q,DC                ; 10b5 0e
                PK                       ; 10b6 0c
                LR   A,KU                ; 10b7 00
                LR   A,KU                ; 10b8 00
                LR   A,KU                ; 10b9 00
                INC                      ; 10ba 1f
                db   $2d                 
                LR   A,KU                ; 10bc 00
                LR   A,KU                ; 10bd 00
                LR   A,KU                ; 10be 00
                NI   $13                 ; 10bf 21 13
                INC                      ; 10c1 1f
                LR   A,KU                ; 10c2 00
                LR   A,KU                ; 10c3 00
                NI   $27                 ; 10c4 21 27
                LR   A,KU                ; 10c6 00
                LR   A,KU                ; 10c7 00
                LR   A,KU                ; 10c8 00
                SL   1                   ; 10c9 13
                LR   P,K                 ; 10ca 09
                LR   A,KU                ; 10cb 00
                LR   W,J                 ; 10cc 1d
                SL   1                   ; 10cd 13
                LR   P,K                 ; 10ce 09
                JMP  $0327               ; 10cf 29 03 27
                LR   H,DC                ; 10d2 11
                DCI  A1a50               ; 10d3 2a 1a 50
                LR   A,IS                ; 10d6 0a
                LISU 7                   ; 10d7 67
                LISL 5                   ; 10d8 6d
                LR   (IS),A              ; 10d9 5c
                LISU 6                   ; 10da 66
                LISL 0                   ; 10db 68
                LR   A,KU                ; 10dc 00
                LR   (IS)+,A             ; 10dd 5d
                LR   A,KL                ; 10de 01
                LR   (IS)+,A             ; 10df 5d
                LR   K,P                 ; 10e0 08
                LR   A,KU                ; 10e1 00
                LR   (IS)+,A             ; 10e2 5d
                LR   A,KL                ; 10e3 01
                LR   (IS)+,A             ; 10e4 5d
                LR   A,(IS)+             ; 10e5 4d
                LR   KU,A                ; 10e6 04
                LR   A,(IS)-             ; 10e7 4e
                LR   KL,A                ; 10e8 05
                LR   A,$9                ; 10e9 49
                LR   (IS)+,A             ; 10ea 5d
                LR   J,W                 ; 10eb 1e
                LR   A,$9                ; 10ec 49
                LR   (IS),A              ; 10ed 5c
                LR   A,$b                ; 10ee 4b
                LISU 5                   ; 10ef 65
                LISL 2                   ; 10f0 6a
                LR   (IS)+,A             ; 10f1 5d
                LR   A,$a                ; 10f2 4a
                LR   $9,A                ; 10f3 59
                LR   H,DC                ; 10f4 11
; $10F7 is the low address byte of this DCI, so $30F7 can't be a mirror
; of $10F7
                DCI  $0c04               ; 10f5 2a 0c 04
                LR   A,(IS)-             ; 10f8 4e
                ADC                      ; 10f9 8e
                LR   A,$a                ; 10fa 4a
                ST                       ; 10fb 17
                LR   A,$b                ; 10fc 4b
                ST                       ; 10fd 17
                LR   A,$9                ; 10fe 49
                ST                       ; 10ff 17
                LR   A,(IS)              ; 1100 4c
                ST                       ; 1101 17
                PK                       ; 1102 0c
A1103:          LIS  $4                  ; 1103 74
                DCI  $08f5               ; 1104 2a 08 f5
                ST                       ; 1107 17
                LISU 6                   ; 1108 66
                LISL 7                   ; 1109 6f
                LR   A,(IS)              ; 110a 4c
                OI   $40                 ; 110b 22 40
                LR   (IS),A              ; 110d 5c
                DCI  A1115               ; 110e 2a 11 15
                LI   $e9                 ; 1111 20 e9
                BF   $0,A113b            ; 1113 90 27
A1115:          PI   A119c               ; 1115 28 11 9c
                LISU 6                   ; 1118 66
                LISL 7                   ; 1119 6f
                LR   A,(IS)              ; 111a 4c
                OI   $a0                 ; 111b 22 a0
                LR   (IS),A              ; 111d 5c
                LIS  $e                  ; 111e 7e
                LISU 5                   ; 111f 65
                LISL 3                   ; 1120 6b
                LR   (IS),A              ; 1121 5c
                PI   A117a               ; 1122 28 11 7a
                DCI  A1103               ; 1125 2a 11 03
                LI   $b2                 ; 1128 20 b2
                BF   $0,A113b            ; 112a 90 10
                PI   A119c               ; 112c 28 11 9c
                LIS  $0                  ; 112f 70
                LISU 5                   ; 1130 65
                LISL 3                   ; 1131 6b
                LR   (IS),A              ; 1132 5c
                PI   A117a               ; 1133 28 11 7a
                DCI  A1103               ; 1136 2a 11 03
                BF   $0,A1143            ; 1139 90 09
A113b:          LR   H,DC                ; 113b 11
                DCI  $08f0               ; 113c 2a 08 f0
                ST                       ; 113f 17
                LIS  $1                  ; 1140 71
                OUTS 14                  ; 1141 be
                LR   DC,H                ; 1142 10
A1143:          LR   H,DC                ; 1143 11
                LR   A,$a                ; 1144 4a
                LR   KU,A                ; 1145 04
                LR   A,$b                ; 1146 4b
                LR   KL,A                ; 1147 05
                LISU 6                   ; 1148 66
                LISL 5                   ; 1149 6d
                LR   A,(IS)-             ; 114a 4e
                LR   $9,A                ; 114b 59
                LR   W,J                 ; 114c 1d
                LR   A,(IS)              ; 114d 4c
                LR   $9,A                ; 114e 59
                LR   A,KU                ; 114f 00
                LR   (IS)+,A             ; 1150 5d
                LR   A,KL                ; 1151 01
                LR   (IS),A              ; 1152 5c
                DCI  $0c04               ; 1153 2a 0c 04
                LISU 5                   ; 1156 65
                LISL 3                   ; 1157 6b
                LR   A,(IS)              ; 1158 4c
                ADC                      ; 1159 8e
                LM                       ; 115a 16
                LR   $a,A                ; 115b 5a
                LM                       ; 115c 16
                LR   $b,A                ; 115d 5b
                LM                       ; 115e 16
                LR   KU,A                ; 115f 04
                LM                       ; 1160 16
                LR   KL,A                ; 1161 05
                LR   DC,H                ; 1162 10
                LR   A,KU                ; 1163 00
                LR   $a,A                ; 1164 5a
                LR   A,KL                ; 1165 01
                LR   $b,A                ; 1166 5b
                LISU 6                   ; 1167 66
                LISL 2                   ; 1168 6a
                LR   A,(IS)+             ; 1169 4d
                LR   KU,A                ; 116a 04
                LR   A,(IS)              ; 116b 4c
                LR   KL,A                ; 116c 05
                LR   P,K                 ; 116d 09
                LISL 0                   ; 116e 68
                LR   A,(IS)+             ; 116f 4d
                LR   KU,A                ; 1170 04
                LR   A,(IS)              ; 1171 4c
                LR   KL,A                ; 1172 05
                LISU 7                   ; 1173 67
                LISL 5                   ; 1174 6d
                LR   A,(IS)              ; 1175 4c
                LR   IS,A                ; 1176 0b
                LR   A,$0                ; 1177 40
                EI                       ; 1178 1b
                POP                      ; 1179 1c
A117a:          DCI  $0c08               ; 117a 2a 0c 08
                LISU 5                   ; 117d 65
                LISL 3                   ; 117e 6b
                LR   A,(IS)              ; 117f 4c
                ADC                      ; 1180 8e
                LISU 6                   ; 1181 66
                LISL 0                   ; 1182 68
                LM                       ; 1183 16
                LR   (IS)+,A             ; 1184 5d
                LM                       ; 1185 16
                LR   (IS)+,A             ; 1186 5d
                LM                       ; 1187 16
                LR   (IS)+,A             ; 1188 5d
                LM                       ; 1189 16
                LR   (IS)+,A             ; 118a 5d
                LM                       ; 118b 16
                LR   (IS)+,A             ; 118c 5d
                LM                       ; 118d 16
                LR   (IS),A              ; 118e 5c
                LISU 7                   ; 118f 67
                LM                       ; 1190 16
                LR   (IS),A              ; 1191 5c
                LM                       ; 1192 16
                LR   $a,A                ; 1193 5a
                LM                       ; 1194 16
                LR   $b,A                ; 1195 5b
                XDC                      ; 1196 2c
                LR   DC,H                ; 1197 10
                XDC                      ; 1198 2c
                LM                       ; 1199 16
                LR   $0,A                ; 119a 50
                POP                      ; 119b 1c
A119c:          LISU 6                   ; 119c 66
                LISL 0                   ; 119d 68
                LR   A,(IS)+             ; 119e 4d
                ST                       ; 119f 17
                LR   A,(IS)+             ; 11a0 4d
                ST                       ; 11a1 17
                LR   A,(IS)+             ; 11a2 4d
                ST                       ; 11a3 17
                LR   A,(IS)+             ; 11a4 4d
                ST                       ; 11a5 17
                LR   A,(IS)+             ; 11a6 4d
                ST                       ; 11a7 17
                LR   A,(IS)              ; 11a8 4c
                ST                       ; 11a9 17
                LISU 7                   ; 11aa 67
                LR   A,(IS)              ; 11ab 4c
                ST                       ; 11ac 17
                XDC                      ; 11ad 2c
                LR   H,DC                ; 11ae 11
                XDC                      ; 11af 2c
                LR   A,$a                ; 11b0 4a
                ST                       ; 11b1 17
                LR   A,$b                ; 11b2 4b
                ST                       ; 11b3 17
                LR   A,$0                ; 11b4 40
                ST                       ; 11b5 17
                POP                      ; 11b6 1c
                DCI  $0fba               ; 11b7 2a 0f ba
                XDC                      ; 11ba 2c
                DCI  $0fb7               ; 11bb 2a 0f b7
                LIS  $6                  ; 11be 76
                LISU 2                   ; 11bf 62
                LISL 0                   ; 11c0 68
                LR   (IS),A              ; 11c1 5c
                PI   $43cd               ; 11c2 28 43 cd
                DCI  $0fc3               ; 11c5 2a 0f c3
                XDC                      ; 11c8 2c
                DCI  $0fbd               ; 11c9 2a 0f bd
                LIS  $6                  ; 11cc 76
                LR   (IS),A              ; 11cd 5c
                PI   $43cd               ; 11ce 28 43 cd
                DCI  A131a               ; 11d1 2a 13 1a
                LM                       ; 11d4 16
A11d5:          LR   (IS),A              ; 11d5 5c
                LM                       ; 11d6 16
                LR   $a,A                ; 11d7 5a
                LM                       ; 11d8 16
                LR   $b,A                ; 11d9 5b
                XDC                      ; 11da 2c
                LR   DC,H                ; 11db 10
                PI   $43cd               ; 11dc 28 43 cd
                XDC                      ; 11df 2c
                LIS  $0                  ; 11e0 70
                XM                       ; 11e1 8c
                BF   $4,A11d5            ; 11e2 94 f2
                DCI  $0ffa               ; 11e4 2a 0f fa
                LIS  $6                  ; 11e7 76
                ST                       ; 11e8 17
A11e9:          DCI  $0def               ; 11e9 2a 0d ef
                XDC                      ; 11ec 2c
                DCI  $0806               ; 11ed 2a 08 06
                LIS  $a                  ; 11f0 7a
                LISL 0                   ; 11f1 68
                LR   (IS),A              ; 11f2 5c
                PI   $43cd               ; 11f3 28 43 cd
                DCI  $0816               ; 11f6 2a 08 16
                LIS  $a                  ; 11f9 7a
                LR   (IS),A              ; 11fa 5c
                PI   $43cd               ; 11fb 28 43 cd
                DCI  $0836               ; 11fe 2a 08 36
                LIS  $a                  ; 1201 7a
                LR   (IS),A              ; 1202 5c
                PI   $43cd               ; 1203 28 43 cd
                LIS  $2                  ; 1206 72
                DCI  $08f5               ; 1207 2a 08 f5
                ST                       ; 120a 17
                LISU 6                   ; 120b 66
                LISL 7                   ; 120c 6f
                LIS  $8                  ; 120d 78
                NS   (IS)                ; 120e fc
                BF   $4,A1248            ; 120f 94 38
                DCI  $0852               ; 1211 2a 08 52
                LR   H,DC                ; 1214 11
                LM                       ; 1215 16
                XDC                      ; 1216 2c
                DCI  $0856               ; 1217 2a 08 56
                ST                       ; 121a 17
                LR   DC,H                ; 121b 10
                LIS  $4                  ; 121c 74
                LISU 2                   ; 121d 62
                LISL 0                   ; 121e 68
                LR   (IS),A              ; 121f 5c
                PI   $43cd               ; 1220 28 43 cd
                LI   $73                 ; 1223 20 73
                ST                       ; 1225 17
                LIS  $7                  ; 1226 77
                LR   (IS),A              ; 1227 5c
                DCI  $0fdf               ; 1228 2a 0f df
                LR   H,DC                ; 122b 11
                LM                       ; 122c 16
                SR   4                   ; 122d 14
                AI   $ff                 ; 122e 24 ff
                NI   $03                 ; 1230 21 03
                SL   4                   ; 1232 15
                LR   DC,H                ; 1233 10
                ST                       ; 1234 17
                DCI  $0fdf               ; 1235 2a 0f df
                LM                       ; 1238 16
                DCI  $0c2f               ; 1239 2a 0c 2f
A123c:          ADC                      ; 123c 8e
                DS   (IS)                ; 123d 3c
                BF   $4,A123c            ; 123e 94 fd
                LI   $70                 ; 1240 20 70
                LR   (IS),A              ; 1242 5c
                LIS  $0                  ; 1243 70
A1244:          ST                       ; 1244 17
                DS   (IS)                ; 1245 3c
                BF   $4,A1244            ; 1246 94 fd
A1248:          LISU 6                   ; 1248 66
                LISL 7                   ; 1249 6f
                LIS  $4                  ; 124a 74
                NS   (IS)                ; 124b fc
                BF   $4,A1256            ; 124c 94 09
                DCI  $0e18               ; 124e 2a 0e 18
                LM                       ; 1251 16
                DCI  $0845               ; 1252 2a 08 45
                ST                       ; 1255 17
A1256:          LR   A,(IS)              ; 1256 4c
                NI   $14                 ; 1257 21 14
                CI   $14                 ; 1259 25 14
                BT   4,A1277             ; 125b 84 1b
                DCI  $0867               ; 125d 2a 08 67
                XDC                      ; 1260 2c
                DCI  $0857               ; 1261 2a 08 57
                LISU 2                   ; 1264 62
                LISL 0                   ; 1265 68
                LIS  $9                  ; 1266 79
                LR   (IS),A              ; 1267 5c
                PI   $43cd               ; 1268 28 43 cd
                DCI  $0887               ; 126b 2a 08 87
                XDC                      ; 126e 2c
                DCI  $0877               ; 126f 2a 08 77
                LIS  $9                  ; 1272 79
                LR   (IS),A              ; 1273 5c
                PI   $43cd               ; 1274 28 43 cd
A1277:          LISU 6                   ; 1277 66
                LISL 7                   ; 1278 6f
                LR   A,(IS)              ; 1279 4c
                OI   $1c                 ; 127a 22 1c
                LR   (IS),A              ; 127c 5c
                PI   $424d               ; 127d 28 42 4d
                LISU 6                   ; 1280 66
                LISL 4                   ; 1281 6c
                LI   $11                 ; 1282 20 11
                LR   (IS)+,A             ; 1284 5d
                LI   $2c                 ; 1285 20 2c
                LR   (IS),A              ; 1287 5c
                PI   $10d4               ; 1288 28 10 d4
A128b:          LISU 2                   ; 128b 62
                LISL 4                   ; 128c 6c
                DS   (IS)                ; 128d 3c
                BT   1,A12a3             ; 128e 81 14
                DCI  $0c09               ; 1290 2a 0c 09
                LM                       ; 1293 16
                NI   $e0                 ; 1294 21 e0
                DCI  $0dfa               ; 1296 2a 0d fa
                LR   H,DC                ; 1299 11
                LR   (IS),A              ; 129a 5c
                LM                       ; 129b 16
                NI   $1f                 ; 129c 21 1f
                XS   (IS)                ; 129e ec
                LR   DC,H                ; 129f 10
                ST                       ; 12a0 17
                LIS  $c                  ; 12a1 7c
                LR   (IS),A              ; 12a2 5c
A12a3:          JMP  A11e9               ; 12a3 29 11 e9
                db   $ff                 
A12a7:          LR   A,KU                ; 12a7 00
                db   $ff                 
                LR   A,KU                ; 12a9 00
                db   $ff                 
                LR   A,KU                ; 12ab 00
                db   $ff                 
                LR   A,KU                ; 12ad 00
                db   $ff                 
                LR   A,KU                ; 12af 00
                db   $ff                 
                LR   A,KU                ; 12b1 00
                db   $ff                 
                LR   A,KU                ; 12b3 00
                db   $ff                 
                LR   A,KU                ; 12b5 00
                db   $ff                 
                LR   A,KU                ; 12b7 00
                db   $ff                 
                LR   A,KU                ; 12b9 00
                db   $ff                 
                LR   A,KU                ; 12bb 00
                db   $ff                 
                LR   A,KU                ; 12bd 00
                db   $ff                 
                LR   A,KU                ; 12bf 00
                db   $ff                 
                LR   A,KU                ; 12c1 00
                db   $ff                 
                LR   A,KU                ; 12c3 00
                db   $ff                 
                LR   A,KU                ; 12c5 00
                db   $ff                 
                LR   A,KU                ; 12c7 00
A12c8:          db   $ff                 
                db   $ff                 
A12ca:          db   $ff                 
                db   $ff                 
A12cc:          db   $ff                 
                db   $ff                 
A12ce:          db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
A12db:          db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
A12f6:          db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                BF   $f,A12a7            ; 1307 9f 9f
                BF   $f,A128b            ; 1309 9f 81
A130b:          BT   1,A130b             ; 130b 81 ff
                BF   $9,A12a7            ; 130d 99 99
                db   $99
                db   $81
A1311:          BT   1,A1311             ; 1311 81 ff
A1313:          NS   (IS)-               ; 1313 fe
                NS   (IS)-               ; 1314 fe
                NS   (IS)-               ; 1315 fe
                NS   (IS)-               ; 1316 fe
                NS   (IS)-               ; 1317 fe
                NS   (IS)-               ; 1318 fe
                NS   (IS)-               ; 1319 fe
A131a:          LR   A,KL                ; 131a 01
                LR   DC,Q                ; 131b 0f
                OUTS 5                   ; 131c b5
                AS   $8                  ; 131d c8
                LR   A,IS                ; 131e 0a
                LR   P0,Q                ; 131f 0d
                db   $ef                 
                AS   $8                  ; 1321 c8
                INS  6                   ; 1322 a6
                AS   $8                  ; 1323 c8
                AS   $8                  ; 1324 c8
                AS   $8                  ; 1325 c8
                AS   $8                  ; 1326 c8
                AS   $8                  ; 1327 c8
                AS   $8                  ; 1328 c8
                AS   $8                  ; 1329 c8
                AS   $8                  ; 132a c8
                LR   A,QU                ; 132b 02
                LR   DC,Q                ; 132c 0f
                OUTS 11                  ; 132d bb
                LIS  $2                  ; 132e 72
                NS   $3                  ; 132f f3
                LR   A,IS                ; 1330 0a
                LR   P0,Q                ; 1331 0d
                NS   $9                  ; 1332 f9
                SR   1                   ; 1333 12
                LIS  $2                  ; 1334 72
                BF   $2,A12c8            ; 1335 92 92
                BF   $2,A12ca            ; 1337 92 92
                BF   $2,A12cc            ; 1339 92 92
                BF   $2,A12ce            ; 133b 92 92
                PK                       ; 133d 0c
                LR   K,P                 ; 133e 08
                AI   $98                 ; 133f 24 98
                LR   A,$1                ; 1341 41
                BF   $0,A12db            ; 1342 90 98
                LR   A,KL                ; 1344 01
                LR   A,KL                ; 1345 01
                LR   A,KL                ; 1346 01
                LR   A,KL                ; 1347 01
                LR   A,KL                ; 1348 01
                LR   A,KL                ; 1349 01
                LR   A,KL                ; 134a 01
                LR   A,KL                ; 134b 01
                LR   A,QU                ; 134c 02
                LR   Q,DC                ; 134d 0e
                LR   A,QL                ; 134e 03
                LR   A,KL                ; 134f 01
                XI   $0c                 ; 1350 23 0c
                LR   K,P                 ; 1352 08
                LR   A,$4                ; 1353 44
                LR   A,KU                ; 1354 00
                LI   $20                 ; 1355 20 20
                LR   A,KU                ; 1357 00
                LI   $34                 ; 1358 20 34
                LR   A,$8                ; 135a 48
                LR   (IS),A              ; 135b 5c
                LIS  $0                  ; 135c 70
                BT   4,A12f6             ; 135d 84 98
                INS  12                  ; 135f ac
                LR   QL,A                ; 1360 07
                LR   K,P                 ; 1361 08
                LR   $0,A                ; 1362 50
                OUTS 4                   ; 1363 b4
                LR   H,DC                ; 1364 11
                OUTS 14                  ; 1365 be
                db   $df                 
                ASD  $4                  ; 1367 d4
                AS   $9                  ; 1368 c9
                LIS  $3                  ; 1369 73
                LR   QL,A                ; 136a 07
                LR   K,P                 ; 136b 08
                LISU 0                   ; 136c 60
                LR   A,KU                ; 136d 00
                LR   A,KU                ; 136e 00
                LR   A,KU                ; 136f 00
                LR   A,KU                ; 1370 00
                LR   A,KU                ; 1371 00
                LR   A,KU                ; 1372 00
                LR   A,KU                ; 1373 00
                LR   A,QU                ; 1374 02
                PK                       ; 1375 0c
                LR   A,KU                ; 1376 00
                LR   K,P                 ; 1377 08
                JMP  $0708               ; 1378 29 07 08
                LIS  $0                  ; 137b 70
                LR   KU,A                ; 137c 04
                LR   QL,A                ; 137d 07
                LR   A,KU                ; 137e 00
                LR   A,KL                ; 137f 01
                LR   A,QU                ; 1380 02
                LR   A,QL                ; 1381 03
                LR   QU,A                ; 1382 06
                LR   P,K                 ; 1383 09
                LR   K,P                 ; 1384 08
                db   $87
                db   $88
                BT   5,A1311             ; 1387 85 89
                NM                       ; 1389 8a
                OM                       ; 138a 8b
                XM                       ; 138b 8c
                CM                       ; 138c 8d
                ADC                      ; 138d 8e
                BR7  A139a               ; 138e 8f 0b
                LR   Q,DC                ; 1390 0e
                LR   P0,Q                ; 1391 0d
                LR   K,P                 ; 1392 08
                LR   QU,A                ; 1393 06
                LR   A,KL                ; 1394 01
                LR   QL,A                ; 1395 07
                LR   P,K                 ; 1396 09
                LR   A,IS                ; 1397 0a
                LR   IS,A                ; 1398 0b
                PK                       ; 1399 0c
A139a:          LR   P0,Q                ; 139a 0d
                LR   Q,DC                ; 139b 0e
                LR   DC,Q                ; 139c 0f
                LR   A,KU                ; 139d 00
A139e:          LR   K,P                 ; 139e 08
                EI                       ; 139f 1b
                DCI  A13ea               ; 13a0 2a 13 ea
                LR   Q,DC                ; 13a3 0e
                BF   $0,A13d4            ; 13a4 90 2f
A13a6:          LI   $1c                 ; 13a6 20 1c
                LR   $4,A                ; 13a8 54
                PI   A183c               ; 13a9 28 18 3c
                DCI  $0e5e               ; 13ac 2a 0e 5e
                LIS  $1                  ; 13af 71
                ST                       ; 13b0 17
                LR   $3,A                ; 13b1 53
A13b2:          LR   A,$3                ; 13b2 43
                INC                      ; 13b3 1f
                LR   $3,A                ; 13b4 53
                ST                       ; 13b5 17
                LIS  $0                  ; 13b6 70
                ST                       ; 13b7 17
                LIS  $7                  ; 13b8 77
                ADC                      ; 13b9 8e
                LI   $15                 ; 13ba 20 15
                XS   $3                  ; 13bc e3
                BF   $4,A13b2            ; 13bd 94 f4
                ST                       ; 13bf 17
                ST                       ; 13c0 17
                DCI  $0860               ; 13c1 2a 08 60
                LI   $7f                 ; 13c4 20 7f
                ST                       ; 13c6 17
                ST                       ; 13c7 17
                LISU 7                   ; 13c8 67
                LISL 6                   ; 13c9 6e
                LIS  $1                  ; 13ca 71
                LR   (IS),A              ; 13cb 5c
                LISU 5                   ; 13cc 65
                LISL 1                   ; 13cd 69
                LIS  $7                  ; 13ce 77
                LR   (IS),A              ; 13cf 5c
                DCI  A13fa               ; 13d0 2a 13 fa
                LR   Q,DC                ; 13d3 0e
A13d4:          LR   J,W                 ; 13d4 1e
                PI   $40d0               ; 13d5 28 40 d0
                LIS  $0                  ; 13d8 70
                LISU 5                   ; 13d9 65
                LISL 4                   ; 13da 6c
                LR   (IS)+,A             ; 13db 5d
                LI   $85                 ; 13dc 20 85
                LR   (IS)+,A             ; 13de 5d
                DCI  $0fb0               ; 13df 2a 0f b0
                LIS  $0                  ; 13e2 70
                COM                      ; 13e3 18
                ST                       ; 13e4 17
                LISL 7                   ; 13e5 6f
                LIS  $0                  ; 13e6 70
                LR   (IS)-,A             ; 13e7 5e
                LISU 6                   ; 13e8 66
                LR   P0,Q                ; 13e9 0d
A13ea:          LIS  $8                  ; 13ea 78
                NS   (IS)                ; 13eb fc
                LR   (IS),A              ; 13ec 5c
                LIS  $3                  ; 13ed 73
                LR   $1,A                ; 13ee 51
                PI   A1971               ; 13ef 28 19 71
                LIS  $a                  ; 13f2 7a
                LR   $1,A                ; 13f3 51
                PI   A1971               ; 13f4 28 19 71
                JMP  A152a               ; 13f7 29 15 2a
A13fa:          LIS  $3                  ; 13fa 73
                LR   (IS),A              ; 13fb 5c
                LIS  $8                  ; 13fc 78
                LR   $4,A                ; 13fd 54
A13fe:          PI   A183c               ; 13fe 28 18 3c
                LISL 6                   ; 1401 6e
                DS   (IS)                ; 1402 3c
                BF   $4,A13fe            ; 1403 94 fa
                DCI  $0f7f               ; 1405 2a 0f 7f
                LR   H,DC                ; 1408 11
                LIS  $2                  ; 1409 72
                LR   $3,A                ; 140a 53
                PI   A1649               ; 140b 28 16 49
A140e:          PI   $1a28               ; 140e 28 1a 28
                LISU 5                   ; 1411 65
                LISL 6                   ; 1412 6e
                LIS  $4                  ; 1413 74
                LR   (IS),A              ; 1414 5c
                PI   A153d               ; 1415 28 15 3d
                DS   $7                  ; 1418 37
                BF   $4,A141f            ; 1419 94 05
                LIS  $0                  ; 141b 70
                LR   (IS),A              ; 141c 5c
                BF   $0,A1444            ; 141d 90 26
A141f:          PI   A1b32               ; 141f 28 1b 32
                BF   $4,A1435            ; 1422 94 12
                LIS  $0                  ; 1424 70
                AS   $8                  ; 1425 c8
                BF   $4,A142c            ; 1426 94 05
                LIS  $0                  ; 1428 70
                LR   (IS),A              ; 1429 5c
                BF   $0,A1435            ; 142a 90 0a
A142c:          PI   A1ced               ; 142c 28 1c ed
                DCI  $0e19               ; 142f 2a 0e 19
                LR   A,$7                ; 1432 47
                ST                       ; 1433 17
                LR   A,QU                ; 1434 02
A1435:          BT   4,A1443             ; 1435 84 0d
                CI   $02                 ; 1437 25 02
                BT   4,A143c             ; 1439 84 02
                LIS  $1                  ; 143b 71
A143c:          INC                      ; 143c 1f
                LR   $1,A                ; 143d 51
                PI   A1971               ; 143e 28 19 71
                LIS  $4                  ; 1441 74
                LR   (IS),A              ; 1442 5c
A1443:          LISL 6                   ; 1443 6e
A1444:          LR   A,(IS)+             ; 1444 4d
                AS   (IS)                ; 1445 cc
                LR   $5,A                ; 1446 55
                LIS  $5                  ; 1447 75
                LR   IS,A                ; 1448 0b
                PI   A1969               ; 1449 28 19 69
                BF   $0,A145c            ; 144c 90 0f
                BF   $0,A145f            ; 144e 90 10
                BF   $0,A1470            ; 1450 90 1f
                BF   $0,A1473            ; 1452 90 20
                BF   $0,A147b            ; 1454 90 26
                BF   $0,A1473            ; 1456 90 1c
                BF   $0,A14c0            ; 1458 90 67
                BF   $0,A14c5            ; 145a 90 6a
A145c:          JMP  A152a               ; 145c 29 15 2a
A145f:          LISU 5                   ; 145f 65
                LISL 7                   ; 1460 6f
                LIS  $0                  ; 1461 70
                LR   (IS)-,A             ; 1462 5e
                LISU 6                   ; 1463 66
                LR   A,(IS)              ; 1464 4c
                NI   $fe                 ; 1465 21 fe
                LR   (IS),A              ; 1467 5c
                LIS  $9                  ; 1468 79
A1469:          LR   $1,A                ; 1469 51
                PI   A1971               ; 146a 28 19 71
                JMP  A152a               ; 146d 29 15 2a
A1470:          LIS  $1                  ; 1470 71
                BF   $0,A1469            ; 1471 90 f7
A1473:          LIS  $1                  ; 1473 71
                LR   $1,A                ; 1474 51
                PI   A1971               ; 1475 28 19 71
                JMP  A1505               ; 1478 29 15 05
A147b:          DCI  $0e1a               ; 147b 2a 0e 1a
                LISU 4                   ; 147e 64
                LISL 7                   ; 147f 6f
                LM                       ; 1480 16
                LR   (IS),A              ; 1481 5c
                PI   A1fcf               ; 1482 28 1f cf
                LR   DC,Q                ; 1485 0f
                LR   H,DC                ; 1486 11
                LIS  $0                  ; 1487 70
                LR   $2,A                ; 1488 52
                PI   $3b13               ; 1489 28 3b 13
                PI   $3b74               ; 148c 28 3b 74
                LR   A,$b                ; 148f 4b
                ST                       ; 1490 17
                LIS  $0                  ; 1491 70
                ST                       ; 1492 17
                DCI  $0fc6               ; 1493 2a 0f c6
                ST                       ; 1496 17
                DCI  $3505               ; 1497 2a 35 05
                XDC                      ; 149a 2c
                DCI  $0f1c               ; 149b 2a 0f 1c
                LISU 5                   ; 149e 65
                LISL 7                   ; 149f 6f
                LIS  $a                  ; 14a0 7a
                LR   (IS),A              ; 14a1 5c
                PI   $43cd               ; 14a2 28 43 cd
                LIS  $2                  ; 14a5 72
                LR   (IS)-,A             ; 14a6 5e
                LR   DC,H                ; 14a7 10
                CM                       ; 14a8 8d
                LM                       ; 14a9 16
                CI   $52                 ; 14aa 25 52
                BF   $4,A14be            ; 14ac 94 11
                LISU 6                   ; 14ae 66
                LIS  $1                  ; 14af 71
                XS   (IS)                ; 14b0 ec
                LR   (IS),A              ; 14b1 5c
                LR   DC,Q                ; 14b2 0f
                LIS  $0                  ; 14b3 70
                AM                       ; 14b4 88
                BT   1,A14be             ; 14b5 81 08
                LR   DC,Q                ; 14b7 0f
                LIS  $0                  ; 14b8 70
                ST                       ; 14b9 17
                ST                       ; 14ba 17
                ST                       ; 14bb 17
                ST                       ; 14bc 17
                ST                       ; 14bd 17
A14be:          BF   $0,A1505            ; 14be 90 46
A14c0:          PI   $364f               ; 14c0 28 36 4f
                BF   $0,A152a            ; 14c3 90 66
A14c5:          PI   $364f               ; 14c5 28 36 4f
                BF   $4,A1505            ; 14c8 94 3c
                LISU 6                   ; 14ca 66
                LISL 6                   ; 14cb 6e
                LIS  $1                  ; 14cc 71
                NS   (IS)                ; 14cd fc
                BF   $4,A1505            ; 14ce 94 36
                PI   $38c1               ; 14d0 28 38 c1
                BT   4,A1505             ; 14d3 84 31
                PI   $3b84               ; 14d5 28 3b 84
                PI   $3a0c               ; 14d8 28 3a 0c
                LR   DC,H                ; 14db 10
                LM                       ; 14dc 16
                SL   4                   ; 14dd 15
                BF   $1,A14e5            ; 14de 91 06
                SR   4                   ; 14e0 14
                LR   $6,A                ; 14e1 56
                JMP  $3b97               ; 14e2 29 3b 97
A14e5:          PI   $364f               ; 14e5 28 36 4f
                BF   $4,A14f4            ; 14e8 94 0b
                PI   $39ef               ; 14ea 28 39 ef
                LR   A,$8                ; 14ed 48
                LR   $3,A                ; 14ee 53
                LR   DC,Q                ; 14ef 0f
                LR   H,DC                ; 14f0 11
                PI   A1642               ; 14f1 28 16 42
A14f4:          PI   $399e               ; 14f4 28 39 9e
                BT   1,A14ff             ; 14f7 81 07
                LISU 5                   ; 14f9 65
                LISL 7                   ; 14fa 6f
                LIS  $0                  ; 14fb 70
                LR   (IS),A              ; 14fc 5c
                BF   $0,A152a            ; 14fd 90 2c
A14ff:          PI   A1533               ; 14ff 28 15 33
                PI   A1642               ; 1502 28 16 42
A1505:          PI   $39ef               ; 1505 28 39 ef
                LR   A,$8                ; 1508 48
                LR   $3,A                ; 1509 53
                LR   DC,Q                ; 150a 0f
                LR   H,DC                ; 150b 11
                LISU 6                   ; 150c 66
                LISL 6                   ; 150d 6e
                LIS  $1                  ; 150e 71
                NS   (IS)                ; 150f fc
                BT   4,A151c             ; 1510 84 0b
                DS   $3                  ; 1512 33
                DS   $3                  ; 1513 33
                LIS  $2                  ; 1514 72
                ADC                      ; 1515 8e
                LR   H,DC                ; 1516 11
                PI   A1642               ; 1517 28 16 42
                BF   $0,A152a            ; 151a 90 0f
A151c:          LR   A,$3                ; 151c 43
                AI   $ff                 ; 151d 24 ff
                ADC                      ; 151f 8e
                LIS  $6                  ; 1520 76
                CM                       ; 1521 8d
                BF   $4,A1525            ; 1522 94 02
                DS   $3                  ; 1524 33
A1525:          PI   A1649               ; 1525 28 16 49
                BF   $0,A1530            ; 1528 90 07
A152a:          PI   A1533               ; 152a 28 15 33
                PI   A1649               ; 152d 28 16 49
A1530:          JMP  A140e               ; 1530 29 14 0e
A1533:          LR   K,P                 ; 1533 08
                DCI  $0f7f               ; 1534 2a 0f 7f
                LR   H,DC                ; 1537 11
                LIS  $0                  ; 1538 70
                ST                       ; 1539 17
                INC                      ; 153a 1f
                LR   $3,A                ; 153b 53
                PK                       ; 153c 0c
A153d:          LR   K,P                 ; 153d 08
                PI   A1859               ; 153e 28 18 59
                LIS  $2                  ; 1541 72
                LR   $5,A                ; 1542 55
A1543:          DCI  $0865               ; 1543 2a 08 65
                LM                       ; 1546 16
                SL   4                   ; 1547 15
                LR   $3,A                ; 1548 53
                SR   4                   ; 1549 14
                COM                      ; 154a 18
                INC                      ; 154b 1f
                AS   $3                  ; 154c c3
                AM                       ; 154d 88
                LR   $3,A                ; 154e 53
                PI   A1851               ; 154f 28 18 51
                AS   $3                  ; 1552 c3
                LR   $3,A                ; 1553 53
                LISU 5                   ; 1554 65
                LISL 0                   ; 1555 68
A1556:          PI   A16ea               ; 1556 28 16 ea
                LIS  $8                  ; 1559 78
                LR   (IS),A              ; 155a 5c
A155b:          PI   A15a6               ; 155b 28 15 a6
                PI   A1679               ; 155e 28 16 79
                LIS  $8                  ; 1561 78
                XS   (IS)                ; 1562 ec
                BT   4,A155b             ; 1563 84 f7
                LIS  $0                  ; 1565 70
                XS   (IS)                ; 1566 ec
                BF   $4,A156d            ; 1567 94 05
                DS   $3                  ; 1569 33
                LR   $7,A                ; 156a 57
                BF   $0,A1599            ; 156b 90 2d
A156d:          LIS  $2                  ; 156d 72
                XS   (IS)                ; 156e ec
                BF   $4,A1576            ; 156f 94 06
                LR   $3,A                ; 1571 53
                COM                      ; 1572 18
                LR   $7,A                ; 1573 57
                BF   $0,A1581            ; 1574 90 0c
A1576:          LIS  $4                  ; 1576 74
                XS   (IS)                ; 1577 ec
                BF   $4,A157e            ; 1578 94 05
                COM                      ; 157a 18
                LR   $7,A                ; 157b 57
                BF   $0,A1581            ; 157c 90 04
A157e:          PI   $175d               ; 157e 28 17 5d
A1581:          DCI  $0f7f               ; 1581 2a 0f 7f
                LR   A,$3                ; 1584 43
                ADC                      ; 1585 8e
                LR   A,$7                ; 1586 47
                ST                       ; 1587 17
                LR   A,$3                ; 1588 43
                INC                      ; 1589 1f
                LR   $3,A                ; 158a 53
                CI   $2d                 ; 158b 25 2d
                BT   1,A1599             ; 158d 81 0b
                LI   $ff                 ; 158f 20 ff
                ST                       ; 1591 17
                LR   $7,A                ; 1592 57
                LR   A,$3                ; 1593 43
                INC                      ; 1594 1f
                LR   $3,A                ; 1595 53
                PI   A170d               ; 1596 28 17 0d
A1599:          LR   A,$7                ; 1599 47
                COM                      ; 159a 18
                BF   $4,A1556            ; 159b 94 ba
                LIS  $2                  ; 159d 72
                XS   (IS)                ; 159e ec
                BT   4,A1543             ; 159f 84 a3
                LR   A,$3                ; 15a1 43
                LR   $7,A                ; 15a2 57
                JMP  A187f               ; 15a3 29 18 7f
A15a6:          LR   K,P                 ; 15a6 08
                PI   A1859               ; 15a7 28 18 59
                PI   A1606               ; 15aa 28 16 06
A15ad:          LI   $80                 ; 15ad 20 80
                LR   $4,A                ; 15af 54
A15b0:          PI   A183c               ; 15b0 28 18 3c
                PI   $4361               ; 15b3 28 43 61
                LIS  $0                  ; 15b6 70
                AS   $8                  ; 15b7 c8
                BF   $4,A15b0            ; 15b8 94 f7
A15ba:          PI   A183c               ; 15ba 28 18 3c
                PI   $4361               ; 15bd 28 43 61
                LIS  $0                  ; 15c0 70
                AS   $8                  ; 15c1 c8
                BF   $1,A15ba            ; 15c2 91 f7
                BT   4,A15ba             ; 15c4 84 f5
                SL   1                   ; 15c6 13
                LR   $8,A                ; 15c7 58
                SR   1                   ; 15c8 12
                LISU 5                   ; 15c9 65
                LISL 0                   ; 15ca 68
                CI   $1e                 ; 15cb 25 1e
                BF   $4,A15dc            ; 15cd 94 0e
                DCI  $0fe2               ; 15cf 2a 0f e2
                LR   H,DC                ; 15d2 11
                LIS  $1                  ; 15d3 71
                XM                       ; 15d4 8c
                LR   DC,H                ; 15d5 10
                ST                       ; 15d6 17
                PI   A1606               ; 15d7 28 16 06
                BF   $0,A15ff            ; 15da 90 24
A15dc:          BT   2,A15f5             ; 15dc 82 18
                AI   $e1                 ; 15de 24 e1
                DCI  A15ef               ; 15e0 2a 15 ef
                ADC                      ; 15e3 8e
                LM                       ; 15e4 16
                LISU 5                   ; 15e5 65
                LISL 0                   ; 15e6 68
                LR   (IS),A              ; 15e7 5c
                LIS  $6                  ; 15e8 76
                XS   (IS)                ; 15e9 ec
                BF   $4,A15ed            ; 15ea 94 02
                LR   $8,A                ; 15ec 58
A15ed:          BF   $0,A15ff            ; 15ed 90 11
A15ef:          LR   A,QU                ; 15ef 02
                LR   QU,A                ; 15f0 06
                LR   K,P                 ; 15f1 08
                LR   KU,A                ; 15f2 04
                LR   K,P                 ; 15f3 08
                LR   A,KU                ; 15f4 00
A15f5:          LIS  $6                  ; 15f5 76
                LR   (IS),A              ; 15f6 5c
                DCI  $0fe2               ; 15f7 2a 0f e2
                LIS  $0                  ; 15fa 70
                XM                       ; 15fb 8c
                BF   $4,A15ff            ; 15fc 94 02
                DS   $8                  ; 15fe 38
A15ff:          LIS  $8                  ; 15ff 78
                XS   (IS)                ; 1600 ec
                BT   4,A15ad             ; 1601 84 ab
                JMP  A187f               ; 1603 29 18 7f
A1606:          LR   K,P                 ; 1606 08
                PI   A1859               ; 1607 28 18 59
                LIS  $4                  ; 160a 74
                LR   $4,A                ; 160b 54
                PI   A1848               ; 160c 28 18 48
                DCI  $0fe2               ; 160f 2a 0f e2
                LIS  $0                  ; 1612 70
                XM                       ; 1613 8c
                LI   $06                 ; 1614 20 06
                BT   4,A161a             ; 1616 84 03
                LI   $0c                 ; 1618 20 0c
A161a:          DCI  $0fb6               ; 161a 2a 0f b6
                ST                       ; 161d 17
                PI   A1851               ; 161e 28 18 51
                SL   4                   ; 1621 15
                SR   1                   ; 1622 12
                AI   $20                 ; 1623 24 20
                DCI  $0e18               ; 1625 2a 0e 18
                ST                       ; 1628 17
                LI   $80                 ; 1629 20 80
                LR   $4,A                ; 162b 54
                PI   A183c               ; 162c 28 18 3c
                PI   A1797               ; 162f 28 17 97
                LI   $ea                 ; 1632 20 ea
                LR   $3,A                ; 1634 53
                LIS  $0                  ; 1635 70
                LR   $4,A                ; 1636 54
                PI   A1819               ; 1637 28 18 19
                LIS  $4                  ; 163a 74
                LR   $4,A                ; 163b 54
                PI   A183c               ; 163c 28 18 3c
                JMP  A187f               ; 163f 29 18 7f
A1642:          LR   K,P                 ; 1642 08
A1643:          PI   A1859               ; 1643 28 18 59
                LIS  $0                  ; 1646 70
                BF   $0,A164e            ; 1647 90 06
A1649:          LR   K,P                 ; 1649 08
                PI   A1859               ; 164a 28 18 59
                LIS  $1                  ; 164d 71
A164e:          LR   $5,A                ; 164e 55
                LISU 5                   ; 164f 65
                LISL 0                   ; 1650 68
A1651:          DS   $3                  ; 1651 33
                BF   $1,A1670            ; 1652 91 1d
                LR   DC,H                ; 1654 10
                LM                       ; 1655 16
                LR   $4,A                ; 1656 54
                LR   H,DC                ; 1657 11
                LI   $ff                 ; 1658 20 ff
                XS   $4                  ; 165a e4
                BF   $4,A1663            ; 165b 94 07
                LI   $44                 ; 165d 20 44
                LR   $8,A                ; 165f 58
                LIS  $4                  ; 1660 74
                BF   $0,A1667            ; 1661 90 05
A1663:          PI   A1771               ; 1663 28 17 71
                LIS  $6                  ; 1666 76
A1667:          LR   (IS),A              ; 1667 5c
                PI   A16ea               ; 1668 28 16 ea
                PI   A1679               ; 166b 28 16 79
                BF   $0,A1651            ; 166e 90 e2
A1670:          DS   $5                  ; 1670 35
                BT   1,A1676             ; 1671 81 04
                PI   A170d               ; 1673 28 17 0d
A1676:          JMP  A187f               ; 1676 29 18 7f
A1679:          LR   K,P                 ; 1679 08
                PI   A1859               ; 167a 28 18 59
                LI   $80                 ; 167d 20 80
                LR   $4,A                ; 167f 54
                PI   A183c               ; 1680 28 18 3c
                LISU 5                   ; 1683 65
                LISL 0                   ; 1684 68
                PI   A1969               ; 1685 28 19 69
                BF   $0,A1690            ; 1688 90 07
                BF   $0,A16af            ; 168a 90 24
                BF   $0,A16b2            ; 168c 90 25
                BF   $0,A16b7            ; 168e 90 28
A1690:          PI   A1851               ; 1690 28 18 51
                DCI  $0865               ; 1693 2a 08 65
                CM                       ; 1696 8d
                BT   2,A16ab             ; 1697 82 13
                PI   $4122               ; 1699 28 41 22
                LIS  $0                  ; 169c 70
                LR   $8,A                ; 169d 58
                PI   $40d9               ; 169e 28 40 d9
                DCI  $0866               ; 16a1 2a 08 66
                LIS  $0                  ; 16a4 70
                ST                       ; 16a5 17
                LI   $48                 ; 16a6 20 48
                LR   $8,A                ; 16a8 58
                BF   $0,A16ad            ; 16a9 90 03
A16ab:          LIS  $8                  ; 16ab 78
                LR   (IS),A              ; 16ac 5c
A16ad:          BF   $0,A16bf            ; 16ad 90 11
A16af:          PI   A16c2               ; 16af 28 16 c2
A16b2:          PI   A170d               ; 16b2 28 17 0d
                BF   $0,A16bf            ; 16b5 90 09
A16b7:          PI   $40d9               ; 16b7 28 40 d9
                DCI  $0866               ; 16ba 2a 08 66
                LIS  $1                  ; 16bd 71
                ST                       ; 16be 17
A16bf:          JMP  A187f               ; 16bf 29 18 7f
A16c2:          LR   K,P                 ; 16c2 08
                PI   A1859               ; 16c3 28 18 59
                LI   $80                 ; 16c6 20 80
                LR   $4,A                ; 16c8 54
                PI   A183c               ; 16c9 28 18 3c
                LR   A,$8                ; 16cc 48
                LR   $3,A                ; 16cd 53
                LI   $1c                 ; 16ce 20 1c
                LR   $8,A                ; 16d0 58
                PI   $40d9               ; 16d1 28 40 d9
                XDC                      ; 16d4 2c
                LI   $90                 ; 16d5 20 90
                ADC                      ; 16d7 8e
                XDC                      ; 16d8 2c
                DCI  A1313               ; 16d9 2a 13 13
                PI   A16e1               ; 16dc 28 16 e1
                BF   $0,A16e5            ; 16df 90 05
A16e1:          LR   K,P                 ; 16e1 08
                JMP  $40f9               ; 16e2 29 40 f9
A16e5:          LR   A,$3                ; 16e5 43
                LR   $8,A                ; 16e6 58
                JMP  A187f               ; 16e7 29 18 7f
A16ea:          LR   K,P                 ; 16ea 08
                PI   A1859               ; 16eb 28 18 59
                DCI  $0866               ; 16ee 2a 08 66
                LIS  $1                  ; 16f1 71
                CM                       ; 16f2 8d
                BF   $4,A170a            ; 16f3 94 16
                PI   A1851               ; 16f5 28 18 51
                CI   $0f                 ; 16f8 25 0f
                BF   $4,A1707            ; 16fa 94 0c
                PI   A170d               ; 16fc 28 17 0d
                PI   A16c2               ; 16ff 28 16 c2
                DCI  $0865               ; 1702 2a 08 65
                LIS  $1                  ; 1705 71
                ST                       ; 1706 17
A1707:          PI   $412d               ; 1707 28 41 2d
A170a:          JMP  A187f               ; 170a 29 18 7f
A170d:          LR   K,P                 ; 170d 08
                PI   A1859               ; 170e 28 18 59
                PI   A177a               ; 1711 28 17 7a
                LIS  $c                  ; 1714 7c
                LR   $4,A                ; 1715 54
                PI   A183c               ; 1716 28 18 3c
                DCI  $0865               ; 1719 2a 08 65
                LIS  $0                  ; 171c 70
                ST                       ; 171d 17
                ST                       ; 171e 17
                JMP  A187f               ; 171f 29 18 7f
A1722:          LR   A,KU                ; 1722 00
                DS   $0                  ; 1723 30
                POP                      ; 1724 1c
                LR   K,P                 ; 1725 08
                LR   QU,A                ; 1726 06
                DS   $a                  ; 1727 3a
                DS   $5                  ; 1728 35
                db   $2e                 
                COM                      ; 172a 18
                LM                       ; 172b 16
                LR   DC,H                ; 172c 10
                DS   $7                  ; 172d 37
                LR   KU,A                ; 172e 04
                DI                       ; 172f 1a
                SR   1                   ; 1730 12
                SR   4                   ; 1731 14
                XDC                      ; 1732 2c
                LR   A,QU                ; 1733 02
                DS   $9                  ; 1734 39
                LR   A,KU                ; 1735 00
                DS   $6                  ; 1736 36
                AI   $34                 ; 1737 24 34
                DS   $2                  ; 1739 32
                OI   $20                 ; 173a 22 20
                LR   J,W                 ; 173c 1e
                LR   Q,DC                ; 173d 0e
                PK                       ; 173e 0c
                LR   A,IS                ; 173f 0a
                LR   H,DC                ; 1740 11
                db   $2d                 
                DS   $1                  ; 1742 31
                INC                      ; 1743 1f
                LR   IS,A                ; 1744 0b
                LR   W,J                 ; 1745 1d
                EI                       ; 1746 1b
                LNK                      ; 1747 19
                LR   A,KL                ; 1748 01
                ST                       ; 1749 17
                SL   4                   ; 174a 15
                OUT  $29                 ; 174b 27 29
                NOP                      ; 174d 2b
                SL   1                   ; 174e 13
                CI   $0f                 ; 174f 25 0f
                LR   P,K                 ; 1751 09
                NI   $07                 ; 1752 21 07
                LR   A,QL                ; 1754 03
                db   $2f                 
                LR   P0,Q                ; 1756 0d
                DS   $3                  ; 1757 33
                LR   KL,A                ; 1758 05
                XI   $38                 ; 1759 23 38
                PI   $2608               ; 175b 28 26 08
                DCI  A1722               ; 175e 2a 17 22
                LI   $3b                 ; 1761 20 3b
                LR   $7,A                ; 1763 57
                LR   A,$8                ; 1764 48
A1765:          DS   $7                  ; 1765 37
                BF   $1,A176b            ; 1766 91 04
                CM                       ; 1768 8d
                BF   $4,A1765            ; 1769 94 fb
A176b:          LR   A,$7                ; 176b 47
                COM                      ; 176c 18
                AI   $3b                 ; 176d 24 3b
                LR   $7,A                ; 176f 57
                PK                       ; 1770 0c
A1771:          LR   K,P                 ; 1771 08
                DCI  A1722               ; 1772 2a 17 22
                LR   A,$4                ; 1775 44
                ADC                      ; 1776 8e
                LM                       ; 1777 16
                LR   $8,A                ; 1778 58
                PK                       ; 1779 0c
A177a:          LR   K,P                 ; 177a 08
                PI   A1859               ; 177b 28 18 59
                LIS  $4                  ; 177e 74
                LR   $4,A                ; 177f 54
                PI   A1848               ; 1780 28 18 48
                LIS  $0                  ; 1783 70
                LR   $4,A                ; 1784 54
                COM                      ; 1785 18
                LR   $3,A                ; 1786 53
                DI                       ; 1787 1a
                LR   J,W                 ; 1788 1e
                PI   A1819               ; 1789 28 18 19
                LI   $fb                 ; 178c 20 fb
                LISU 6                   ; 178e 66
                LISL 7                   ; 178f 6f
                NS   (IS)                ; 1790 fc
                LR   (IS),A              ; 1791 5c
                EI                       ; 1792 1b
                LR   J,W                 ; 1793 1e
                JMP  A187f               ; 1794 29 18 7f
A1797:          LR   K,P                 ; 1797 08
                PI   A1859               ; 1798 28 18 59
                DI                       ; 179b 1a
                LR   J,W                 ; 179c 1e
                DCI  $0e0d               ; 179d 2a 0e 0d
                LM                       ; 17a0 16
                LR   $3,A                ; 17a1 53
                DCI  $0e18               ; 17a2 2a 0e 18
                LR   Q,DC                ; 17a5 0e
                DCI  $0860               ; 17a6 2a 08 60
                LR   A,$3                ; 17a9 43
                ADC                      ; 17aa 8e
                LM                       ; 17ab 16
                LISU 3                   ; 17ac 63
                LISL 0                   ; 17ad 68
                LR   (IS)+,A             ; 17ae 5d
                LIS  $0                  ; 17af 70
                LR   (IS),A              ; 17b0 5c
A17b1:          LR   A,(IS)              ; 17b1 4c
                SR   4                   ; 17b2 14
                SR   1                   ; 17b3 12
                SR   1                   ; 17b4 12
                AS   $3                  ; 17b5 c3
                LR   $5,A                ; 17b6 55
                DS   $5                  ; 17b7 35
                DCI  $0880               ; 17b8 2a 08 80
                LR   A,$5                ; 17bb 45
                ADC                      ; 17bc 8e
                LM                       ; 17bd 16
                SL   4                   ; 17be 15
                SR   4                   ; 17bf 14
                DCI  $0840               ; 17c0 2a 08 40
                ADC                      ; 17c3 8e
                LM                       ; 17c4 16
                COM                      ; 17c5 18
                INC                      ; 17c6 1f
                LR   DC,Q                ; 17c7 0f
                AM                       ; 17c8 88
                BT   4,A17e9             ; 17c9 84 1f
                XS   (IS)                ; 17cb ec
                BT   1,A17e9             ; 17cc 81 1c
                DCI  $0860               ; 17ce 2a 08 60
                PI   A180e               ; 17d1 28 18 0e
                DCI  $0880               ; 17d4 2a 08 80
                PI   A180e               ; 17d7 28 18 0e
                DCI  $0e08               ; 17da 2a 0e 08
                ADC                      ; 17dd 8e
                LR   A,$3                ; 17de 43
                LR   A,(IS)              ; 17df 4c
                OI   $01                 ; 17e0 22 01
                LR   (IS),A              ; 17e2 5c
                LR   A,$5                ; 17e3 45
                LR   $3,A                ; 17e4 53
                CI   $0e                 ; 17e5 25 0e
                BT   2,A17b1             ; 17e7 82 c9
A17e9:          LR   A,(IS)              ; 17e9 4c
                XI   $80                 ; 17ea 23 80
                LR   (IS),A              ; 17ec 5c
                BF   $1,A17f1            ; 17ed 91 03
                BT   4,A17b1             ; 17ef 84 c1
A17f1:          SL   1                   ; 17f1 13
                SR   1                   ; 17f2 12
                BT   4,A180b             ; 17f3 84 17
                DCI  $0860               ; 17f5 2a 08 60
                LR   A,$3                ; 17f8 43
                ADC                      ; 17f9 8e
                LISU 3                   ; 17fa 63
                LISL 0                   ; 17fb 68
                LR   A,(IS)              ; 17fc 4c
                ST                       ; 17fd 17
                DCI  $0880               ; 17fe 2a 08 80
                LR   A,$3                ; 1801 43
                ADC                      ; 1802 8e
                AI   $05                 ; 1803 24 05
                ST                       ; 1805 17
                DCI  $0e0d               ; 1806 2a 0e 0d
                LR   A,$3                ; 1809 43
                ST                       ; 180a 17
A180b:          JMP  A187f               ; 180b 29 18 7f
A180e:          LR   H,DC                ; 180e 11
                LR   A,$3                ; 180f 43
                ADC                      ; 1810 8e
                XDC                      ; 1811 2c
                LR   DC,H                ; 1812 10
                LR   A,$5                ; 1813 45
                ADC                      ; 1814 8e
                LM                       ; 1815 16
                XDC                      ; 1816 2c
                ST                       ; 1817 17
                POP                      ; 1818 1c
A1819:          DI                       ; 1819 1a
                DCI  $0e0d               ; 181a 2a 0e 0d
                LR   A,$4                ; 181d 44
                ADC                      ; 181e 8e
                LM                       ; 181f 16
                DCI  $0860               ; 1820 2a 08 60
                ADC                      ; 1823 8e
                LR   A,$3                ; 1824 43
                ST                       ; 1825 17
                LI   $1f                 ; 1826 20 1f
                ADC                      ; 1828 8e
                LR   A,$3                ; 1829 43
                INC                      ; 182a 1f
                LM                       ; 182b 16
                BF   $2,A1832            ; 182c 92 05
                OI   $80                 ; 182e 22 80
                BF   $0,A1834            ; 1830 90 03
A1832:          NI   $7f                 ; 1832 21 7f
A1834:          LR   $0,A                ; 1834 50
                LIS  $0                  ; 1835 70
                COM                      ; 1836 18
                ADC                      ; 1837 8e
                LR   A,$0                ; 1838 40
                ST                       ; 1839 17
                LR   W,J                 ; 183a 1d
                POP                      ; 183b 1c
A183c:          LR   K,P                 ; 183c 08
                LR   A,$4                ; 183d 44
                COM                      ; 183e 18
                DI                       ; 183f 1a
                LISU 6                   ; 1840 66
                LISL 7                   ; 1841 6f
                NS   (IS)                ; 1842 fc
                LR   (IS),A              ; 1843 5c
                EI                       ; 1844 1b
                LR   J,W                 ; 1845 1e
                BF   $0,A1849            ; 1846 90 02
A1848:          LR   K,P                 ; 1848 08
A1849:          LISU 6                   ; 1849 66
                LISL 7                   ; 184a 6f
A184b:          LR   A,(IS)              ; 184b 4c
                NS   $4                  ; 184c f4
                XS   $4                  ; 184d e4
                BF   $4,A184b            ; 184e 94 fc
                PK                       ; 1850 0c
A1851:          LR   K,P                 ; 1851 08
                DCI  $0fdf               ; 1852 2a 0f df
                LM                       ; 1855 16
                SL   4                   ; 1856 15
                SR   4                   ; 1857 14
                PK                       ; 1858 0c
A1859:          DI                       ; 1859 1a
                LR   A,KU                ; 185a 00
                LR   QU,A                ; 185b 06
                LR   A,KL                ; 185c 01
                LR   QL,A                ; 185d 07
                LR   K,P                 ; 185e 08
                LR   W,J                 ; 185f 1d
                LR   A,IS                ; 1860 0a
                LR   $1,A                ; 1861 51
                LISU 5                   ; 1862 65
                LISL 4                   ; 1863 6c
                PI   A1938               ; 1864 28 19 38
                LIS  $a                  ; 1867 7a
                AS   (IS)                ; 1868 cc
                LR   (IS),A              ; 1869 5c
                PI   A1926               ; 186a 28 19 26
                CM                       ; 186d 8d
                LR   A,QU                ; 186e 02
                ST                       ; 186f 17
                LR   A,QL                ; 1870 03
                ST                       ; 1871 17
                LR   A,$a                ; 1872 4a
                ST                       ; 1873 17
                LR   A,$b                ; 1874 4b
                ST                       ; 1875 17
                LR   A,$1                ; 1876 41
                LR   IS,A                ; 1877 0b
                PI   A194c               ; 1878 28 19 4c
                LI   $28                 ; 187b 20 28
                ST                       ; 187d 17
                PK                       ; 187e 0c
A187f:          LISU 5                   ; 187f 65
                LISL 4                   ; 1880 6c
                PI   A1938               ; 1881 28 19 38
                LI   $28                 ; 1884 20 28
                CM                       ; 1886 8d
                BT   4,A188c             ; 1887 84 04
                PI   A139e               ; 1889 28 13 9e
A188c:          LI   $f6                 ; 188c 20 f6
                ADC                      ; 188e 8e
                AS   (IS)                ; 188f cc
                LR   (IS),A              ; 1890 5c
                LM                       ; 1891 16
                LR   KU,A                ; 1892 04
                LM                       ; 1893 16
                LR   KL,A                ; 1894 05
                LM                       ; 1895 16
                LR   $a,A                ; 1896 5a
                LM                       ; 1897 16
                LR   $b,A                ; 1898 5b
                PI   A195e               ; 1899 28 19 5e
                LR   A,QU                ; 189c 02
                AI   $00                 ; 189d 24 00
                PK                       ; 189f 0c
                LR   K,P                 ; 18a0 08
                LISU 5                   ; 18a1 65
                LISL 5                   ; 18a2 6d
                LR   A,(IS)              ; 18a3 4c
                AI   $fa                 ; 18a4 24 fa
                LR   (IS),A              ; 18a6 5c
                PI   A1926               ; 18a7 28 19 26
                LR   DC,H                ; 18aa 10
                LI   $fa                 ; 18ab 20 fa
                ADC                      ; 18ad 8e
                LR   H,DC                ; 18ae 11
                LI   $44                 ; 18af 20 44
                ST                       ; 18b1 17
                PK                       ; 18b2 0c
                LR   K,P                 ; 18b3 08
                LR   DC,H                ; 18b4 10
                LI   $44                 ; 18b5 20 44
                CM                       ; 18b7 8d
                BF   $4,A18c5            ; 18b8 94 0c
                LISU 5                   ; 18ba 65
                LISL 5                   ; 18bb 6d
                LR   DC,H                ; 18bc 10
                LIS  $6                  ; 18bd 76
                ADC                      ; 18be 8e
                LR   H,DC                ; 18bf 11
                AS   (IS)                ; 18c0 cc
                LR   (IS),A              ; 18c1 5c
                LI   $44                 ; 18c2 20 44
                CM                       ; 18c4 8d
A18c5:          PK                       ; 18c5 0c
A18c6:          LR   K,P                 ; 18c6 08
                PI   A1948               ; 18c7 28 19 48
                LIS  $0                  ; 18ca 70
                BF   $0,A18db            ; 18cb 90 0f
A18cd:          LR   K,P                 ; 18cd 08
                PI   A1948               ; 18ce 28 19 48
                LI   $80                 ; 18d1 20 80
                BF   $0,A18db            ; 18d3 90 07
A18d5:          LR   K,P                 ; 18d5 08
                PI   A1948               ; 18d6 28 19 48
                LI   $c0                 ; 18d9 20 c0
A18db:          LR   $5,A                ; 18db 55
                LISU 5                   ; 18dc 65
                LISL 4                   ; 18dd 6c
                LIS  $f                  ; 18de 7f
                NS   $1                  ; 18df f1
                AI   $02                 ; 18e0 24 02
                LR   $4,A                ; 18e2 54
                COM                      ; 18e3 18
                INC                      ; 18e4 1f
                LR   $6,A                ; 18e5 56
                LR   A,$1                ; 18e6 41
                XS   $5                  ; 18e7 e5
                BT   1,A18ec             ; 18e8 81 03
                LR   A,$6                ; 18ea 46
                LR   $4,A                ; 18eb 54
A18ec:          LIS  $0                  ; 18ec 70
                XS   $5                  ; 18ed e5
                BF   $1,A18fd            ; 18ee 91 0e
                LR   A,$4                ; 18f0 44
                AS   (IS)                ; 18f1 cc
                LR   (IS),A              ; 18f2 5c
                PI   A1926               ; 18f3 28 19 26
                PI   A1938               ; 18f6 28 19 38
                LR   A,$1                ; 18f9 41
                ST                       ; 18fa 17
                BF   $0,A191a            ; 18fb 90 1e
A18fd:          LR   A,$5                ; 18fd 45
                SL   1                   ; 18fe 13
                BF   $1,A190d            ; 18ff 91 0d
                PI   A1938               ; 1901 28 19 38
                LR   A,$1                ; 1904 41
                CM                       ; 1905 8d
                BT   4,A190a             ; 1906 84 03
                BF   $0,A1914            ; 1908 90 0b
A190a:          LR   A,$4                ; 190a 44
                AS   (IS)                ; 190b cc
                LR   (IS),A              ; 190c 5c
A190d:          PI   A1938               ; 190d 28 19 38
                LR   A,$1                ; 1910 41
                CM                       ; 1911 8d
                BT   4,A191a             ; 1912 84 07
A1914:          LI   $fb                 ; 1914 20 fb
                NS   $9                  ; 1916 f9
                LR   $9,A                ; 1917 59
                BF   $0,A1920            ; 1918 90 07
A191a:          LR   A,$6                ; 191a 46
                ADC                      ; 191b 8e
                LR   A,$9                ; 191c 49
                OI   $04                 ; 191d 22 04
                LR   $9,A                ; 191f 59
A1920:          XDC                      ; 1920 2c
                PI   A195a               ; 1921 28 19 5a
                XDC                      ; 1924 2c
                PK                       ; 1925 0c
A1926:          DI                       ; 1926 1a
                LR   A,IS                ; 1927 0a
                LR   $0,A                ; 1928 50
                LISU 5                   ; 1929 65
                LISL 5                   ; 192a 6d
                LR   A,(IS)-             ; 192b 4e
                COM                      ; 192c 18
                INC                      ; 192d 1f
                AS   (IS)                ; 192e cc
                BF   $2,A1934            ; 192f 92 04
                PI   A139e               ; 1931 28 13 9e
A1934:          LR   A,$0                ; 1934 40
                LR   IS,A                ; 1935 0b
                LR   W,J                 ; 1936 1d
                POP                      ; 1937 1c
A1938:          DI                       ; 1938 1a
                DCI  $0f2b               ; 1939 2a 0f 2b
                LR   A,(IS)              ; 193c 4c
                LR   $0,A                ; 193d 50
                DI                       ; 193e 1a
                LR   A,$0                ; 193f 40
                SR   1                   ; 1940 12
                ADC                      ; 1941 8e
                ADC                      ; 1942 8e
                LIS  $1                  ; 1943 71
                NS   $0                  ; 1944 f0
                ADC                      ; 1945 8e
                LR   W,J                 ; 1946 1d
                POP                      ; 1947 1c
A1948:          DI                       ; 1948 1a
                DCI  $0f26               ; 1949 2a 0f 26
A194c:          DI                       ; 194c 1a
                LR   A,IS                ; 194d 0a
                LR   $0,A                ; 194e 50
                LISU 0                   ; 194f 60
                LISL 3                   ; 1950 6b
A1951:          LR   A,(IS)+             ; 1951 4d
                ST                       ; 1952 17
                BR7  A1951               ; 1953 8f fd
                LR   A,$0                ; 1955 40
                ST                       ; 1956 17
                LR   IS,A                ; 1957 0b
                LR   W,J                 ; 1958 1d
                POP                      ; 1959 1c
A195a:          DI                       ; 195a 1a
                DCI  $0f26               ; 195b 2a 0f 26
A195e:          DI                       ; 195e 1a
                LISU 0                   ; 195f 60
                LISL 3                   ; 1960 6b
A1961:          LM                       ; 1961 16
                LR   (IS)+,A             ; 1962 5d
                BR7  A1961               ; 1963 8f fd
                LM                       ; 1965 16
                LR   IS,A                ; 1966 0b
                LR   W,J                 ; 1967 1d
                POP                      ; 1968 1c
A1969:          LR   K,P                 ; 1969 08
                LR   A,KL                ; 196a 01
                AS   (IS)                ; 196b cc
                LR   KL,A                ; 196c 05
                LR   A,KU                ; 196d 00
                LNK                      ; 196e 19
                LR   KU,A                ; 196f 04
                PK                       ; 1970 0c
A1971:          LR   K,P                 ; 1971 08
                LR   A,$1                ; 1972 41
                DCI  A1998               ; 1973 2a 19 98
                XDC                      ; 1976 2c
                DCI  A198a               ; 1977 2a 19 8a
A197a:          DS   $1                  ; 197a 31
                BT   4,A1983             ; 197b 84 07
                LM                       ; 197d 16
                XDC                      ; 197e 2c
                ADC                      ; 197f 8e
                XDC                      ; 1980 2c
                BF   $0,A197a            ; 1981 90 f8
A1983:          LM                       ; 1983 16
                LR   $3,A                ; 1984 53
                XDC                      ; 1985 2c
                LR   H,DC                ; 1986 11
                JMP  A1643               ; 1987 29 16 43
A198a:          PK                       ; 198a 0c
                PK                       ; 198b 0c
                LR   Q,DC                ; 198c 0e
                LR   IS,A                ; 198d 0b
                LR   P,K                 ; 198e 09
                LR   K,P                 ; 198f 08
                LR   P,K                 ; 1990 09
                LR   A,IS                ; 1991 0a
                LR   KL,A                ; 1992 05
                LR   A,IS                ; 1993 0a
                LR   Q,DC                ; 1994 0e
                LR   Q,DC                ; 1995 0e
                LR   P,K                 ; 1996 09
                LR   QL,A                ; 1997 07
A1998:          DS   $0                  ; 1998 30
                DS   $1                  ; 1999 31
                DCI  $3100               ; 199a 2a 31 00
                IN   $24                 ; 199d 26 24
                NOP                      ; 199f 2b
                XDC                      ; 19a0 2c
                db   $2f                 
                OI   $21                 ; 19a2 22 21
                DS   $0                  ; 19a4 30
                DS   $6                  ; 19a5 36
                NOP                      ; 19a6 2b
                DS   $1                  ; 19a7 31
                LR   J,W                 ; 19a8 1e
                DS   $5                  ; 19a9 35
                LR   A,KU                ; 19aa 00
                OI   $2f                 ; 19ab 22 2f
                db   $2f                 
                XDC                      ; 19ae 2c
                db   $2f                 
                LI   $1e                 ; 19b0 20 1e
                db   $2d                 
                LR   J,W                 ; 19b3 1e
                LI   $26                 ; 19b4 20 26
                DS   $1                  ; 19b6 31
                DS   $6                  ; 19b7 36
                LR   A,KU                ; 19b8 00
                OI   $2f                 ; 19b9 22 2f
                db   $2f                 
                XDC                      ; 19bc 2c
                db   $2f                 
                DS   $3                  ; 19be 33
                LR   J,W                 ; 19bf 1e
                JMP  $3222               ; 19c0 29 32 22
                LR   A,KU                ; 19c3 00
                OI   $2f                 ; 19c4 22 2f
                db   $2f                 
                XDC                      ; 19c7 2c
                db   $2f                 
                IN   $00                 ; 19c9 26 00
                DS   $2                  ; 19cb 32
                NOP                      ; 19cc 2b
                NI   $22                 ; 19cd 21 22
                db   $2f                 
                LR   A,KU                ; 19d0 00
                SR   4                   ; 19d1 14
                IN   $00                 ; 19d2 26 00
                XDC                      ; 19d4 2c
                DS   $3                  ; 19d5 33
                OI   $2f                 ; 19d6 22 2f
                LR   A,KU                ; 19d8 00
                LNK                      ; 19d9 19
                NOP                      ; 19da 2b
                LR   A,KU                ; 19db 00
                DS   $2                  ; 19dc 32
                NOP                      ; 19dd 2b
                NI   $22                 ; 19de 21 22
                db   $2f                 
                LR   A,KU                ; 19e1 00
                SR   4                   ; 19e2 14
                NOP                      ; 19e3 2b
                LR   A,KU                ; 19e4 00
                XDC                      ; 19e5 2c
                DS   $3                  ; 19e6 33
                OI   $2f                 ; 19e7 22 2f
                LR   A,KU                ; 19e9 00
                LNK                      ; 19ea 19
                SL   4                   ; 19eb 15
                LM                       ; 19ec 16
                OI   $2b                 ; 19ed 22 2b
                NI   $22                 ; 19ef 21 22
                NI   $2f                 ; 19f1 21 2f
                OI   $30                 ; 19f3 22 30
                DS   $1                  ; 19f5 31
                LR   J,W                 ; 19f6 1e
                db   $2f                 
                DS   $1                  ; 19f8 31
                IN   $2b                 ; 19f9 26 2b
                AI   $2b                 ; 19fb 24 2b
                LR   A,KU                ; 19fd 00
                DCI  $3230               ; 19fe 2a 32 30
                DS   $1                  ; 1a01 31
                LR   A,KU                ; 1a02 00
                INC                      ; 1a03 1f
                OI   $00                 ; 1a04 22 00
                SR   4                   ; 1a06 14
                LR   A,QU                ; 1a07 02
                SL   4                   ; 1a08 15
                LNK                      ; 1a09 19
                DCI  $2630               ; 1a0a 2a 26 30
                DS   $0                  ; 1a0d 30
                IN   $2b                 ; 1a0e 26 2b
                AI   $00                 ; 1a10 24 00
                DS   $3                  ; 1a12 33
                LR   J,W                 ; 1a13 1e
                JMP  $3222               ; 1a14 29 32 22
                DS   $0                  ; 1a17 30
                DS   $4                  ; 1a18 34
                LR   J,W                 ; 1a19 1e
                DS   $0                  ; 1a1a 30
                LR   A,KU                ; 1a1b 00
                INC                      ; 1a1c 1f
                OI   $24                 ; 1a1d 22 24
                IN   $2b                 ; 1a1f 26 2b
                DS   $4                  ; 1a21 34
                LR   J,W                 ; 1a22 1e
                DS   $0                  ; 1a23 30
                LR   A,KU                ; 1a24 00
                OI   $2b                 ; 1a25 22 2b
                NI   $08                 ; 1a27 21 08
                LISU 6                   ; 1a29 66
                LISL 6                   ; 1a2a 6e
                LR   A,(IS)              ; 1a2b 4c
                NI   $02                 ; 1a2c 21 02
                BF   $4,A1a31            ; 1a2e 94 02
                PK                       ; 1a30 0c
A1a31:          PI   A1859               ; 1a31 28 18 59
                LR   A,(IS)              ; 1a34 4c
                NI   $fd                 ; 1a35 21 fd
                LR   (IS),A              ; 1a37 5c
                LI   $14                 ; 1a38 20 14
                LR   $6,A                ; 1a3a 56
                LIS  $0                  ; 1a3b 70
                LR   $7,A                ; 1a3c 57
                DCI  $0e5f               ; 1a3d 2a 0e 5f
A1a40:          LR   H,DC                ; 1a40 11
                LIS  $0                  ; 1a41 70
                XM                       ; 1a42 8c
                BT   1,A1a75             ; 1a43 81 31
                LIS  $3                  ; 1a45 73
                ADC                      ; 1a46 8e
                LR   Q,DC                ; 1a47 0e
                PI   $34d0               ; 1a48 28 34 d0
                LR   A,$3                ; 1a4b 43
                SL   1                   ; 1a4c 13
                BT   4,A1a75             ; 1a4d 84 27
                LIS  $0                  ; 1a4f 70
A1a50:          XS   $7                  ; 1a50 e7
                BT   4,A1a5e             ; 1a51 84 0c
                PI   $3249               ; 1a53 28 32 49
                PI   $3258               ; 1a56 28 32 58
                PI   $328e               ; 1a59 28 32 8e
                BT   1,A1a75             ; 1a5c 81 18
A1a5e:          LIS  $1                  ; 1a5e 71
                LR   $7,A                ; 1a5f 57
                LR   DC,Q                ; 1a60 0f
                PI   $34d0               ; 1a61 28 34 d0
                PI   $3249               ; 1a64 28 32 49
                PI   $34e5               ; 1a67 28 34 e5
                LR   DC,H                ; 1a6a 10
                LIS  $2                  ; 1a6b 72
                ADC                      ; 1a6c 8e
                LM                       ; 1a6d 16
                AI   $ec                 ; 1a6e 24 ec
                LISU 7                   ; 1a70 67
                LISL 6                   ; 1a71 6e
                LR   (IS),A              ; 1a72 5c
                LR   DC,H                ; 1a73 10
                XDC                      ; 1a74 2c
A1a75:          LR   DC,H                ; 1a75 10
                LIS  $9                  ; 1a76 79
                ADC                      ; 1a77 8e
                DS   $6                  ; 1a78 36
                BT   1,A1a40             ; 1a79 81 c6
                LIS  $0                  ; 1a7b 70
                XS   $7                  ; 1a7c e7
                BT   4,A1abc             ; 1a7d 84 3e
                XDC                      ; 1a7f 2c
                LR   H,DC                ; 1a80 11
                XDC                      ; 1a81 2c
                PI   A1abf               ; 1a82 28 1a bf
                LISU 6                   ; 1a85 66
                LISL 6                   ; 1a86 6e
                LIS  $2                  ; 1a87 72
                NS   (IS)                ; 1a88 fc
                BT   4,A1abc             ; 1a89 84 32
                COM                      ; 1a8b 18
                NS   (IS)                ; 1a8c fc
                LR   (IS),A              ; 1a8d 5c
                LR   DC,H                ; 1a8e 10
                LIS  $4                  ; 1a8f 74
                ADC                      ; 1a90 8e
                PI   $34d6               ; 1a91 28 34 d6
                DCI  $351b               ; 1a94 2a 35 1b
                PI   $34d0               ; 1a97 28 34 d0
                PI   $3354               ; 1a9a 28 33 54
                PI   $3249               ; 1a9d 28 32 49
                DCI  $0860               ; 1aa0 2a 08 60
                PI   $34b8               ; 1aa3 28 34 b8
                LI   $14                 ; 1aa6 20 14
                LR   $6,A                ; 1aa8 56
                DCI  $0e5f               ; 1aa9 2a 0e 5f
A1aac:          LR   H,DC                ; 1aac 11
                LIS  $0                  ; 1aad 70
                XM                       ; 1aae 8c
                BT   1,A1ab6             ; 1aaf 81 06
                LR   DC,H                ; 1ab1 10
                XDC                      ; 1ab2 2c
                PI   A1abf               ; 1ab3 28 1a bf
A1ab6:          LR   DC,H                ; 1ab6 10
                LIS  $9                  ; 1ab7 79
                ADC                      ; 1ab8 8e
                DS   $6                  ; 1ab9 36
                BT   1,A1aac             ; 1aba 81 f1
A1abc:          JMP  A187f               ; 1abc 29 18 7f
A1abf:          LR   K,P                 ; 1abf 08
                PI   A1859               ; 1ac0 28 18 59
                XDC                      ; 1ac3 2c
                LR   H,DC                ; 1ac4 11
                LIS  $2                  ; 1ac5 72
                ADC                      ; 1ac6 8e
                LM                       ; 1ac7 16
                AI   $ec                 ; 1ac8 24 ec
                LR   $6,A                ; 1aca 56
                CM                       ; 1acb 8d
                PI   $34d0               ; 1acc 28 34 d0
                LI   $80                 ; 1acf 20 80
                XS   $3                  ; 1ad1 e3
                BF   $4,A1ae3            ; 1ad2 94 10
                COM                      ; 1ad4 18
                LR   $3,A                ; 1ad5 53
                LR   A,$6                ; 1ad6 46
                LISU 7                   ; 1ad7 67
                LISL 6                   ; 1ad8 6e
                XS   (IS)                ; 1ad9 ec
                BF   $4,A1ae1            ; 1ada 94 06
                LISU 6                   ; 1adc 66
                LR   A,(IS)              ; 1add 4c
                OI   $02                 ; 1ade 22 02
                LR   (IS),A              ; 1ae0 5c
A1ae1:          BF   $0,A1b29            ; 1ae1 90 47
A1ae3:          DCI  $0860               ; 1ae3 2a 08 60
                PI   $34d6               ; 1ae6 28 34 d6
                PI   $3249               ; 1ae9 28 32 49
                PI   $3302               ; 1aec 28 33 02
                PI   $3213               ; 1aef 28 32 13
                LR   A,(IS)              ; 1af2 4c
                INC                      ; 1af3 1f
                LR   $5,A                ; 1af4 55
                CI   $3e                 ; 1af5 25 3e
                LISL 6                   ; 1af7 6e
                BF   $2,A1b05            ; 1af8 92 0c
                CI   $31                 ; 1afa 25 31
                BF   $2,A1b0d            ; 1afc 92 10
                LISU 7                   ; 1afe 67
                LR   A,(IS)              ; 1aff 4c
                XS   $6                  ; 1b00 e6
                BF   $4,A1b0d            ; 1b01 94 0b
                BF   $0,A1b08            ; 1b03 90 04
A1b05:          LI   $38                 ; 1b05 20 38
                LR   $5,A                ; 1b07 55
A1b08:          LISU 6                   ; 1b08 66
                LR   A,(IS)              ; 1b09 4c
                OI   $02                 ; 1b0a 22 02
                LR   (IS),A              ; 1b0c 5c
A1b0d:          LI   $74                 ; 1b0d 20 74
                LR   $3,A                ; 1b0f 53
                LR   DC,H                ; 1b10 10
                LIS  $5                  ; 1b11 75
                ADC                      ; 1b12 8e
                LIS  $0                  ; 1b13 70
                AM                       ; 1b14 88
                BF   $1,A1b1b            ; 1b15 91 05
                LR   A,$5                ; 1b17 45
                COM                      ; 1b18 18
                AS   $3                  ; 1b19 c3
                LR   $3,A                ; 1b1a 53
A1b1b:          DCI  $0e04               ; 1b1b 2a 0e 04
                LR   A,$6                ; 1b1e 46
                ADC                      ; 1b1f 8e
                LR   A,$5                ; 1b20 45
                DI                       ; 1b21 1a
                ST                       ; 1b22 17
                LISU 6                   ; 1b23 66
                LISL 7                   ; 1b24 6f
                LI   $ef                 ; 1b25 20 ef
                NS   (IS)                ; 1b27 fc
                LR   (IS),A              ; 1b28 5c
A1b29:          LIS  $2                  ; 1b29 72
                AS   $6                  ; 1b2a c6
                LR   $4,A                ; 1b2b 54
                PI   A1819               ; 1b2c 28 18 19
                JMP  A187f               ; 1b2f 29 18 7f
A1b32:          LR   K,P                 ; 1b32 08
                PI   A1859               ; 1b33 28 18 59
                LI   $ff                 ; 1b36 20 ff
                LR   $7,A                ; 1b38 57
                LR   $8,A                ; 1b39 58
                LI   $1b                 ; 1b3a 20 1b
                DCI  $0c02               ; 1b3c 2a 0c 02
                ST                       ; 1b3f 17
                LI   $53                 ; 1b40 20 53
                ST                       ; 1b42 17
                LISU 6                   ; 1b43 66
                LISL 6                   ; 1b44 6e
                LIS  $1                  ; 1b45 71
                NS   (IS)                ; 1b46 fc
                LIS  $1                  ; 1b47 71
                BT   4,A1b4c             ; 1b48 84 03
                LI   $11                 ; 1b4a 20 11
A1b4c:          LR   $4,A                ; 1b4c 54
                LI   $f6                 ; 1b4d 20 f6
                LR   $5,A                ; 1b4f 55
                JMP  A1db0               ; 1b50 29 1d b0
                LIS  $9                  ; 1b53 79
                XS   $5                  ; 1b54 e5
                BT   4,A1b5a             ; 1b55 84 04
                LR   A,$7                ; 1b57 47
                INC                      ; 1b58 1f
                LR   $7,A                ; 1b59 57
A1b5a:          DCI  $0f7f               ; 1b5a 2a 0f 7f
                LR   A,$7                ; 1b5d 47
                ADC                      ; 1b5e 8e
                LM                       ; 1b5f 16
                LR   $6,A                ; 1b60 56
                CI   $00                 ; 1b61 25 00
                BF   $4,A1b69            ; 1b63 94 05
                LIS  $a                  ; 1b65 7a
                LR   $5,A                ; 1b66 55
                BF   $0,A1b7f            ; 1b67 90 17
A1b69:          CI   $0e                 ; 1b69 25 0e
                BF   $4,A1b71            ; 1b6b 94 05
                LIS  $b                  ; 1b6d 7b
                LR   $5,A                ; 1b6e 55
                BF   $0,A1b7f            ; 1b6f 90 0f
A1b71:          LIS  $1                  ; 1b71 71
                LR   $5,A                ; 1b72 55
                DCI  A1b8c               ; 1b73 2a 1b 8c
A1b76:          LR   A,$6                ; 1b76 46
                CM                       ; 1b77 8d
                BT   2,A1b7f             ; 1b78 82 06
                LR   A,$5                ; 1b7a 45
                INC                      ; 1b7b 1f
                LR   $5,A                ; 1b7c 55
                BF   $0,A1b76            ; 1b7d 90 f8
A1b7f:          LR   A,$6                ; 1b7f 46
                CI   $05                 ; 1b80 25 05
                BT   4,A1b88             ; 1b82 84 05
                CI   $39                 ; 1b84 25 39
                BF   $4,A1b8b            ; 1b86 94 04
A1b88:          PI   A1e99               ; 1b88 28 1e 99
A1b8b:          PK                       ; 1b8b 0c
A1b8c:          LR   A,IS                ; 1b8c 0a
                LR   DC,H                ; 1b8d 10
                LR   H,DC                ; 1b8e 11
                SR   1                   ; 1b8f 12
                SL   1                   ; 1b90 13
                LR   W,J                 ; 1b91 1d
                DS   $a                  ; 1b92 3a
                NS   (IS)-               ; 1b93 fe
                db   $ff                 
A1b95:          LR   K,P                 ; 1b95 08
                LR   A,$8                ; 1b96 48
                CI   $42                 ; 1b97 25 42
                BT   1,A1ba0             ; 1b99 81 06
                PI   A1ea5               ; 1b9b 28 1e a5
                BF   $0,A1ba9            ; 1b9e 90 0a
A1ba0:          LR   A,$8                ; 1ba0 48
                INC                      ; 1ba1 1f
                LR   $8,A                ; 1ba2 58
                DCI  $0e1a               ; 1ba3 2a 0e 1a
                ADC                      ; 1ba6 8e
                LR   A,$1                ; 1ba7 41
                ST                       ; 1ba8 17
A1ba9:          PK                       ; 1ba9 0c
                LIS  $9                  ; 1baa 79
                LISU 4                   ; 1bab 64
                LISL 6                   ; 1bac 6e
                LR   (IS)+,A             ; 1bad 5d
                LIS  $0                  ; 1bae 70
                LR   (IS),A              ; 1baf 5c
                LISU 3                   ; 1bb0 63
                LISL 4                   ; 1bb1 6c
A1bb2:          LR   (IS)-,A             ; 1bb2 5e
                BR7  A1bb2               ; 1bb3 8f fe
                LISU 4                   ; 1bb5 64
                LISL 5                   ; 1bb6 6d
                LIS  $b                  ; 1bb7 7b
                XS   $5                  ; 1bb8 e5
                BF   $4,A1bc0            ; 1bb9 94 06
                LIS  $1                  ; 1bbb 71
                LR   (IS),A              ; 1bbc 5c
                JMP  A1e1b               ; 1bbd 29 1e 1b
A1bc0:          LIS  $0                  ; 1bc0 70
                LR   (IS),A              ; 1bc1 5c
A1bc2:          PI   A1948               ; 1bc2 28 19 48
                LISU 3                   ; 1bc5 63
                LISL 4                   ; 1bc6 6c
                LR   A,(IS)              ; 1bc7 4c
                LR   $3,A                ; 1bc8 53
                LR   A,$8                ; 1bc9 48
                LR   QL,A                ; 1bca 07
                DCI  $3520               ; 1bcb 2a 35 20
                PI   $34d6               ; 1bce 28 34 d6
                PI   $3302               ; 1bd1 28 33 02
                BF   $8,A1bd8            ; 1bd4 98 03
                BF   $0,A1bec            ; 1bd6 90 15
A1bd8:          PI   $34e5               ; 1bd8 28 34 e5
                PI   $34c7               ; 1bdb 28 34 c7
                LISL 0                   ; 1bde 68
                LR   A,$6                ; 1bdf 46
                AI   $ec                 ; 1be0 24 ec
                LR   (IS),A              ; 1be2 5c
                LI   $47                 ; 1be3 20 47
                LR   $3,A                ; 1be5 53
                PI   $33ef               ; 1be6 28 33 ef
                PI   $328e               ; 1be9 28 32 8e
A1bec:          BF   $8,A1bf3            ; 1bec 98 06
                PI   A1ea5               ; 1bee 28 1e a5
                BF   $0,A1bf8            ; 1bf1 90 06
A1bf3:          BT   4,A1bf8             ; 1bf3 84 04
                LISU 4                   ; 1bf5 64
                LISL 6                   ; 1bf6 6e
                DS   (IS)                ; 1bf7 3c
A1bf8:          LR   A,$3                ; 1bf8 43
                LISU 3                   ; 1bf9 63
                LISL 4                   ; 1bfa 6c
                LR   (IS),A              ; 1bfb 5c
A1bfc:          PI   A195a               ; 1bfc 28 19 5a
                LR   A,QL                ; 1bff 03
                LR   $8,A                ; 1c00 58
                JMP  A1e1b               ; 1c01 29 1e 1b
                LIS  $0                  ; 1c04 70
                LISU 4                   ; 1c05 64
                LISL 6                   ; 1c06 6e
                XS   (IS)+               ; 1c07 ed
                BF   $1,A1c11            ; 1c08 91 08
                BT   4,A1c11             ; 1c0a 84 06
                DS   (IS)                ; 1c0c 3c
                LISL 5                   ; 1c0d 6d
                DS   (IS)                ; 1c0e 3c
                BF   $0,A1bc2            ; 1c0f 90 b2
A1c11:          JMP  A1e1b               ; 1c11 29 1e 1b
                LISU 4                   ; 1c14 64
                LISL 5                   ; 1c15 6d
                DS   (IS)                ; 1c16 3c
                BF   $4,A1c1e            ; 1c17 94 06
                PI   A1e99               ; 1c19 28 1e 99
                BF   $0,A1c7c            ; 1c1c 90 5f
A1c1e:          LR   A,$8                ; 1c1e 48
                AI   $05                 ; 1c1f 24 05
                LR   $8,A                ; 1c21 58
                LIS  $d                  ; 1c22 7d
                LR   $1,A                ; 1c23 51
                PI   A1b95               ; 1c24 28 1b 95
                CI   $0d                 ; 1c27 25 0d
                BF   $4,A1c7c            ; 1c29 94 52
                PI   A1948               ; 1c2b 28 19 48
                LISU 3                   ; 1c2e 63
                LISL 4                   ; 1c2f 6c
                LR   A,(IS)              ; 1c30 4c
                LR   $3,A                ; 1c31 53
                LR   A,$8                ; 1c32 48
                LR   QL,A                ; 1c33 07
                LR   DC,Q                ; 1c34 0f
                XDC                      ; 1c35 2c
                DCI  $0e15               ; 1c36 2a 0e 15
                LR   A,$8                ; 1c39 48
                ADC                      ; 1c3a 8e
                LIS  $d                  ; 1c3b 7d
                ST                       ; 1c3c 17
                LR   Q,DC                ; 1c3d 0e
                PI   $34b8               ; 1c3e 28 34 b8
                LISU 4                   ; 1c41 64
                LISL 7                   ; 1c42 6f
                LR   A,(IS)              ; 1c43 4c
                COM                      ; 1c44 18
                INC                      ; 1c45 1f
                LR   (IS),A              ; 1c46 5c
A1c47:          LI   $11                 ; 1c47 20 11
                LR   $6,A                ; 1c49 56
                DCI  $350a               ; 1c4a 2a 35 0a
                PI   $34d0               ; 1c4d 28 34 d0
                DCI  $3520               ; 1c50 2a 35 20
                PI   $34d6               ; 1c53 28 34 d6
A1c56:          LISU 4                   ; 1c56 64
                LISL 7                   ; 1c57 6f
                DS   $6                  ; 1c58 36
                BF   $1,A1c63            ; 1c59 91 09
                DS   (IS)                ; 1c5b 3c
                BF   $1,A1c63            ; 1c5c 91 06
                PI   $3302               ; 1c5e 28 33 02
                BF   $0,A1c56            ; 1c61 90 f4
A1c63:          PI   $34e5               ; 1c63 28 34 e5
                LR   DC,Q                ; 1c66 0f
                PI   $34d0               ; 1c67 28 34 d0
                LR   DC,Q                ; 1c6a 0f
                PI   $3354               ; 1c6b 28 33 54
                PI   $34b8               ; 1c6e 28 34 b8
                LIS  $0                  ; 1c71 70
                LISU 4                   ; 1c72 64
                LISL 7                   ; 1c73 6f
                XS   (IS)                ; 1c74 ec
                BT   1,A1c47             ; 1c75 81 d1
                XDC                      ; 1c77 2c
                LR   Q,DC                ; 1c78 0e
                JMP  A1bfc               ; 1c79 29 1b fc
A1c7c:          JMP  A1e1b               ; 1c7c 29 1e 1b
                LR   A,$6                ; 1c7f 46
                LISU 3                   ; 1c80 63
                LISL 0                   ; 1c81 68
                LR   (IS)+,A             ; 1c82 5d
                LIS  $0                  ; 1c83 70
                LR   (IS)+,A             ; 1c84 5d
                LR   (IS)+,A             ; 1c85 5d
                LR   (IS)+,A             ; 1c86 5d
                LIS  $1                  ; 1c87 71
                LR   (IS),A              ; 1c88 5c
                JMP  A1e1b               ; 1c89 29 1e 1b
                LISU 3                   ; 1c8c 63
                LISL 4                   ; 1c8d 6c
                LR   A,(IS)              ; 1c8e 4c
                CI   $03                 ; 1c8f 25 03
                BF   $2,A1c9c            ; 1c91 92 0a
                AI   $18                 ; 1c93 24 18
                LR   IS,A                ; 1c95 0b
                LR   A,$6                ; 1c96 46
                LR   (IS),A              ; 1c97 5c
                LIS  $1                  ; 1c98 71
                LISL 4                   ; 1c99 6c
                AS   (IS)                ; 1c9a cc
                LR   (IS),A              ; 1c9b 5c
A1c9c:          JMP  A1e1b               ; 1c9c 29 1e 1b
; NEXT reaches this call after entering A (in simulation). With $3000-$3FFF
; unmapped, reads return $FF and execution runs on into BIOS $4000,
; restarting the cartridge
                PI   $30f7               ; 1c9f 28 30 f7
                LISU 4                   ; 1ca2 64
                LISL 7                   ; 1ca3 6f
                LR   A,(IS)              ; 1ca4 4c
                LR   $1,A                ; 1ca5 51
                CI   $2f                 ; 1ca6 25 2f
                BT   4,A1cae             ; 1ca8 84 05
                CI   $24                 ; 1caa 25 24
                BF   $4,A1cbb            ; 1cac 94 0e
A1cae:          LISU 5                   ; 1cae 65
                LIS  $0                  ; 1caf 70
                XS   (IS)-               ; 1cb0 ee
                BT   4,A1cb8             ; 1cb1 84 06
                LISU 6                   ; 1cb3 66
                LIS  $1                  ; 1cb4 71
                NS   (IS)                ; 1cb5 fc
                BT   4,A1cbb             ; 1cb6 84 04
A1cb8:          PI   A1e99               ; 1cb8 28 1e 99
A1cbb:          PI   A1b95               ; 1cbb 28 1b 95
                JMP  A1e1b               ; 1cbe 29 1e 1b
                LR   A,$6                ; 1cc1 46
                LR   $1,A                ; 1cc2 51
                PI   A1b95               ; 1cc3 28 1b 95
                JMP  A1e1b               ; 1cc6 29 1e 1b
                LISU 3                   ; 1cc9 63
                LISL 0                   ; 1cca 68
                LI   $2f                 ; 1ccb 20 2f
                LR   (IS)+,A             ; 1ccd 5d
                LIS  $0                  ; 1cce 70
                LR   (IS)+,A             ; 1ccf 5d
                LR   (IS)+,A             ; 1cd0 5d
; Another call to the missing $30F7 routine
                PI   $30f7               ; 1cd1 28 30 f7
                LISU 4                   ; 1cd4 64
                LISL 7                   ; 1cd5 6f
                LR   A,(IS)              ; 1cd6 4c
                LR   $1,A                ; 1cd7 51
                PI   A1b95               ; 1cd8 28 1b 95
                LIS  $7                  ; 1cdb 77
                LR   $1,A                ; 1cdc 51
                PI   A1b95               ; 1cdd 28 1b 95
                LR   A,$6                ; 1ce0 46
                CI   $04                 ; 1ce1 25 04
                BF   $1,A1cea            ; 1ce3 91 06
                LR   A,(IS)              ; 1ce5 4c
                LR   $1,A                ; 1ce6 51
                PI   A1b95               ; 1ce7 28 1b 95
A1cea:          JMP  A1e1b               ; 1cea 29 1e 1b
A1ced:          LR   K,P                 ; 1ced 08
                PI   A1859               ; 1cee 28 18 59
                LIS  $0                  ; 1cf1 70
                LR   $7,A                ; 1cf2 57
                LR   $8,A                ; 1cf3 58
                DS   $8                  ; 1cf4 38
                LI   $1d                 ; 1cf5 20 1d
                DCI  $0c02               ; 1cf7 2a 0c 02
                ST                       ; 1cfa 17
                LI   $06                 ; 1cfb 20 06
                ST                       ; 1cfd 17
                LIS  $5                  ; 1cfe 75
                LR   $4,A                ; 1cff 54
                LI   $e0                 ; 1d00 20 e0
                LR   $5,A                ; 1d02 55
                JMP  A1db0               ; 1d03 29 1d b0
                LR   A,$5                ; 1d06 45
                CI   $1f                 ; 1d07 25 1f
                BT   4,A1d0e             ; 1d09 84 04
                LR   A,$8                ; 1d0b 48
                INC                      ; 1d0c 1f
                LR   $8,A                ; 1d0d 58
A1d0e:          PI   A1da3               ; 1d0e 28 1d a3
                LR   $6,A                ; 1d11 56
                CI   $ff                 ; 1d12 25 ff
                BF   $4,A1d1a            ; 1d14 94 05
                LI   $1f                 ; 1d16 20 1f
                BF   $0,A1d28            ; 1d18 90 0f
A1d1a:          LISU 4                   ; 1d1a 64
                LISL 7                   ; 1d1b 6f
                LR   (IS),A              ; 1d1c 5c
                PI   $40a9               ; 1d1d 28 40 a9
                PI   A1fcf               ; 1d20 28 1f cf
                PI   $40bc               ; 1d23 28 40 bc
                LISL 0                   ; 1d26 68
                LR   A,(IS)              ; 1d27 4c
A1d28:          LR   $5,A                ; 1d28 55
                PK                       ; 1d29 0c
                LIS  $c                  ; 1d2a 7c
                LISU 5                   ; 1d2b 65
                LISL 6                   ; 1d2c 6e
                LR   (IS),A              ; 1d2d 5c
                JMP  A1e1b               ; 1d2e 29 1e 1b
                LIS  $c                  ; 1d31 7c
                BF   $0,A1d35            ; 1d32 90 02
                LIS  $8                  ; 1d34 78
A1d35:          LISU 5                   ; 1d35 65
                LISL 6                   ; 1d36 6e
                LR   (IS),A              ; 1d37 5c
                LR   A,$6                ; 1d38 46
                LR   $1,A                ; 1d39 51
                PI   A1d40               ; 1d3a 28 1d 40
                JMP  A1e1b               ; 1d3d 29 1e 1b
A1d40:          DI                       ; 1d40 1a
                LR   A,$7                ; 1d41 47
                CI   $44                 ; 1d42 25 44
                BT   1,A1d49             ; 1d44 81 04
                JMP  A1ea5               ; 1d46 29 1e a5
A1d49:          INC                      ; 1d49 1f
                LR   $7,A                ; 1d4a 57
                DCI  $0e19               ; 1d4b 2a 0e 19
                ADC                      ; 1d4e 8e
                LR   A,$1                ; 1d4f 41
                ST                       ; 1d50 17
                LR   W,J                 ; 1d51 1d
                POP                      ; 1d52 1c
                LIS  $6                  ; 1d53 76
                LISU 3                   ; 1d54 63
                LISL 3                   ; 1d55 6b
                LR   (IS),A              ; 1d56 5c
                LR   A,$8                ; 1d57 48
                DCI  $0e1a               ; 1d58 2a 0e 1a
                ADC                      ; 1d5b 8e
                AI   $05                 ; 1d5c 24 05
                LR   $8,A                ; 1d5e 58
A1d5f:          LM                       ; 1d5f 16
                XDC                      ; 1d60 2c
                LR   $1,A                ; 1d61 51
                PI   A1d40               ; 1d62 28 1d 40
                XDC                      ; 1d65 2c
                LISU 3                   ; 1d66 63
                LISL 3                   ; 1d67 6b
                DS   (IS)                ; 1d68 3c
                BT   4,A1d6d             ; 1d69 84 03
                BT   1,A1d5f             ; 1d6b 81 f3
A1d6d:          JMP  A1e1b               ; 1d6d 29 1e 1b
                LR   A,$6                ; 1d70 46
                AI   $0a                 ; 1d71 24 0a
                LR   $6,A                ; 1d73 56
A1d74:          LI   $10                 ; 1d74 20 10
                LR   $1,A                ; 1d76 51
                PI   A18c6               ; 1d77 28 18 c6
                LR   A,$6                ; 1d7a 46
                ST                       ; 1d7b 17
                JMP  A1e1b               ; 1d7c 29 1e 1b
                PI   A1d8e               ; 1d7f 28 1d 8e
                PI   A1d40               ; 1d82 28 1d 40
                PI   A1d8e               ; 1d85 28 1d 8e
                PI   A1d40               ; 1d88 28 1d 40
                JMP  A1e1b               ; 1d8b 29 1e 1b
A1d8e:          LR   K,P                 ; 1d8e 08
                PI   $40a9               ; 1d8f 28 40 a9
                LI   $10                 ; 1d92 20 10
                LR   $1,A                ; 1d94 51
                PI   A18d5               ; 1d95 28 18 d5
                LR   Q,DC                ; 1d98 0e
                PI   A18cd               ; 1d99 28 18 cd
                LR   DC,Q                ; 1d9c 0f
                LM                       ; 1d9d 16
                LR   $1,A                ; 1d9e 51
                PI   $40bc               ; 1d9f 28 40 bc
                PK                       ; 1da2 0c
A1da3:          DI                       ; 1da3 1a
                DCI  $0e1a               ; 1da4 2a 0e 1a
                LR   A,$8                ; 1da7 48
                ADC                      ; 1da8 8e
                LM                       ; 1da9 16
                LR   W,J                 ; 1daa 1d
                POP                      ; 1dab 1c
                LR   K,P                 ; 1dac 08
                PI   A1859               ; 1dad 28 18 59
A1db0:          PI   A1e80               ; 1db0 28 1e 80
                LI   $90                 ; 1db3 20 90
                LR   $3,A                ; 1db5 53
                LISU 6                   ; 1db6 66
                LISL 6                   ; 1db7 6e
                LR   A,(IS)              ; 1db8 4c
                NI   $3f                 ; 1db9 21 3f
                LR   (IS),A              ; 1dbb 5c
A1dbc:          LR   A,$3                ; 1dbc 43
                NI   $df                 ; 1dbd 21 df
                LR   $3,A                ; 1dbf 53
A1dc0:          LR   A,$3                ; 1dc0 43
                NI   $80                 ; 1dc1 21 80
                BT   4,A1e02             ; 1dc3 84 3e
                LR   DC,H                ; 1dc5 10
                LM                       ; 1dc6 16
                LR   $4,A                ; 1dc7 54
                NI   $80                 ; 1dc8 21 80
                BF   $4,A1df6            ; 1dca 94 2b
                LIS  $0                  ; 1dcc 70
                XS   $4                  ; 1dcd e4
                BF   $4,A1dd8            ; 1dce 94 09
                LR   A,$3                ; 1dd0 43
                OI   $40                 ; 1dd1 22 40
                NI   $7f                 ; 1dd3 21 7f
                LR   $3,A                ; 1dd5 53
                BF   $0,A1df4            ; 1dd6 90 1d
A1dd8:          LR   A,$3                ; 1dd8 43
                NI   $10                 ; 1dd9 21 10
                BT   4,A1de4             ; 1ddb 84 08
                PI   $0c00               ; 1ddd 28 0c 00
                LR   A,$3                ; 1de0 43
                NI   $ef                 ; 1de1 21 ef
                LR   $3,A                ; 1de3 53
A1de4:          LR   A,$4                ; 1de4 44
                XS   $5                  ; 1de5 e5
                BF   $4,A1df0            ; 1de6 94 09
                LR   A,$3                ; 1de8 43
                OI   $50                 ; 1de9 22 50
                NI   $7f                 ; 1deb 21 7f
                LR   $3,A                ; 1ded 53
                BF   $0,A1df4            ; 1dee 90 05
A1df0:          LR   A,$3                ; 1df0 43
                NI   $3f                 ; 1df1 21 3f
                LR   $3,A                ; 1df3 53
A1df4:          BF   $0,A1e02            ; 1df4 90 0d
A1df6:          LIS  $1                  ; 1df6 71
                LR   $1,A                ; 1df7 51
                PI   A18c6               ; 1df8 28 18 c6
                LR   A,$a                ; 1dfb 4a
                ST                       ; 1dfc 17
                LR   A,$b                ; 1dfd 4b
                ST                       ; 1dfe 17
                PI   A1e80               ; 1dff 28 1e 80
A1e02:          LR   A,$3                ; 1e02 43
                NI   $80                 ; 1e03 21 80
                BF   $4,A1e46            ; 1e05 94 40
                LR   A,$3                ; 1e07 43
                NI   $40                 ; 1e08 21 40
                BT   4,A1e29             ; 1e0a 84 1e
                LR   DC,H                ; 1e0c 10
                CM                       ; 1e0d 8d
                LM                       ; 1e0e 16
                NI   $7f                 ; 1e0f 21 7f
                DCI  A1f60               ; 1e11 2a 1f 60
                ADC                      ; 1e14 8e
                ADC                      ; 1e15 8e
                LM                       ; 1e16 16
                LR   QU,A                ; 1e17 06
                LM                       ; 1e18 16
                LR   QL,A                ; 1e19 07
                LR   P0,Q                ; 1e1a 0d
A1e1b:          LR   DC,H                ; 1e1b 10
                LIS  $2                  ; 1e1c 72
                ADC                      ; 1e1d 8e
                LM                       ; 1e1e 16
                LR   $4,A                ; 1e1f 54
                PI   A1e80               ; 1e20 28 1e 80
                LR   A,$3                ; 1e23 43
                OI   $80                 ; 1e24 22 80
                LR   $3,A                ; 1e26 53
                BF   $0,A1e46            ; 1e27 90 1e
A1e29:          LR   DC,H                ; 1e29 10
                CM                       ; 1e2a 8d
                LM                       ; 1e2b 16
                NI   $80                 ; 1e2c 21 80
                BT   4,A1e33             ; 1e2e 84 04
                PI   A1e99               ; 1e30 28 1e 99
A1e33:          LM                       ; 1e33 16
                NI   $80                 ; 1e34 21 80
                BT   4,A1e3e             ; 1e36 84 07
                LR   A,$3                ; 1e38 43
                OI   $20                 ; 1e39 22 20
                LR   $3,A                ; 1e3b 53
                BF   $0,A1e46            ; 1e3c 90 09
A1e3e:          LR   DC,H                ; 1e3e 10
A1e3f:          LIS  $3                  ; 1e3f 73
                ADC                      ; 1e40 8e
                LR   H,DC                ; 1e41 11
                LR   A,$3                ; 1e42 43
                OI   $80                 ; 1e43 22 80
                LR   $3,A                ; 1e45 53
A1e46:          LISU 6                   ; 1e46 66
                LISL 6                   ; 1e47 6e
                LR   A,(IS)              ; 1e48 4c
                NI   $80                 ; 1e49 21 80
                BF   $4,A1e55            ; 1e4b 94 09
                LR   A,$3                ; 1e4d 43
                NI   $28                 ; 1e4e 21 28
                BF   $4,A1e55            ; 1e50 94 04
                JMP  A1dc0               ; 1e52 29 1d c0
A1e55:          LIS  $1                  ; 1e55 71
                LR   $1,A                ; 1e56 51
                PI   A18d5               ; 1e57 28 18 d5
                BF   $4,A1e76            ; 1e5a 94 1b
                LR   A,$3                ; 1e5c 43
                NI   $08                 ; 1e5d 21 08
                BT   4,A1e66             ; 1e5f 84 06
                LR   A,$3                ; 1e61 43
                OI   $40                 ; 1e62 22 40
                BF   $0,A1e69            ; 1e64 90 04
A1e66:          LR   A,$3                ; 1e66 43
                NI   $bf                 ; 1e67 21 bf
A1e69:          NI   $77                 ; 1e69 21 77
                LR   $3,A                ; 1e6b 53
                LM                       ; 1e6c 16
                LR   $a,A                ; 1e6d 5a
                LM                       ; 1e6e 16
                LR   $b,A                ; 1e6f 5b
                PI   A18cd               ; 1e70 28 18 cd
                JMP  A1dbc               ; 1e73 29 1d bc
A1e76:          LR   A,(IS)              ; 1e76 4c
                NI   $c0                 ; 1e77 21 c0
                SR   4                   ; 1e79 14
                SR   1                   ; 1e7a 12
                SR   1                   ; 1e7b 12
                LR   QU,A                ; 1e7c 06
A1e7d:          JMP  A187f               ; 1e7d 29 18 7f
A1e80:          LR   K,P                 ; 1e80 08
                DCI  A1f48               ; 1e81 2a 1f 48
                LR   A,$4                ; 1e84 44
                NI   $7f                 ; 1e85 21 7f
                BF   $4,A1e8f            ; 1e87 94 07
                LR   A,$3                ; 1e89 43
                OI   $08                 ; 1e8a 22 08
                LR   $3,A                ; 1e8c 53
A1e8d:          BF   $0,A1e98            ; 1e8d 90 0a
A1e8f:          ADC                      ; 1e8f 8e
                LM                       ; 1e90 16
                DCI  A1eaa               ; 1e91 2a 1e aa
                ADC                      ; 1e94 8e
                ADC                      ; 1e95 8e
A1e96:          ADC                      ; 1e96 8e
                LR   H,DC                ; 1e97 11
A1e98:          PK                       ; 1e98 0c
A1e99:          DI                       ; 1e99 1a
                LI   $40                 ; 1e9a 20 40
A1e9c:          LISU 6                   ; 1e9c 66
                LISL 6                   ; 1e9d 6e
                LR   $0,A                ; 1e9e 50
                COM                      ; 1e9f 18
                NS   (IS)                ; 1ea0 fc
                XS   $0                  ; 1ea1 e0
                LR   (IS),A              ; 1ea2 5c
                LR   W,J                 ; 1ea3 1d
                POP                      ; 1ea4 1c
A1ea5:          DI                       ; 1ea5 1a
                LI   $80                 ; 1ea6 20 80
                BF   $0,A1e9c            ; 1ea8 90 f3
A1eaa:          LR   A,IS                ; 1eaa 0a
                LR   A,KU                ; 1eab 00
                LR   A,KL                ; 1eac 01
                LR   QL,A                ; 1ead 07
                LR   A,QL                ; 1eae 03
                LR   A,QL                ; 1eaf 03
                LR   QU,A                ; 1eb0 06
                LR   A,QU                ; 1eb1 02
                LR   A,QU                ; 1eb2 02
                LR   A,KL                ; 1eb3 01
                LR   A,KL                ; 1eb4 01
                LR   A,KL                ; 1eb5 01
                LR   P,K                 ; 1eb6 09
                LR   A,KL                ; 1eb7 01
                LR   A,KU                ; 1eb8 00
                LR   IS,A                ; 1eb9 0b
                BT   4,A1e3f             ; 1eba 84 84
                LR   QU,A                ; 1ebc 06
                LR   KL,A                ; 1ebd 05
A1ebe:          LR   A,QU                ; 1ebe 02
                LR   IS,A                ; 1ebf 0b
                LR   A,KU                ; 1ec0 00
                LR   KU,A                ; 1ec1 04
A1ec2:          LR   A,KU                ; 1ec2 00
                LR   QU,A                ; 1ec3 06
A1ec4:          BT   1,A1ecc             ; 1ec4 81 07
                LR   QL,A                ; 1ec6 07
                LR   A,QL                ; 1ec7 03
                LR   QU,A                ; 1ec8 06
                LR   QL,A                ; 1ec9 07
                LR   A,QL                ; 1eca 03
                LR   A,KU                ; 1ecb 00
A1ecc:          LR   K,P                 ; 1ecc 08
                db   $81
                db   $06
                LR   A,IS                ; 1ecf 0a
                LR   KU,A                ; 1ed0 04
                LR   A,KU                ; 1ed1 00
                OM                       ; 1ed2 8b
                BT   1,A1ede             ; 1ed3 81 0a
A1ed5:          LR   A,KU                ; 1ed5 00
                LR   H,DC                ; 1ed6 11
                LR   P,K                 ; 1ed7 09
                LR   A,KL                ; 1ed8 01
                LR   A,KU                ; 1ed9 00
                LR   A,KU                ; 1eda 00
                SR   4                   ; 1edb 14
                LR   A,KL                ; 1edc 01
                LR   KL,A                ; 1edd 05
A1ede:          PK                       ; 1ede 0c
                LR   QU,A                ; 1edf 06
                PK                       ; 1ee0 0c
                LR   DC,Q                ; 1ee1 0f
                LR   QU,A                ; 1ee2 06
                db   $87
                db   $8d
                BT   6,A1f05             ; 1ee5 86 1f
                db   $93
                db   $80
                OM                       ; 1ee9 8b
                LR   A,KU                ; 1eea 00
                AM                       ; 1eeb 88
                LR   A,KL                ; 1eec 01
                LR   Q,DC                ; 1eed 0e
                LR   P,K                 ; 1eee 09
                LR   A,KU                ; 1eef 00
                LR   A,KU                ; 1ef0 00
                BT   0,A1e7d             ; 1ef1 80 8b
                db   $90
                db   $0a
                LR   A,KU                ; 1ef5 00
                LR   DC,H                ; 1ef6 10
                BT   0,A1ef9             ; 1ef7 80 01
A1ef9:          LR   Q,DC                ; 1ef9 0e
                LR   P,K                 ; 1efa 09
                LR   A,KU                ; 1efb 00
                LR   A,KU                ; 1efc 00
                BT   0,A1e8d             ; 1efd 80 8f
                LR   A,KU                ; 1eff 00
                XM                       ; 1f00 8c
                LR   A,QL                ; 1f01 03
                LR   Q,DC                ; 1f02 0e
                LR   P0,Q                ; 1f03 0d
                LR   A,KU                ; 1f04 00
A1f05:          LR   A,KU                ; 1f05 00
                BT   0,A1e96             ; 1f06 80 8f
                BF   $0,A1f17            ; 1f08 90 0e
                LR   A,KU                ; 1f0a 00
                LR   DC,H                ; 1f0b 10
                BT   0,A1f10             ; 1f0c 80 03
                LR   Q,DC                ; 1f0e 0e
                LR   P0,Q                ; 1f0f 0d
A1f10:          LR   A,KU                ; 1f10 00
                LR   A,KU                ; 1f11 00
                BT   0,A1ea5             ; 1f12 80 92
                LR   A,KU                ; 1f14 00
                BF   $0,A1f20            ; 1f15 90 0a
A1f17:          SL   1                   ; 1f17 13
                LR   DC,H                ; 1f18 10
                LR   A,KU                ; 1f19 00
                LR   A,KU                ; 1f1a 00
                BT   0,A1f3a             ; 1f1b 80 1e
                LR   Q,DC                ; 1f1d 0e
                SL   1                   ; 1f1e 13
                LR   P0,Q                ; 1f1f 0d
A1f20:          SR   1                   ; 1f20 12
                LR   A,KU                ; 1f21 00
                LR   Q,DC                ; 1f22 0e
                SL   1                   ; 1f23 13
                LR   A,KU                ; 1f24 00
                LR   IS,A                ; 1f25 0b
                SL   1                   ; 1f26 13
                LR   A,KU                ; 1f27 00
                LR   K,P                 ; 1f28 08
                LR   A,KU                ; 1f29 00
                SL   4                   ; 1f2a 15
                LR   KU,A                ; 1f2b 04
                LR   Q,DC                ; 1f2c 0e
                ST                       ; 1f2d 17
                LR   A,KL                ; 1f2e 01
                LR   H,DC                ; 1f2f 11
                BF   $7,A1f38            ; 1f30 97 07
                LR   Q,DC                ; 1f32 0e
                SR   4                   ; 1f33 14
                LR   A,KU                ; 1f34 00
                LR   DC,H                ; 1f35 10
                BT   0,A1ebe             ; 1f36 80 87
A1f38:          AMD                      ; 1f38 89
                LR   A,KU                ; 1f39 00
A1f3a:          LR   A,KU                ; 1f3a 00
                LR   P,K                 ; 1f3b 09
                BT   0,A1ec4             ; 1f3c 80 87
                BT   0,A1ed5             ; 1f3e 80 96
                LR   P,K                 ; 1f40 09
                BT   0,A1ec2             ; 1f41 80 80
                db   $92
                db   $90
                LR   A,KU                ; 1f45 00
                LR   A,KU                ; 1f46 00
                LR   DC,H                ; 1f47 10
A1f48:          BT   0,0                 ; 1f48 80 00
                LR   QU,A                ; 1f4a 06
                LR   P,K                 ; 1f4b 09
                PK                       ; 1f4c 0c
                LR   H,DC                ; 1f4d 11
                SR   4                   ; 1f4e 14
                SL   4                   ; 1f4f 15
                LM                       ; 1f50 16
                COM                      ; 1f51 18
                DI                       ; 1f52 1a
                POP                      ; 1f53 1c
                LR   W,J                 ; 1f54 1d
                INC                      ; 1f55 1f
                NI   $23                 ; 1f56 21 23
                AI   $0e                 ; 1f58 24 0e
                IN   $2d                 ; 1f5a 26 2d
                db   $2f                 
                DS   $1                  ; 1f5d 31
                DS   $2                  ; 1f5e 32
                DS   $3                  ; 1f5f 33
A1f60:          LR   J,W                 ; 1f60 1e
                EI                       ; 1f61 1b
                POP                      ; 1f62 1c
                AS   $1                  ; 1f63 c1
                EI                       ; 1f64 1b
                INS  10                  ; 1f65 aa
                POP                      ; 1f66 1c
                LIS  $f                  ; 1f67 7f
                EI                       ; 1f68 1b
                INS  10                  ; 1f69 aa
                EI                       ; 1f6a 1b
                AS   $2                  ; 1f6b c2
                POP                      ; 1f6c 1c
                SR   4                   ; 1f6d 14
                POP                      ; 1f6e 1c
                XM                       ; 1f6f 8c
                POP                      ; 1f70 1c
                BF   $f,A1f8f            ; 1f71 9f 1d
                LIS  $f                  ; 1f73 7f
                POP                      ; 1f74 1c
                LR   KU,A                ; 1f75 04
                POP                      ; 1f76 1c
                SR   4                   ; 1f77 14
                LR   W,J                 ; 1f78 1d
                DS   $4                  ; 1f79 34
                LR   W,J                 ; 1f7a 1d
                DCI  A1d74               ; 1f7b 2a 1d 74
                LR   W,J                 ; 1f7e 1d
                DS   $1                  ; 1f7f 31
                LR   W,J                 ; 1f80 1d
                BT   5,A1f9f             ; 1f81 85 1d
                LIS  $0                  ; 1f83 70
                LR   W,J                 ; 1f84 1d
                LR   $3,A                ; 1f85 53
                LR   W,J                 ; 1f86 1d
                DS   $8                  ; 1f87 38
                POP                      ; 1f88 1c
                AS   $9                  ; 1f89 c9
                LR   A,QL                ; 1f8a 03
                DS   $8                  ; 1f8b 38
                DS   $a                  ; 1f8c 3a
                LR   A,KL                ; 1f8d 01
                DS   $8                  ; 1f8e 38
A1f8f:          LISL 2                   ; 1f8f 6a
                LR   A,KL                ; 1f90 01
                DS   $8                  ; 1f91 38
                DS   $5                  ; 1f92 35
                LR   A,QL                ; 1f93 03
                DS   $8                  ; 1f94 38
                DS   $0                  ; 1f95 30
                LR   A,QL                ; 1f96 03
                DS   $8                  ; 1f97 38
                LISU 5                   ; 1f98 65
                LR   A,QL                ; 1f99 03
                DS   $7                  ; 1f9a 37
                INS  4                   ; 1f9b a4
                LR   Q,DC                ; 1f9c 0e
                DS   $5                  ; 1f9d 35
                SL   4                   ; 1f9e 15
A1f9f:          LR   QL,A                ; 1f9f 07
                DS   $6                  ; 1fa0 36
                AS   $a                  ; 1fa1 ca
                LR   K,P                 ; 1fa2 08
                SL   1                   ; 1fa3 13
                BF   $e,A1fae            ; 1fa4 9e 09
                SL   1                   ; 1fa6 13
                BF   $e,A1fb2            ; 1fa7 9e 0a
                DS   $8                  ; 1fa9 38
                LR   (IS),A              ; 1faa 5c
                LR   KU,A                ; 1fab 04
                DS   $6                  ; 1fac 36
                LR   $b,A                ; 1fad 5b
A1fae:          LR   KU,A                ; 1fae 04
                DS   $8                  ; 1faf 38
                DI                       ; 1fb0 1a
                LR   P0,Q                ; 1fb1 0d
A1fb2:          DS   $7                  ; 1fb2 37
                LR   A,IS                ; 1fb3 0a
                LR   Q,DC                ; 1fb4 0e
                DS   $5                  ; 1fb5 35
                LR   A,IS                ; 1fb6 0a
                LR   Q,DC                ; 1fb7 0e
                DS   $5                  ; 1fb8 35
                CI   $0b                 ; 1fb9 25 0b
                DS   $7                  ; 1fbb 37
                db   $2f                 
                LR   A,QL                ; 1fbd 03
                DS   $8                  ; 1fbe 38
                LR   H,DC                ; 1fbf 11
                LR   A,QL                ; 1fc0 03
                DS   $7                  ; 1fc1 37
                SR   1                   ; 1fc2 12
                LR   A,QL                ; 1fc3 03
                DS   $7                  ; 1fc4 37
                INC                      ; 1fc5 1f
                LR   A,QL                ; 1fc6 03
                DS   $7                  ; 1fc7 37
                NM                       ; 1fc8 8a
                LR   IS,A                ; 1fc9 0b
                DS   (IS)+               ; 1fca 3d
                LR   A,QL                ; 1fcb 03
                LR   KU,A                ; 1fcc 04
                DS   $8                  ; 1fcd 38
                INC                      ; 1fce 1f
A1fcf:          LR   K,P                 ; 1fcf 08
                PI   A1948               ; 1fd0 28 19 48
                PI   $3156               ; 1fd3 28 31 56
                LR   $3,A                ; 1fd6 53
                LR   Q,DC                ; 1fd7 0e
                LISU 3                   ; 1fd8 63
                LISL 6                   ; 1fd9 6e
                LR   A,QU                ; 1fda 02
                LR   (IS)+,A             ; 1fdb 5d
                LR   A,QL                ; 1fdc 03
                LR   (IS)+,A             ; 1fdd 5d
                LISU 4                   ; 1fde 64
                LIS  $0                  ; 1fdf 70
                XS   $3                  ; 1fe0 e3
                BT   4,A1fe9             ; 1fe1 84 07
                CI   $03                 ; 1fe3 25 03
                BF   $4,A1fec            ; 1fe5 94 06
                LI   $1e                 ; 1fe7 20 1e
A1fe9:          LR   (IS),A              ; 1fe9 5c
                BF   $0,A1ff7            ; 1fea 90 0c
A1fec:          SR   1                   ; 1fec 12
                BT   4,A1ff1             ; 1fed 84 03
                LIS  $3                  ; 1fef 73
                ADC                      ; 1ff0 8e
A1ff1:          LM                       ; 1ff1 16
                LR   (IS),A              ; 1ff2 5c
                LM                       ; 1ff3 16
                LR   QU,A                ; 1ff4 06
                LM                       ; 1ff5 16
                LR   QL,A                ; 1ff6 07
A1ff7:          PI   A195a               ; 1ff7 28 19 5a
                PK                       ; 1ffa 0c
                LR   A,KU                ; 1ffb 00
                LR   A,KU                ; 1ffc 00
                LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
