; Retail X-origin calculation; historical reference remains in tennis.asm.
PatentDisplayOrigins:          LR   K,P
                LISU 5
                LISL 7
                DCI  $0c80
                LI   $10
                LR   $0,A
                LIS  $2
                LR   $2,A
PatentDisplayOriginLoop:          LM
                LR   $1,A
                LM
                COM
                INC
                AS   $1
                COM
                LR   13,A
                BR7  PatentDisplayOriginNext
                LISU 6
PatentDisplayOriginNext:          LR   A,$2
                ADC
                DS   $0
                BF   $4,PatentDisplayOriginLoop
                PK
