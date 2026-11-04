; Retail joystick capture and calibration; preserve the stock machine path.
StockJoystickCapture:
A1eed:          LR   K,P ; 1eed
                PI   $40a9 ; 1eee
                LR   A,$a ; 1ef1
                LISU 2 ; 1ef2
                LISL 0 ; 1ef3
                LR   13,A ; 1ef4
                LIS  $1 ; 1ef5
A1ef6:          DS   $a ; 1ef6
                BF   $1,A1efc ; 1ef7
                SL   1 ; 1ef9
                BF   $0,A1ef6 ; 1efa
A1efc:          OUTS 0 ; 1efc
                LIS  $8 ; 1efd
                SL   4 ; 1efe
                DCI  $0fde ; 1eff
                LR   H,DC ; 1f02
                DI ; 1f03
                OM ; 1f04
                LR   DC,H ; 1f05
                ST ; 1f06
                LR   $8,A ; 1f07
                DCI  $08fb ; 1f08
                LR   Q,DC ; 1f0b
                LM ; 1f0c
                LR   12,A ; 1f0d
A1f0e:          LR   DC,Q ; 1f0e
                CM ; 1f0f
                BT   4,A1f0e ; 1f10
                LR   A,$8 ; 1f12
                OUTS 1 ; 1f13
                LIS  $2 ; 1f14
                DCI  $0fea ; 1f15
                OM ; 1f18
                NI   $f7 ; 1f19
                DCI  $08f7 ; 1f1b
                ST ; 1f1e
                DCI  $0fea ; 1f1f
                ST ; 1f22
                LR   W,J ; 1f23
                LIS  $d ; 1f24
                AS   12 ; 1f25
A1f26:          LR   DC,Q ; 1f26
                CM ; 1f27
                BF   $2,A1f26 ; 1f28
                LR   DC,H ; 1f2a
                DI ; 1f2b
                LM ; 1f2c
                NI   $7f ; 1f2d
                OUTS 1 ; 1f2f
                LR   DC,H ; 1f30
                ST ; 1f31
                LR   W,J ; 1f32
                LIS  $0 ; 1f33
                LR   QU,A ; 1f34
                LR   QL,A ; 1f35
                LR   $a,A ; 1f36
                LI   $e4 ; 1f37
                LR   $b,A ; 1f39
                LR   A,12 ; 1f3a
                COM ; 1f3b
                DCI  $08f9 ; 1f3c
                AM ; 1f3f
                LR   12,A ; 1f40
                CI   $0a ; 1f41
                BF   $2,A1f75 ; 1f43
A1f45:          PI   $22cd ; 1f45
                DS   12 ; 1f48
                BF   $4,A1f45 ; 1f49
                DCI  $08f8 ; 1f4b
                LM ; 1f4e
                LR   $b,A ; 1f4f
                PI   $22cd ; 1f50
                LI   $26 ; 1f53
                LR   $b,A ; 1f55
                PI   $22bf ; 1f56
                LR   A,QU ; 1f59
                LR   13,A ; 1f5a
                LR   A,QL ; 1f5b
                LR   14,A ; 1f5c
                LR   A,14 ; 1f5d
                LR   A,13 ; 1f5e
                SL   1 ; 1f5f
                SL   1 ; 1f60
                DCI  $0c00 ; 1f61
                ADC ; 1f64
                LM ; 1f65
                LR   $a,A ; 1f66
                LM ; 1f67
                LR   $b,A ; 1f68
                PI   $22bf ; 1f69
                BF   $2,A1f77 ; 1f6c
                LI   $fe ; 1f6e
                ADC ; 1f70
                LR   A,13 ; 1f71
                ST ; 1f72
                LR   A,14 ; 1f73
                ST ; 1f74
A1f75:          BF   $0,A1fb8 ; 1f75
A1f77:          LR   A,13 ; 1f77
                LR   QU,A ; 1f78
                LR   A,14 ; 1f79
                LR   QL,A ; 1f7a
                LM ; 1f7b
                LR   $a,A ; 1f7c
                LM ; 1f7d
                LR   $b,A ; 1f7e
                PI   $22bf ; 1f7f
                BT   2,A1f8e ; 1f82
                LI   $fe ; 1f84
                ADC ; 1f86
                LR   A,13 ; 1f87
                ST ; 1f88
                LR   A,14 ; 1f89
                ST ; 1f8a
                LIS  $0 ; 1f8b
                BF   $0,A1fba ; 1f8c
A1f8e:          LR   A,QU ; 1f8e
                LR   13,A ; 1f8f
                LR   A,QL ; 1f90
                LR   14,A ; 1f91
                LI   $fc ; 1f92
                ADC ; 1f94
                LM ; 1f95
                LR   QU,A ; 1f96
                LM ; 1f97
                LR   QL,A ; 1f98
                PI   $22cd ; 1f99
                LIS  $3 ; 1f9c
                LISL 0 ; 1f9d
                LR   13,A ; 1f9e
                LIS  $0 ; 1f9f
                LR   QU,A ; 1fa0
                LR   QL,A ; 1fa1
                LR   $a,A ; 1fa2
                LR   A,12 ; 1fa3
                SL   4 ; 1fa4
                LR   13,A ; 1fa5
                LR   A,14 ; 1fa6
                SR   4 ; 1fa7
                XS   14 ; 1fa8
                SR   1 ; 1fa9
                LR   $b,A ; 1faa
A1fab:          PI   $22cd ; 1fab
                DS   12 ; 1fae
                BF   $4,A1fab ; 1faf
                LR   A,QL ; 1fb1
                AI   $46 ; 1fb2
                CI   $d6 ; 1fb4
                BT   2,A1fba ; 1fb6
A1fb8:          LI   $d6 ; 1fb8
A1fba:          LR   12,A ; 1fba
                LIS  $2 ; 1fbb
                DCI  $0fea ; 1fbc
                LR   H,DC ; 1fbf
                XM ; 1fc0
                LR   DC,H ; 1fc1
                ST ; 1fc2
                DCI  $08f7 ; 1fc3
                ST ; 1fc6
                PI   $40bc ; 1fc7
                LR   A,14 ; 1fca
                PK ; 1fcb
