;RES1 

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $4000

;VLSI registers
;write only
VID_COMMAND:	equ $08F7
VID_BKGCOLOR:	equ $08F5
VID_FINALMOD:	equ $08F2
VID_YINTLOW:	equ $08f0


;read only
VID_XFREEZE	equ $08f8
VID_YFREEZELO	equ $08f9
VID_YFREEZEHI	equ $08fA	;and odd/even frame, and y current hi
VID_CURYLO	equ $08fB


;16 registers in each range, 1 per sprite, read/write
VID_RPL:	equ 0x800	;sprite bitmap low address bits
VID_RPH:	equ 0x810	;sprite bitmap hi address bits and color
VID_DELX:	equ 0x820	;sprite width, intensity, xcopy bit
VID_DELY:	equ 0x830	;sprite height
VID_XV:		equ 0x840	;sprite x-position
VID_YVLA:	equ 0x850	;sprite y-position low list A
VID_YVLB:	equ 0x860	;sprite y-position low list B
VID_YXA:	equ 0x870	;sprite y-position hi and x order list A
VID_YXB:	equ 0x880	;sprite y-position hi and x order list B

;RAM $0C00-$0FFF
RAMSTART:	equ $0C00	;RAM from $0C00 to $0FFF
FIRSTCHAR:	equ $0C2F	;display buffer $0C2F to $0F3E

TXTBUF:		equ $0F3F	;TEXT editor buffer - 7x16=112 bytes
CURSORPOS:	equ $0FDF
SHIFTSTATE:	equ $0FE2
WARMBOOTFLAG:	equ $0FE4	;set to $AA to indicate warm boot
BKGCOLOR:	equ $0FE9
VIDEOMODE:	equ $0FEA

;CARTS $1000-$1FFF
CARTSTART:	equ $1000	;where carts appear in memory
CARTBKGCOLOR:	equ $1002	;set when name of cart printed
CARTNAME:	equ $1003	;the name of the cart
CARTCODE:	equ $1012	;jump here to run the cart

;RES2 $2000-$27FF
FONT:		equ $2010	;7 bytes per character
PRINTWRKEY:	equ $2468
MONTEXT:	equ $2437
JANTEXT:	equ $245b
SELKEYTEXT:	equ $23EF

                DI                       ; 4000 1a			reset jumps here (actually $0000)
                LR   J,W                 ; 4001 1e
                PI   SETUPSTACK          ; 4002 28 40 d0
                DCI  WARMBOOTFLAG        ; 4005 2a 0f e4	warm boot flag
                LR   Q,DC                ; 4008 0e
                LI   $aa		         ; 4009 20 aa		
                CM                       ; 400b 8d
                BT   4,WARMBOOT          ; 400c 84 12		if it's $AA, don't clear memory
                
                LIS  $4                  ; 400e 74			RAM is 0x0400 bytes long (1K)
                LR   $a,A                ; 400f 5a
                LIS  $0                  ; 4010 70
                LR   $b,A                ; 4011 5b
                DCI  RAMSTART            ; 4012 2a 0c 00	set RAM from $C00 to $FFF to $00
CLRRAM:         ST                       ; 4015 17
                DS   $b                  ; 4016 3b
                BF   $4,CLRRAM           ; 4017 94 fd
                DS   $a                  ; 4019 3a
                BF   $4,CLRRAM           ; 401a 94 fa
                LISL 6                   ; 401c 6e
                LR   (IS),A              ; 401d 5c
                LISL 0                   ; 401e 68
                
WARMBOOT:       DCI  A478e               ; 401f 2a 47 8e
                XDC                      ; 4022 2c
                LR   DC,Q                ; 4023 0f
                LIS  $7                  ; 4024 77
                LR   (IS),A              ; 4025 5c
                PI   COPYMEMTOMEM        ; 4026 28 43 cd	;copy 7 bytes from 478e to fe4 (sets warm boot flag)
                PI   A45db               ; 4029 28 45 db
                PI   A41c8               ; 402c 28 41 c8
                
                DCI  $08f2               ; 402f 2a 08 f2
                LIS  $0                  ; 4032 70
                ST                       ; 4033 17
                
                DCI  VID_BKGCOLOR        ; 4034 2a 08 f5
                LIS  $4                  ; 4037 74
                ST                       ; 4038 17
                
                PI   A424a               ; 4039 28 42 4a
                DCI  CARTSTART           ; 403c 2a 10 00
                LI   $AA		         ; 403f 20 aa		;see if a cart is inserted (first 2 bytes are $AA $55)
                CM                       ; 4041 8d
                BF   $4,NOCART           ; 4042 94 05		;nope
                SR   1                   ; 4044 12			;turn $AA to $55
                CM                       ; 4045 8d
                BT   4,CART              ; 4046 84 2b		;yes
                
NOCART:         DCI  SHIFTSTATE          ; 4048 2a 0f e2	;no cart, show built-in menu
                LIS  $1                  ; 404b 71
                ST                       ; 404c 17
                
                DCI  $0fc2               ; 404d 2a 0f c2
                LI   $e0                 ; 4050 20 e0
                ST                       ; 4052 17
                
                DCI  MENUTEXT            ; 4053 2a 47 af
                LI   $4f                 ; 4056 20 4f		;print full menu text (79 bytes)
                LISL 4                   ; 4058 6c
                LR   (IS),A              ; 4059 5c
                PI   PRINT               ; 405a 28 42 05
                LISL 4                   ; 405d 6c
                LI   $78                 ; 405e 20 78
                LR   (IS),A              ; 4060 5c
A4061:          PI   GETKEY              ; 4061 28 43 d6	;wait until key hit
                BT   4,A4061             ; 4064 84 fc
                BF   $1,A4061            ; 4066 91 fa
                LR   A,$8                ; 4068 48
                CI   $41                 ; 4069 25 41		;keycode for SPECIAL
                BF   $4,A4061            ; 406b 94 f5
                PI   SPECIAL             ; 406d 28 44 2a
                BF   $0,NOCART           ; 4070 90 d7
                
CART:           PI   CLRSCREEN           ; 4072 28 41 d5	;cart inserted- show TM, cart name
                DCI  MENUTEXT            ; 4075 2a 47 af
                LI   $10                 ; 4078 20 10		;print VIDEO BRAIN TM (16 bytes)
                LISL 4                   ; 407a 6c
                LR   (IS),A              ; 407b 5c
                PI   PRINT               ; 407c 28 42 05
                DCI  CARTBKGCOLOR        ; 407f 2a 10 02
                LM                       ; 4082 16
                XDC                      ; 4083 2c
                DCI  VID_BKGCOLOR        ; 4084 2a 08 f5	;set background color
                ST                       ; 4087 17
                XDC                      ; 4088 2c
                LIS  $f                  ; 4089 7f
                LR   (IS),A              ; 408a 5c
                PI   PRINT               ; 408b 28 42 05	;print name of cart stored at top of cart ROM
                LI   $78                 ; 408e 20 78
                LR   (IS),A              ; 4090 5c
                PI   GETKEY              ; 4091 28 43 d6	;wait until key hit or timeout
                DCI  CARTSTART           ; 4094 2a 10 00
                LI   $AA		         ; 4097 20 aa		;make sure cart still inserted
                CM                       ; 4099 8d
                BT   4,A40a1             ; 409a 84 06
                
                PI   CLRSCREEN           ; 409c 28 41 d5	;no cart
                BF   $0,NOCART           ; 409f 90 a8
                
A40a1:          DCI  $0fe0               ; 40a1 2a 0f e0
                LIS  $0                  ; 40a4 70
                ST                       ; 40a5 17
                JMP  CARTCODE            ; 40a6 29 10 12		run the cart program

PUSHK:          DI                       ; 40a9 1a
                LR   A,IS                ; 40aa 0a
                LISU 7                   ; 40ab 67
                LISL 5                   ; 40ac 6d
                LR   (IS)-,A             ; 40ad 5e
A40ae:          LR   A,(IS)              ; 40ae 4c
                LR   IS,A                ; 40af 0b
                LR   A,KL                ; 40b0 01
                LR   (IS)-,A             ; 40b1 5e
                LR   A,KU                ; 40b2 00
                LR   (IS),A              ; 40b3 5c
                LISU 7                   ; 40b4 67
                LISL 4                   ; 40b5 6c
                DS   (IS)                ; 40b6 3c
                DS   (IS)+               ; 40b7 3d
                LR   A,(IS)              ; 40b8 4c
                LR   IS,A                ; 40b9 0b
                LR   W,J                 ; 40ba 1d
                POP                      ; 40bb 1c
                
POPK:           DI                       ; 40bc 1a
                LR   A,IS                ; 40bd 0a
                LISU 7                   ; 40be 67
                LISL 5                   ; 40bf 6d
                LR   (IS)-,A             ; 40c0 5e
                LR   A,(IS)              ; 40c1 4c
                INC                      ; 40c2 1f
                LR   IS,A                ; 40c3 0b
                LR   A,(IS)+             ; 40c4 4d
                LR   KU,A                ; 40c5 04
                LR   A,(IS)              ; 40c6 4c
                LR   KL,A                ; 40c7 05
                LR   A,IS                ; 40c8 0a
                LISU 7                   ; 40c9 67
                LISL 4                   ; 40ca 6c
                LR   (IS)+,A             ; 40cb 5d
                LR   A,(IS)              ; 40cc 4c
                LR   IS,A                ; 40cd 0b
                LR   W,J                 ; 40ce 1d
                POP                      ; 40cf 1c
                
SETUPSTACK:     LR   K,P                 ; 40d0 08
                LISU 7                   ; 40d1 67
                LISL 4                   ; 40d2 6c
                LI   $3b                 ; 40d3 20 3b
                LR   (IS),A              ; 40d5 5c
                LISU 2                   ; 40d6 62
                LISL 0                   ; 40d7 68
                PK                       ; 40d8 0c
                
DRAWCHAR:       LR   K,P                 ; 40d9 08
A40da:          LISU 2                   ; 40da 62
                LISL 0                   ; 40db 68
                DCI  CURSORPOS           ; 40dc 2a 0f df
                LM                       ; 40df 16
                LR   (IS)+,A             ; 40e0 5d
                SR   4                   ; 40e1 14
                LR   (IS)-,A             ; 40e2 5e
                LIS  $f                  ; 40e3 7f
                NS   (IS)+               ; 40e4 fd
                DCI  $0bbf               ; 40e5 2a 0b bf	$C2F-$70
                ADC                      ; 40e8 8e			position in row
                LI   $70                 ; 40e9 20 70		7x16=number of bytes between rows of characters
A40eb:          ADC                      ; 40eb 8e
                DS   (IS)                ; 40ec 3c
                BT   1,A40eb             ; 40ed 81 fd
                
                XDC                      ; 40ef 2c
                DCI  FONT                ; 40f0 2a 20 10
                LR   A,$8                ; 40f3 48				;move to character
                ADC                      ; 40f4 8e
                SL   1                   ; 40f5 13
                ADC                      ; 40f6 8e
                ADC                      ; 40f7 8e
                ADC                      ; 40f8 8e
                
                LIS  $7                  ; 40f9 77				;characters have 7 rows of pixels
                LR   (IS),A              ; 40fa 5c
A40fb:          LM                       ; 40fb 16				;get line of character
                XDC                      ; 40fc 2c				
                ST                       ; 40fd 17				;draw it on screen
                LIS  $f                  ; 40fe 7f
                ADC                      ; 40ff 8e
                XDC                      ; 4100 2c
                DS   (IS)                ; 4101 3c
                BF   $4,A40fb            ; 4102 94 f8			;next row
                
                PK                       ; 4104 0c
                
DRAWNUM:        LR   K,P                 ; 4105 08			;translates # to char index and calls DRAWCHAR
                DCI  PRINTWRKEY          ; 4106 2a 24 68	;byte after array of numbers
                LR   A,$8                ; 4109 48
                COM                      ; 410a 18
                ADC                      ; 410b 8e
                LM                       ; 410c 16
                LR   $8,A                ; 410d 58
                BF   $0,A40da            ; 410e 90 cb

A4110:          
				db   $23,$06,$00,$11,$99,$99
                
DAYSINMON:      						;# of days in each month
				db   $31,$28,$31,$30,$31,$30,$31,$31,$30,$31,$30,$31
                
BACKSPACE:
                LR   K,P                 ; 4122 08
                DCI  CURSORPOS           ; 4123 2a 0f df
                LI   $ff                 ; 4126 20 ff
                AM                       ; 4128 88
                BT   1,A4138             ; 4129 81 0e
                BF   $0,A4137            ; 412b 90 0b
                
INCCURSOR:      LR   K,P                 ; 412d 08
                DCI  CURSORPOS           ; 412e 2a 0f df
                LIS  $1                  ; 4131 71
                AM                       ; 4132 88
                CI   $70                 ; 4133 25 70
                BF   $4,A4138            ; 4135 94 02
A4137:          LIS  $0                  ; 4137 70
A4138:          DCI  CURSORPOS           ; 4138 2a 0f df
                ST                       ; 413b 17
                NI   $0f                 ; 413c 21 0f
                PK                       ; 413e 0c
                
A413f:          LR   K,P                 ; 413f 08
                PI   PUSHK               ; 4140 28 40 a9
                LIS  $0                  ; 4143 70
                XS   $3                  ; 4144 e3
                LISU 3                   ; 4145 63
                LISL 7                   ; 4146 6f
                BF   $4,A4151            ; 4147 94 09
                LISU 2                   ; 4149 62
                LR   A,(IS)              ; 414a 4c
                LISU 3                   ; 414b 63
                LR   (IS),A              ; 414c 5c
                LISU 7                   ; 414d 67
                LR   A,(IS)-             ; 414e 4e
                LISU 3                   ; 414f 63
                LR   (IS)-,A             ; 4150 5e
A4151:          LM                       ; 4151 16
                LR   (IS)-,A             ; 4152 5e
                BR7  A4151               ; 4153 8f fd
                DCI  $27e3               ; 4155 2a 27 e3	;contains 4,5,6,2,3,1,7
                LISU 3                   ; 4158 63
                LISL 4                   ; 4159 6c
                LR   A,(IS)              ; 415a 4c
                ADC                      ; 415b 8e
                LM                       ; 415c 16
                DCI  BKGCOLOR            ; 415d 2a 0f e9
                ST                       ; 4160 17
                DCI  VID_BKGCOLOR        ; 4161 2a 08 f5
                ST                       ; 4164 17
                DCI  CURSORPOS           ; 4165 2a 0f df
                LIS  $6                  ; 4168 76
                ST                       ; 4169 17
                DCI  MONTEXT             ; 416a 2a 24 37	;get the day of the week
                PI   A4237               ; 416d 28 42 37
                DCI  CURSORPOS           ; 4170 2a 0f df
                LI   $13                 ; 4173 20 13
                ST                       ; 4175 17
                LISU 3                   ; 4176 63
                LISL 3                   ; 4177 6b
                PI   DRAW2NUMS           ; 4178 28 42 1e
                PI   INCCURSOR           ; 417b 28 41 2d
                LISU 3                   ; 417e 63
                LISL 2                   ; 417f 6a
                LR   A,(IS)              ; 4180 4c
                SR   4                   ; 4181 14
                BT   4,A4189             ; 4182 84 06
                LIS  $a                  ; 4184 7a
                AS   (IS)                ; 4185 cc
                SL   4                   ; 4186 15
                SR   4                   ; 4187 14
                LR   (IS),A              ; 4188 5c
A4189:          DCI  JANTEXT             ; 4189 2a 24 5b	;get the month
                PI   A4237               ; 418c 28 42 37
                PI   INCCURSOR           ; 418f 28 41 2d
                LISU 3                   ; 4192 63
                LISL 0                   ; 4193 68
                PI   DRAW2NUMS           ; 4194 28 42 1e
                LISU 3                   ; 4197 63
                LISL 1                   ; 4198 69
                PI   DRAW2NUMS           ; 4199 28 42 1e
                PI   A41c8               ; 419c 28 41 c8
                DCI  CURSORPOS           ; 419f 2a 0f df
                LI   $24                 ; 41a2 20 24
                ST                       ; 41a4 17
                LISU 3                   ; 41a5 63
                LISL 5                   ; 41a6 6d
                PI   DRAW2NUMS           ; 41a7 28 42 1e
                LI   $2a                 ; 41aa 20 2a
                LR   $8,A                ; 41ac 58
                PI   DRAWCHAR            ; 41ad 28 40 d9
                PI   INCCURSOR           ; 41b0 28 41 2d
                LISU 3                   ; 41b3 63
                LISL 6                   ; 41b4 6e
                PI   DRAW2NUMS           ; 41b5 28 42 1e
                LI   $2a                 ; 41b8 20 2a
                LR   $8,A                ; 41ba 58
                PI   DRAWCHAR            ; 41bb 28 40 d9
                PI   INCCURSOR           ; 41be 28 41 2d
                LISU 3                   ; 41c1 63
                LISL 7                   ; 41c2 6f
                PI   DRAW2NUMS           ; 41c3 28 42 1e
                BF   $0,A41cc            ; 41c6 90 05
                
A41c8:          LR   K,P                 ; 41c8 08
                PI   PUSHK               ; 41c9 28 40 a9
A41cc:          PI   A4501               ; 41cc 28 45 01
                PI   A424d               ; 41cf 28 42 4d
                LISL 0                   ; 41d2 68
                BF   $0,A4201            ; 41d3 90 2d
                
CLRSCREEN:      LR   K,P                 ; 41d5 08
                PI   PUSHK               ; 41d6 28 40 a9
                DCI  VID_COMMAND      ; 41d9 2a 08 f7
                LIS  $0                  ; 41dc 70
                ST                       ; 41dd 17
                PI   A41c8               ; 41de 28 41 c8
                
                DCI  FIRSTCHAR           ; 41e1 2a 0c 2f		; memory location of upper left char
                LIS  $4                  ; 41e4 74				;4 times...
                LR   $a,A                ; 41e5 5a
A41e6:          LI   $c4                 ; 41e6 20 c4			;...196 bytes=784 bytes=7 rows of 16 7-pixel high chars
                LR   $b,A                ; 41e8 5b
                LIS  $0                  ; 41e9 70
A41ea:          ST                       ; 41ea 17
                DS   $b                  ; 41eb 3b
                BF   $4,A41ea            ; 41ec 94 fd
                DS   $a                  ; 41ee 3a
                BF   $4,A41e6            ; 41ef 94 f6
                
                PI   A41c8               ; 41f1 28 41 c8
                DCI  VIDEOMODE           ; 41f4 2a 0f ea
                LM                       ; 41f7 16
                DCI  VID_COMMAND       ; 41f8 2a 08 f7
                ST                       ; 41fb 17
                DCI  CURSORPOS           ; 41fc 2a 0f df
                LIS  $0                  ; 41ff 70
                ST                       ; 4200 17
A4201:          PI   POPK                ; 4201 28 40 bc
                PK                       ; 4204 0c

PRINT:          LR   K,P                 ; 4205 08
                PI   PUSHK               ; 4206 28 40 a9
A4209:          LM                       ; 4209 16
                LR   Q,DC                ; 420a 0e
                LR   $8,A                ; 420b 58
                PI   DRAWCHAR            ; 420c 28 40 d9
                PI   INCCURSOR           ; 420f 28 41 2d
                BF   $4,A4217            ; 4212 94 04
                PI   A41c8               ; 4214 28 41 c8
A4217:          LISL 4                   ; 4217 6c
                DS   (IS)                ; 4218 3c
                LR   DC,Q                ; 4219 0f
                BF   $4,A4209            ; 421a 94 ee
                BF   $0,A4201            ; 421c 90 e4
                
DRAW2NUMS:      LR   K,P                 ; 421e 08
                PI   PUSHK               ; 421f 28 40 a9
                LR   A,(IS)              ; 4222 4c
                LR   $5,A                ; 4223 55
                SR   4                   ; 4224 14
                LR   $8,A                ; 4225 58
                PI   DRAWNUM             ; 4226 28 41 05
                PI   INCCURSOR           ; 4229 28 41 2d
                LIS  $f                  ; 422c 7f
                NS   $5                  ; 422d f5
                LR   $8,A                ; 422e 58
                PI   DRAWNUM             ; 422f 28 41 05
                PI   INCCURSOR           ; 4232 28 41 2d
A4235:          BF   $0,A4201            ; 4235 90 cb

A4237:          LR   K,P                 ; 4237 08
                PI   PUSHK               ; 4238 28 40 a9
                LR   A,(IS)              ; 423b 4c
                SL   1                   ; 423c 13
                AS   (IS)                ; 423d cc
                COM                      ; 423e 18
                INC                      ; 423f 1f
                ADC                      ; 4240 8e
                LIS  $3                  ; 4241 73
                LISU 2                   ; 4242 62
                LISL 4                   ; 4243 6c
                LR   (IS),A              ; 4244 5c
                PI   PRINT               ; 4245 28 42 05
                BF   $0,A4235            ; 4248 90 ec
                
A424a:          LR   K,P                 ; 424a 08
                BF   $0,A4293            ; 424b 90 47
                
A424d:          LR   K,P                 ; 424d 08
                LISU 2                   ; 424e 62
                LISL 0                   ; 424f 68
                DCI  $0ffa               ; 4250 2a 0f fa
                LM                       ; 4253 16
                LR   (IS)+,A             ; 4254 5d
                LR   (IS)+,A             ; 4255 5d
                COM                      ; 4256 18
                INC                      ; 4257 1f
                AI   $10                 ; 4258 24 10
                LISL 3                   ; 425a 6b
                LR   (IS)-,A             ; 425b 5e
                LIS  $0                  ; 425c 70
                XM                       ; 425d 8c
                BF   $4,A4264            ; 425e 94 05
                LIS  $7                  ; 4260 77
                LR   (IS),A              ; 4261 5c
                BF   $0,A4271            ; 4262 90 0e
                
A4264:          LIS  $3                  ; 4264 73
                LR   (IS),A              ; 4265 5c
                XDC                      ; 4266 2c
                DCI  $08fa               ; 4267 2a 08 fa
                LIS  $0                  ; 426a 70
                XM                       ; 426b 8c
                XDC                      ; 426c 2c
                BF   $1,A4271            ; 426d 91 03
                LIS  $2                  ; 426f 72
                ADC                      ; 4270 8e
                
A4271:          LM                       ; 4271 16
                LR   $a,A                ; 4272 5a
                LM                       ; 4273 16
                LR   $b,A                ; 4274 5b
                LR   DC,H                ; 4275 10
                XDC                      ; 4276 2c
                DCI  $0800               ; 4277 2a 08 00
                LISL 0                   ; 427a 68

A427b:          XDC                      ; 427b 2c
                LM                       ; 427c 16
                XDC                      ; 427d 2c
                ST                       ; 427e 17
                DS   (IS)                ; 427f 3c
                BF   $4,A427b            ; 4280 94 fa
                
                LISL 3                   ; 4282 6b
                LR   A,(IS)-             ; 4283 4e
                ADC                      ; 4284 8e
                DS   (IS)                ; 4285 3c
                BT   4,A4293             ; 4286 84 0c
                LIS  $1                  ; 4288 71
                XS   (IS)-               ; 4289 ee
                BF   $4,A428f            ; 428a 94 04
                LIS  $1                  ; 428c 71
                SL   4                   ; 428d 15
                ADC                      ; 428e 8e
A428f:          LR   A,(IS)-             ; 428f 4e
                LR   (IS),A              ; 4290 5c
                BF   $0,A427b            ; 4291 90 e9
                
A4293:          LISL 6                   ; 4293 6e
                LIS  $0                  ; 4294 70
                XS   (IS)-               ; 4295 ee
                BT   1,A429b             ; 4296 81 04
                DS   (IS)+               ; 4298 3d
                BT   4,A429c             ; 4299 84 02
A429b:          PK                       ; 429b 0c

A429c:          LIS  $f                  ; 429c 7f
                NS   (IS)-               ; 429d fe
                LR   $b,A                ; 429e 5b
                DCI  A4351               ; 429f 2a 43 51
                ADC                      ; 42a2 8e
                LM                       ; 42a3 16
                LR   (IS)+,A             ; 42a4 5d
                DS   $b                  ; 42a5 3b
                BT   1,A42aa             ; 42a6 81 03
                LIS  $f                  ; 42a8 7f
                LR   $b,A                ; 42a9 5b
A42aa:          LIS  $c                  ; 42aa 7c
                SL   4                   ; 42ab 15
                NS   (IS)                ; 42ac fc
                XS   $b                  ; 42ad eb
                LR   (IS),A              ; 42ae 5c
                LISL 7                   ; 42af 6f
                LI   $67                 ; 42b0 20 67
                ASD  (IS)                ; 42b2 dc
                CI   $59                 ; 42b3 25 59	;mins/hr
                BF   $2,A42bb            ; 42b5 92 05
A42b7:          LR   (IS),A              ; 42b7 5c
                JMP  A4326               ; 42b8 29 43 26
A42bb:          LIS  $0                  ; 42bb 70
                LR   (IS),A              ; 42bc 5c
                LISU 7                   ; 42bd 67
                LI   $67                 ; 42be 20 67
                ASD  (IS)                ; 42c0 dc
                CI   $59                 ; 42c1 25 59	;secs/min
                BT   2,A42b7             ; 42c3 82 f3
                LIS  $0                  ; 42c5 70
                LR   (IS)+,A             ; 42c6 5d
                LISU 2                   ; 42c7 62
                
                DCI  $0fd4               ; 42c8 2a 0f d4	;copy 6 bytes from 4110 to fd4 23 06 00 11 99 99
                XDC                      ; 42cb 2c
                DCI  A4110               ; 42cc 2a 41 10
                LIS  $6                  ; 42cf 76
                LR   (IS),A              ; 42d0 5c
A42d1:          LM                       ; 42d1 16
                XDC                      ; 42d2 2c
                ST                       ; 42d3 17
                XDC                      ; 42d4 2c
                DS   (IS)                ; 42d5 3c
                BF   $4,A42d1            ; 42d6 94 fa
                
                DCI  $0fef               ; 42d8 2a 0f ef
                LM                       ; 42db 16
                CI   $0f                 ; 42dc 25 0f		;convert to BCD
                BT   2,A42e4             ; 42de 82 05		;if > 15
                SL   4                   ; 42e0 15			;blank top nibble
                SR   4                   ; 42e1 14
                AI   $0a                 ; 42e2 24 0a		;and add 10 (so $17 becomes $11)
                
A42e4:          DCI  DAYSINMON           ; 42e4 2a 41 16
                ADC                      ; 42e7 8e
                LM                       ; 42e8 16
                DCI  $0fd6               ; 42e9 2a 0f d6
                ST                       ; 42ec 17
                DCI  $0fd4               ; 42ed 2a 0f d4
                XDC                      ; 42f0 2c
                DCI  $0fec               ; 42f1 2a 0f ec
                LIS  $6                  ; 42f4 76
                LR   (IS),A              ; 42f5 5c
A42f6:          LR   H,DC                ; 42f6 11
                LI   $67                 ; 42f7 20 67
                AMD                      ; 42f9 89
                XDC                      ; 42fa 2c
                CM                       ; 42fb 8d
                XDC                      ; 42fc 2c
                BT   2,A4307             ; 42fd 82 09
                LIS  $0                  ; 42ff 70
                LR   DC,H                ; 4300 10
                ST                       ; 4301 17
                DS   (IS)                ; 4302 3c
                BF   $4,A42f6            ; 4303 94 f2
                BF   $0,A431b            ; 4305 90 15
                
A4307:          LR   DC,H                ; 4307 10
                ST                       ; 4308 17
                LIS  $2                  ; 4309 72
                XS   (IS)                ; 430a ec
                BF   $4,A4314            ; 430b 94 08
                LR   DC,H                ; 430d 10
                LIS  $0                  ; 430e 70
                XM                       ; 430f 8c
                BF   $4,A431b            ; 4310 94 0a
                BF   $0,A4318            ; 4312 90 05
                
A4314:          LIS  $5                  ; 4314 75
                XS   (IS)                ; 4315 ec
                BF   $4,A431b            ; 4316 94 04
A4318:          DS   (IS)                ; 4318 3c
                BF   $0,A42f6            ; 4319 90 dc
                
A431b:          DCI  $0fee               ; 431b 2a 0f ee
                LR   H,DC                ; 431e 11
                LIS  $0                  ; 431f 70
                XM                       ; 4320 8c
                BF   $4,A4326            ; 4321 94 04
                LR   DC,H                ; 4323 10
                LIS  $1                  ; 4324 71
                ST                       ; 4325 17
A4326:          LISU 2                   ; 4326 62
                LISL 6                   ; 4327 6e
                LR   A,(IS)              ; 4328 4c
                SL   1                   ; 4329 13
                BT   1,A4350             ; 432a 81 25
                
                DCI  $0fec               ; 432c 2a 0f ec
                XDC                      ; 432f 2c
                DCI  $0ff4               ; 4330 2a 0f f4
                LISL 0                   ; 4333 68
                LIS  $6                  ; 4334 76
                LR   (IS),A              ; 4335 5c
A4336:          LM                       ; 4336 16
                XDC                      ; 4337 2c
                CM                       ; 4338 8d
                BF   $4,A4350            ; 4339 94 16
                XDC                      ; 433b 2c
                DS   (IS)                ; 433c 3c
                BF   $4,A4336            ; 433d 94 f8
                
                LISL 7                   ; 433f 6f
                DCI  $0ff2               ; 4340 2a 0f f2
                LR   A,(IS)              ; 4343 4c
                CM                       ; 4344 8d
                BF   $4,A4350            ; 4345 94 0a
                LISU 7                   ; 4347 67
                LR   A,(IS)+             ; 4348 4d
                LISU 2                   ; 4349 62
                CM                       ; 434a 8d
                BF   $4,A4350            ; 434b 94 04
                JMP  $22ef               ; 434d 29 22 ef
A4350:          PK                       ; 4350 0c

A4351:			db   $3b,$3c,$3c,$3c,$3c,$3c,$3b,$3c,$3c,$3c,$3c,$3b,$3c,$3c,$3c,$3c

READKBJOY:      LR   K,P                 ; 4361 08		;called from GETKEY
                LISU 2                   ; 4362 62
                LISL 0                   ; 4363 68
                LIS  $1                  ; 4364 71		;column strobe
                LR   (IS),A              ; 4365 5c
                SL   4                   ; 4366 15
                DCI  VIDEOMODE           ; 4367 2a 0f ea
                OM                       ; 436a 8b
                DCI  VID_COMMAND      ; 436b 2a 08 f7	;clear 9th column
                ST                       ; 436e 17
                LIS  $0                  ; 436f 70
                LR   $8,A                ; 4370 58
                OUTS 0                   ; 4371 b0		;keyboard columns/joystick pots
                DCI  $0fde               ; 4372 2a 0f de
                LIS  $f                  ; 4375 7f
                SL   4                   ; 4376 15
                NM                       ; 4377 8a
                OUTS 1                   ; 4378 b1		;keyboard rows/joystick buttons
                
CHKKEY:         LR   A,(IS)+             ; 4379 4d		;get keyboard column to strobe
                OUTS 0                   ; 437a b0		;set keyboard column hi
                NOP                      ; 437b 2b		;wait a bit
                NOP                      ; 437c 2b
                NOP                      ; 437d 2b
                INS  1                   ; 437e a1		;read keyboard rows
                NI   $0f                 ; 437f 21 0f	;mask off high bits (only 4 rows)
                BT   4,NOKEY             ; 4381 84 2d	;no keys down, branch
                
                LR   (IS),A              ; 4383 5c		;key down
A4384:          LR   A,(IS)              ; 4384 4c
                SR   1                   ; 4385 12
                LR   (IS),A              ; 4386 5c
                BT   4,A438e             ; 4387 84 06
                LIS  $9                  ; 4389 79
                AS   $8                  ; 438a c8
                LR   $8,A                ; 438b 58
                BF   $0,A4384            ; 438c 90 f7
                
A438e:          LISL 0                   ; 438e 68
A438f:          LIS  $1                  ; 438f 71
                AS   $8                  ; 4390 c8
                LR   $8,A                ; 4391 58
                LR   A,(IS)              ; 4392 4c
                SR   1                   ; 4393 12
                LR   (IS),A              ; 4394 5c
                BF   $4,A438f            ; 4395 94 f9
                
CHKKEYEXIT:     DCI  $0feb               ; 4397 2a 0f eb
                LR   H,DC                ; 439a 11
                LR   A,$8                ; 439b 48
                CM                       ; 439c 8d
                BT   4,A43a4             ; 439d 84 06
                LR   DC,H                ; 439f 10
                ST                       ; 43a0 17
                OI   $80                 ; 43a1 22 80
                LR   $8,A                ; 43a3 58
A43a4:          LR   J,W                 ; 43a4 1e
                DCI  $0fdd               ; 43a5 2a 0f dd
                LM                       ; 43a8 16
                OUTS 0                   ; 43a9 b0		;keyboard columns/joystick pots
                DI                       ; 43aa 1a
                LM                       ; 43ab 16
                OUTS 1                   ; 43ac b1		;keyboard rows/joystick buttons
                LR   W,J                 ; 43ad 1d
                PK                       ; 43ae 0c
                
NOKEY:          LISL 0                   ; 43af 68
                LR   A,(IS)              ; 43b0 4c		;next column
                SL   1                   ; 43b1 13
                LR   (IS),A              ; 43b2 5c
                BF   $4,CHKKEY           ; 43b3 94 c5
                
                DCI  VIDEOMODE           ; 43b5 2a 0f ea	;8 columns done using CPU I/O
                LM                       ; 43b8 16
                DCI  VID_COMMAND       ; 43b9 2a 08 f7	;9th using VLSI output
                ST                       ; 43bc 17		
                INS  1                   ; 43bd a1		;read keyboard rows
                NI   $0f                 ; 43be 21 0f	;mask off high bits (only 4 rows)
                LR   (IS),A              ; 43c0 5c
                BT   4,CHKKEYEXIT        ; 43c1 84 d5
A43c3:          LIS  $9                  ; 43c3 79
                AS   $8                  ; 43c4 c8
                LR   $8,A                ; 43c5 58
                LR   A,(IS)              ; 43c6 4c
                SR   1                   ; 43c7 12
                LR   (IS),A              ; 43c8 5c
                BF   $4,A43c3            ; 43c9 94 f9
                BF   $0,CHKKEYEXIT       ; 43cb 90 cb
                
COPYMEMTOMEM:   LR   K,P                 ; 43cd 08		copy (IS) bytes from DC1 to DC0
A43ce:          XDC                      ; 43ce 2c			ex: DCI a, XDC, DCI b, LIS 2, LR   (IS),A, PI COPYMEMTOMEM
                LM                       ; 43cf 16				copies 2 bytes from a to b
                XDC                      ; 43d0 2c
                ST                       ; 43d1 17
                DS   (IS)                ; 43d2 3c
                BF   $4,A43ce            ; 43d3 94 fa
                PK                       ; 43d5 0c

GETKEY:         LR   K,P                 ; 43d6 08			;gets a keypress or times out
                PI   PUSHK               ; 43d7 28 40 a9
A43da:          PI   READKBJOY           ; 43da 28 43 61
                BF   $4,A43f0            ; 43dd 94 12
                LIS  $0                  ; 43df 70
                XS   $8                  ; 43e0 e8
                DCI  $0fe3               ; 43e1 2a 0f e3
                BT   4,A4414             ; 43e4 84 2f
                LR   Q,DC                ; 43e6 0e
                LIS  $0                  ; 43e7 70
                XM                       ; 43e8 8c
                BF   $4,A4415            ; 43e9 94 2b
                LR   DC,Q                ; 43eb 0f
                LIS  $1                  ; 43ec 71
                ST                       ; 43ed 17
                LISL 4                   ; 43ee 6c
                LR   (IS),A              ; 43ef 5c
A43f0:          PI   A41c8               ; 43f0 28 41 c8
                LISL 4                   ; 43f3 6c
                DS   (IS)                ; 43f4 3c
                BF   $4,A43da            ; 43f5 94 e4
                LIS  $0                  ; 43f7 70
                XS   $8                  ; 43f8 e8
                LR   J,W                 ; 43f9 1e
                DCI  SHIFTSTATE          ; 43fa 2a 0f e2
                SL   1                   ; 43fd 13
                LR   $8,A                ; 43fe 58
                LIS  $0                  ; 43ff 70
                XM                       ; 4400 8c
                BF   $4,A4404            ; 4401 94 02
                DS   $8                  ; 4403 38
A4404:          DCI  KEYCMDS1            ; 4404 2a 44 f4
                LIS  $7                  ; 4407 77			;7 keys to check
                LR   (IS),A              ; 4408 5c
                LR   A,$8                ; 4409 48			;key that was hit
A440a:          CM                       ; 440a 8d			;see if one of our keys was hit
                BT   4,A4419             ; 440b 84 0d		;yes- call function in jump table
                DS   (IS)                ; 440d 3c			;no- check next key
                BF   $4,A440a            ; 440e 94 fb
A4410:          PI   POPK                ; 4410 28 40 bc	;none of our keys was hit
                PK                       ; 4413 0c
                
A4414:          ST                       ; 4414 17
A4415:          LIS  $0                  ; 4415 70
                LR   $8,A                ; 4416 58
                BF   $0,A43f0            ; 4417 90 d8
                
A4419:          DCI  JMPTBL1             ; 4419 2a 44 7f	;jump to function for that key
A441c:          DS   (IS)                ; 441c 3c			;note- functions in table are reversed
                LR   A,(IS)              ; 441d 4c			;	from keys in table
                SL   1                   ; 441e 13
                ADC                      ; 441f 8e
A4420:          LM                       ; 4420 16
                LR   QU,A                ; 4421 06
                LM                       ; 4422 16
                LR   QL,A                ; 4423 07
                LR   P0,Q                ; 4424 0d

EXITSPECIAL:
                PI   CLRSCREEN           ; 4425 28 41 d5	;special key hit - exit special mode
                BF   $0,A4410            ; 4428 90 e7
                
SPECIAL:        LR   K,P                 ; 442a 08			;special key hit - enter special mode
                PI   PUSHK               ; 442b 28 40 a9
                DCI  $0fda               ; 442e 2a 0f da
                LIS  $0                  ; 4431 70
                ST                       ; 4432 17
                PI   A45db               ; 4433 28 45 db
A4436:          PI   CLRSCREEN           ; 4436 28 41 d5
                DCI  CURSORPOS           ; 4439 2a 0f df
                LIS  $0                  ; 443c 70
                ST                       ; 443d 17
                LISU 2                   ; 443e 62
                LISL 4                   ; 443f 6c
                LIS  $3                  ; 4440 73
                SL   4                   ; 4441 15
                LR   (IS),A              ; 4442 5c
                DCI  SELKEYTEXT          ; 4443 2a 23 ef
                PI   PRINT               ; 4446 28 42 05
A4449:          LISL 4                   ; 4449 6c
                LIS  $0                  ; 444a 70
                LR   (IS),A              ; 444b 5c
                PI   GETKEY              ; 444c 28 43 d6	;get a key
                BT   4,A4449             ; 444f 84 f9
                BF   $1,A4449            ; 4451 91 f7
                DCI  KEYCMDS2            ; 4453 2a 44 fb
                LISL 4                   ; 4456 6c
                LIS  $6                  ; 4457 76
                LR   (IS),A              ; 4458 5c
                LR   A,$8                ; 4459 48
A445a:          CM                       ; 445a 8d
                BT   4,A4465             ; 445b 84 09
                DS   (IS)                ; 445d 3c
                BF   $4,A445a            ; 445e 94 fb
                PI   PRINTWRKEY          ; 4460 28 24 68	WRONG KEY!
                BF   $0,A4436            ; 4463 90 d2

A4465:          DCI  JMPTBL2             ; 4465 2a 44 8d
                BF   $0,A441c            ; 4468 90 b3

                DCI  SHIFTSTATE          ; 446a 2a 0f e2	SHIFT hit from main menu
                LR   Q,DC                ; 446d 0e
                LIS  $1                  ; 446e 71
                XM                       ; 446f 8c			;toggle shift state
                LR   DC,Q                ; 4470 0f
                ST                       ; 4471 17
                
                DCI  $0fc2               ; 4472 2a 0f c2
                LR   Q,DC                ; 4475 0e
                LIS  $e                  ; 4476 7e
                SL   4                   ; 4477 15
                XM                       ; 4478 8c
                LR   DC,Q                ; 4479 0f
                ST                       ; 447a 17
                LIS  $1                  ; 447b 71
                LR   (IS),A              ; 447c 5c
                BF   $0,A4415            ; 447d 90 97
           
           								;main menu items
JMPTBL1:                                ;jump table - reversed in order from key table
				db   $44,$6a			;SHIFT hit while shift down
				db   $44,$6a			;SHIFT hit while shift up
				db   $44,$99			;RESTART
				db   $24,$8d			;ALARM
				db   $45,$0d			;CLOCK
				db   $25,$f3			;COLOR
				db   $23,$42			;TEXT
				                
				                		;menu items after hitting special key
JMPTBL2:                                ;jump table - reversed in order from key table
				db   $44,$e4			;ERASE
				db   $44,$9e			;B - background color
				db   $44,$ac			;F - foreground color
				db   $44,$c2			;V - video mode?
				db   $44,$d1			;R - repeat mode?
				db   $44,$25			;SPECIAL - exit special mode
		
				DCI  $0fe6				 ; 4499				RESTART hit from main menu
                BF   $0,A4420            ; 449c 90 83

BACKGROUND:
                DCI  BKGCOLOR            ; 449e 2a 0f e9	B key hit - background color
                LR   Q,DC                ; 44a1 0e
                LIS  $1                  ; 44a2 71			;increment current color in RAM
                AM                       ; 44a3 88
                LR   DC,Q                ; 44a4 0f
                ST                       ; 44a5 17			;and write it back
                DCI  REG_BKGCOLOR        ; 44a6 2a 08 f5
A44a9:          ST                       ; 44a9 17			;and write it to register
A44aa:          BF   $0,A4436            ; 44aa 90 8b

FOREGROUND:
                DCI  $0fba               ; 44ac 2a 0f ba	F key hit - foreground color
                LIS  $8                  ; 44af 78			;8 bytes
                LR   (IS),A              ; 44b0 5c
A44b1:          LR   Q,DC                ; 44b1 0e
                LIS  $2                  ; 44b2 72
                SL   4                   ; 44b3 15
                AM                       ; 44b4 88			;add $20 to current color
                LR   DC,Q                ; 44b5 0f
                ST                       ; 44b6 17			;and write it back
                DS   (IS)                ; 44b7 3c
                BF   $4,A44b1            ; 44b8 94 f8
                
                NI   $e0                 ; 44ba 21 e0
                DCI  $0fe8               ; 44bc 2a 0f e8
                ST                       ; 44bf 17
                BF   $0,A44aa            ; 44c0 90 e9
               
                DCI  VIDEOMODE           ; 44c2 2a 0f ea	V key hit - video mode?
                LR   Q,DC                ; 44c5 0e
                LIS  $2                  ; 44c6 72
                SL   4                   ; 44c7 15
                XM                       ; 44c8 8c
                LR   DC,Q                ; 44c9 0f
                ST                       ; 44ca 17
                DCI  VID_COMMAND       ; 44cb 2a 08 f7
                ST                       ; 44ce 17
                BF   $0,A44aa            ; 44cf 90 da
                
REPEAT:
                DCI  $0fb1               ; 44d1 2a 0f b1	R key hit - repeat mode?
                PI   FILLMEM             ; 44d4 28 44 eb
                DCI  $0fba               ; 44d7 2a 0f ba
                PI   FILLMEM             ; 44da 28 44 eb
                DCI  $0fda               ; 44dd 2a 0f da
                LIS  $1                  ; 44e0 71
                ST                       ; 44e1 17
                BF   $0,A44aa            ; 44e2 90 c7

ERASE:
                DCI  $0fe0               ; 44e4 2a 0f e0	ERASE key hit
                LIS  $0                  ; 44e7 70
                ST                       ; 44e8 17
                BF   $0,A44aa            ; 44e9 90 c0
                
FILLMEM:        LR   K,P                 ; 44eb 08			copies byte at DC0 to DC0+1, DC0+2, ... DC0+6
                LIS  $6                  ; 44ec 76
                LR   (IS),A              ; 44ed 5c
                LM                       ; 44ee 16
A44ef:          ST                       ; 44ef 17
                DS   (IS)                ; 44f0 3c
                BF   $4,A44ef            ; 44f1 94 fd
                PK                       ; 44f3 0c
                
           								;main menu items
KEYCMDS1:		db   $48,$46,$44,$42,$3e,$3b,$3c	;<TEXT><COLOR><CLOCK><ALARM><RESTART><SHIFT><SHIFT>

           								;keys after hitting special key
KEYCMDS2:		db   $41,$09,$2f,$1d,$2d,$3d		;<SPECIAL>RVFB<ERASE>
                
A4501:          LR   K,P                 ; 4501 08
                DCI  $0fe5               ; 4502 2a 0f e5
                LM                       ; 4505 16
A4506:          DCI  $08fb               ; 4506 2a 08 fb
                CM                       ; 4509 8d			;so we can read from VLSI regs???
                BF   $2,A4506            ; 450a 92 fb
                PK                       ; 450c 0c

SETCLOCK:
                DCI  $0fe6               ; 450d 2a 0f e6	CLOCK hit from main menu
                LI   $45                 ; 4510 20 45
                ST                       ; 4512 17
                LI   $16                 ; 4513 20 16
                ST                       ; 4515 17
                LIS  $0                  ; 4516 70
                LR   $3,A                ; 4517 53
                PI   SETUPSTACK          ; 4518 28 40 d0
                PI   A45db               ; 451b 28 45 db
                DCI  $0fe1               ; 451e 2a 0f e1
                LI   $aa                 ; 4521 20 aa
                XM                       ; 4523 8c
                BF   $4,SETTIME          ; 4524 94 27
                LISL 6                   ; 4526 6e
                XS   (IS)                ; 4527 ec
                LISL 0                   ; 4528 68
                BT   1,SETTIME           ; 4529 81 22
A452b:          PI   CLRSCREEN           ; 452b 28 41 d5
A452e:          DCI  $0fec               ; 452e 2a 0f ec
                PI   A413f               ; 4531 28 41 3f
                LISL 4                   ; 4534 6c
                LIS  $a                  ; 4535 7a
                LR   (IS),A              ; 4536 5c
                PI   GETKEY              ; 4537 28 43 d6	;get a key
                BT   4,A452e             ; 453a 84 f3
                BF   $1,A452e            ; 453c 91 f1
                LR   A,$8                ; 453e 48
                CI   $21                 ; 453f 25 21		;keycode for S - set clock while showing time
                BT   4,SETTIME           ; 4541 84 0a
                CI   $41                 ; 4543 25 41		;keycode for SPECIAL
                BF   $4,A452e            ; 4545 94 e8
                PI   SPECIAL             ; 4547 28 44 2a
                BF   $0,A452e            ; 454a 90 e3
                
SETTIME:        LI   $7c                 ; 454c 20 7c
                LR   $8,A                ; 454e 58
                PI   $24f8               ; 454f 28 24 f8
                DCI  $0fcc               ; 4552 2a 0f cc
                LISL 7                   ; 4555 6f
                LM                       ; 4556 16
                LR   (IS),A              ; 4557 5c
                LISU 7                   ; 4558 67
                LM                       ; 4559 16
                LR   (IS)+,A             ; 455a 5d
                LISU 2                   ; 455b 62
                PI   CLRSCREEN           ; 455c 28 41 d5
                DCI  $0fec               ; 455f 2a 0f ec
                LR   H,DC                ; 4562 11
                PI   A46aa               ; 4563 28 46 aa
                LR   DC,H                ; 4566 10
                PI   A413f               ; 4567 28 41 3f
                DCI  $0fe1               ; 456a 2a 0f e1
                LI   $aa                 ; 456d 20 aa
                ST                       ; 456f 17
                LISL 4                   ; 4570 6c
                LI   $78                 ; 4571 20 78
                LR   (IS),A              ; 4573 5c
                PI   GETKEY              ; 4574 28 43 d6	;get a key
                BT   4,A4582             ; 4577 84 0a
                LR   A,$8                ; 4579 48
                CI   $1b                 ; 457a 25 1b	KEY G
                BT   4,A45a3             ; 457c 84 26
                CI   $1c                 ; 457e 25 1c	KEY -
                BT   4,A45a3             ; 4580 84 22
A4582:          DCI  CURSORPOS           ; 4582 2a 0f df
                LIS  $0                  ; 4585 70
                ST                       ; 4586 17
                DCI  PUSHGTEXT           ; 4587 2a 47 70
                LISL 4                   ; 458a 6c
                LIS  $1                  ; 458b 71
                SL   4                   ; 458c 15
                LR   (IS),A              ; 458d 5c
                PI   PRINT               ; 458e 28 42 05
A4591:          LISL 4                   ; 4591 6c
                LIS  $f                  ; 4592 7f
                SL   4                   ; 4593 15
                LR   (IS),A              ; 4594 5c
                PI   GETKEY              ; 4595 28 43 d6	;get a key
                BT   4,A4591             ; 4598 84 f8
                LR   A,$8                ; 459a 48
                CI   $1b                 ; 459b 25 1b	KEY G
                BT   4,A45a3             ; 459d 84 05
                CI   $1c                 ; 459f 25 1c	KEY -
                BF   $4,A4591            ; 45a1 94 ef
A45a3:          LISL 5                   ; 45a3 6d
                LI   $3c                 ; 45a4 20 3c
                LR   (IS)+,A             ; 45a6 5d
                LIS  $4                  ; 45a7 74
                SL   4                   ; 45a8 15
                NS   (IS)                ; 45a9 fc
                OI   $80                 ; 45aa 22 80
                LR   (IS),A              ; 45ac 5c
                JMP  A452b               ; 45ad 29 45 2b

                LR   K,P                 ; 45b0 08			;called from res2
                DCI  CURSORPOS           ; 45b1 2a 0f df
                LM                       ; 45b4 16
                LR   $8,A                ; 45b5 58
                SL   4                   ; 45b6 15
                SR   1                   ; 45b7 12
                AI   $20                 ; 45b8 24 20
                DCI  $0847               ; 45ba 2a 08 47
                ST                       ; 45bd 17
                LR   A,$8                ; 45be 48
                SR   4                   ; 45bf 14
                LR   $8,A                ; 45c0 58
                DCI  VIDEOMODE           ; 45c1 2a 0f ea
                LIS  $2                  ; 45c4 72
                SL   4                   ; 45c5 15
                NM                       ; 45c6 8a
                BT   4,A45cc             ; 45c7 84 04
                LIS  $7                  ; 45c9 77
                AS   $8                  ; 45ca c8
                LR   $8,A                ; 45cb 58

A45cc:          DCI  A4780               ; 45cc 2a 47 80
                LR   A,$8                ; 45cf 48
                ADC                      ; 45d0 8e
                LM                       ; 45d1 16
                DCI  $0857               ; 45d2 2a 08 57
                ST                       ; 45d5 17
                DCI  $0867               ; 45d6 2a 08 67
                ST                       ; 45d9 17
                PK                       ; 45da 0c
                
A45db:          LR   K,P                 ; 45db 08
                PI   PUSHK               ; 45dc 28 40 a9
                PI   A4762               ; 45df 28 47 62
                
                DCI  A463e               ; 45e2 2a 46 3e
                XDC                      ; 45e5 2c
                DCI  $0ffa               ; 45e6 2a 0f fa
                LIS  $4                  ; 45e9 74
                LISU 2                   ; 45ea 62
                LISL 0                   ; 45eb 68
                LR   (IS),A              ; 45ec 5c
                PI   COPYMEMTOMEM        ; 45ed 28 43 cd 	copy 4 bytes from 463e to ffa $09,$00,$46,$47 (guess - 9 sprites, list B, info at $4647)
                
                PI   CLRSCREEN           ; 45f0 28 41 d5
                LIS  $5                  ; 45f3 75
                LR   (IS),A              ; 45f4 5c
                DCI  A4642               ; 45f5 2a 46 42
                XDC                      ; 45f8 2c
                DCI  $0ffb               ; 45f9 2a 0f fb
                PI   COPYMEMTOMEM        ; 45fc 28 43 cd	copy 5 bytes from 4642 to ffb $01,$0f,$b1,$0f,$b1 (guess - list A, info at $FB1)
                
                LI   $12                 ; 45ff 20 12
                LR   (IS),A              ; 4601 5c
                DCI  $0fb1               ; 4602 2a 0f b1
                PI   COPYMEMTOMEM        ; 4605 28 43 cd	copy $12 bytes from 4647 to fb1
                
                XDC                      ; 4608 2c
                LIS  $9                  ; 4609 79
                ADC                      ; 460a 8e
                LR   (IS),A              ; 460b 5c
                XDC                      ; 460c 2c
                PI   COPYMEMTOMEM        ; 460d 28 43 cd	copy 9 bytes from 4659 to fc3
                
                DCI  $0fe8               ; 4610 2a 0f e8
                LM                       ; 4613 16
                LR   $8,A                ; 4614 58
A4615:          DCI  $0fba               ; 4615 2a 0f ba
                LIS  $8                  ; 4618 78
                LR   (IS),A              ; 4619 5c
A461a:          LI   $1f                 ; 461a 20 1f
                LR   H,DC                ; 461c 11
                NM                       ; 461d 8a
                XS   $8                  ; 461e e8
                LR   DC,H                ; 461f 10
                ST                       ; 4620 17
                DS   (IS)                ; 4621 3c
                BF   $4,A461a            ; 4622 94 f7
                
                DCI  SHIFTSTATE          ; 4624 2a 0f e2
                LIS  $0                  ; 4627 70
                ST                       ; 4628 17
                
                DCI  $0fda               ; 4629 2a 0f da
                XM                       ; 462c 8c
                BT   4,A463b             ; 462d 84 0d
                DCI  $0fb1               ; 462f 2a 0f b1
                PI   FILLMEM             ; 4632 28 44 eb
                DCI  $0fba               ; 4635 2a 0f ba
                PI   FILLMEM             ; 4638 28 44 eb
A463b:          JMP  A41cc               ; 463b 29 41 cc

A463e:			db   $09,$00,$46,$47					;memcopied to ffa
			;note         ^^^^^^

A4642:			db   $01,$0f,$b1,$0f,$b1				;memcopied to ffb
     
     			;$4647
     			db   $2f,$9f,$0f,$7f,$ef,$5f,$cf,$00,$00,$ec,$ec,$ed,$ed,$ed,$ee,$ee,$e0,$00	;memcopied to fb1
     			
     			db   $70,$70,$70,$70,$70,$70,$70,$61,$01	;memcopied to fc3
                                
                db   $07,$07,$07,$07,$07,$07,$07,$01,$08	;memcopied to fc3
                
                db   $20,$20,$20,$20,$20,$20,$20,$20,$90,$30
                            
                db   $46,$5c,$70,$86,$9c,$b4,$40,$d0
                db   $00,$01,$02,$03,$04,$05,$06,$87,$08

; $4686: Copy bit-reversed bytes with adjustable spacing.
; No internal RES1 caller is identified, but vbdemo.asm calls this entry
; at $13A4 and $13B1; it is not globally unused.
; DC0 = source; DC1 = destination; R18 = byte count (nonzero).
; R16 = extra destination increment after ST; destination step = 1 + R16.
; R17 = extra source increment after LM; source step = 1 + R17.
; Uses R6-R8 as temporaries; K holds the return address. For example,
; $01 becomes $80 and $00 stays $00. Pointer steps include the automatic
; increments performed by LM and ST.
                LR   K,P                 ; 4686 08
                LISU 2                   ; 4687 62
A4688:          LISL 0                   ; 4688 68
                LM                       ; 4689 16
                LR   $8,A                ; 468a 58
                LIS  $1                  ; 468b 71
                LR   $7,A                ; 468c 57
                LIS  $0                  ; 468d 70
                LR   $6,A                ; 468e 56
A468f:          LIS  $0                  ; 468f 70
                XS   $8                  ; 4690 e8
                BT   1,A4696             ; 4691 81 04
                LR   A,$6                ; 4693 46
                XS   $7                  ; 4694 e7
                LR   $6,A                ; 4695 56
A4696:          LR   A,$8                ; 4696 48
                SL   1                   ; 4697 13
                LR   $8,A                ; 4698 58
                LR   A,$7                ; 4699 47
                SL   1                   ; 469a 13
                LR   $7,A                ; 469b 57
                BF   $4,A468f            ; 469c 94 f2
                XDC                      ; 469e 2c
                LR   A,$6                ; 469f 46
                ST                       ; 46a0 17
                LR   A,(IS)+             ; 46a1 4d
                ADC                      ; 46a2 8e
                XDC                      ; 46a3 2c
                LR   A,(IS)+             ; 46a4 4d
                ADC                      ; 46a5 8e
                DS   (IS)                ; 46a6 3c
                BF   $4,A4688            ; 46a7 94 e0
                PK                       ; 46a9 0c

A46aa:          LR   K,P                 ; 46aa 08
                PI   PUSHK               ; 46ab 28 40 a9
                XDC                      ; 46ae 2c
                DCI  $0fcf               ; 46af 2a 0f cf
                LI   $ff                 ; 46b2 20 ff
                AMD                      ; 46b4 89
                DCI  $0fcf               ; 46b5 2a 0f cf
                ST                       ; 46b8 17
                LM                       ; 46b9 16
                LI   $ff                 ; 46ba 20 ff
                AMD                      ; 46bc 89
                DCI  $0fd1               ; 46bd 2a 0f d1
                ST                       ; 46c0 17
                LIS  $8                  ; 46c1 78
                LR   (IS),A              ; 46c2 5c
                DCI  $0fcc               ; 46c3 2a 0f cc
                LIS  $0                  ; 46c6 70
                XS   $3                  ; 46c7 e3
                BF   $4,A46ce            ; 46c8 94 05
                LIS  $2                  ; 46ca 72
                ADC                      ; 46cb 8e
                LIS  $6                  ; 46cc 76
                LR   (IS),A              ; 46cd 5c
A46ce:          XDC                      ; 46ce 2c
                PI   COPYMEMTOMEM        ; 46cf 28 43 cd	copy 6 bytes from
                PI   POPK                ; 46d2 28 40 bc
                PK                       ; 46d5 0c

                DI                       ; 46d6 1a			;how does execution get here?
                LI   $46                 ; 46d7 20 46
                OUTS 12                  ; 46d9 bc			;3853 interrupt addr vector hi
                LI   $f7                 ; 46da 20 f7
                OUTS 13                  ; 46dc bd			;3853 interrupt addr vector lo
                DCI  VIDEOMODE           ; 46dd 2a 0f ea
                LIS  $8                  ; 46e0 78
                OM                       ; 46e1 8b
                NI   $fd                 ; 46e2 21 fd
                DCI  VIDEOMODE           ; 46e4 2a 0f ea
                ST                       ; 46e7 17
                LISU 4                   ; 46e8 64
                LISL 6                   ; 46e9 6e
                DCI  $08fa               ; 46ea 2a 08 fa
                LM                       ; 46ed 16
                NI   $80                 ; 46ee 21 80
                SR   4                   ; 46f0 14
                LR   (IS)-,A             ; 46f1 5e
                LIS  $2                  ; 46f2 72
                AM                       ; 46f3 88
                LR   (IS),A              ; 46f4 5c
                BF   $0,A46f8            ; 46f5 90 02
                
                ;46f7 = 0100 0110 1111 0111 bit 7=1 must be 1 for ext int
INT3853:        LR   $0,A                ; 46f7 50		;3853 interrupt points here (from $46d6 above)
A46f8:          LR   J,W                 ; 46f8 1e
                LR   A,IS                ; 46f9 0a
                LISU 4                   ; 46fa 64
                LISL 0                   ; 46fb 68
                LR   (IS)+,A             ; 46fc 5d
                LR   A,QU                ; 46fd 02
                LR   (IS)+,A             ; 46fe 5d
                LR   A,QL                ; 46ff 03
                LR   (IS)+,A             ; 4700 5d
                LR   Q,DC                ; 4701 0e
                LIS  $8                  ; 4702 78
                SL   4                   ; 4703 15
                XS   (IS)                ; 4704 ec
                LR   (IS),A              ; 4705 5c
                BT   1,A4709             ; 4706 81 02
                LIS  $0                  ; 4708 70
A4709:          OUTS 0                   ; 4709 b0		;keyboard columns/joystick pots
                DCI  $0fde               ; 470a 2a 0f de
                LIS  $1                  ; 470d 71
                SL   4                   ; 470e 15
                XM                       ; 470f 8c
                OUTS 1                   ; 4710 b1		;keyboard rows/joystick buttons
                XI   $10                 ; 4711 23 10
                OUTS 1                   ; 4713 b1		;keyboard rows/joystick buttons
                LR   A,(IS)              ; 4714 4c
                SL   4                   ; 4715 15
                AS   (IS)+               ; 4716 cd
                LR   A,(IS)+             ; 4717 4d
                BF   $2,A471b            ; 4718 92 02
                INC                      ; 471a 1f
A471b:          AS   (IS)                ; 471b cc
                LR   (IS)+,A             ; 471c 5d
                LR   A,(IS)              ; 471d 4c
                LNK                      ; 471e 19
                LR   (IS)-,A             ; 471f 5e
                NI   $01                 ; 4720 21 01
                BT   4,A4734             ; 4722 84 11
                LR   A,(IS)              ; 4724 4c
                CI   $06                 ; 4725 25 06
                BT   2,A4734             ; 4727 82 0c
                AI   $fa                 ; 4729 24 fa
                LR   (IS)+,A             ; 472b 5d
                LIS  $8                  ; 472c 78
                NS   (IS)                ; 472d fc
                XI   $08                 ; 472e 23 08
                LR   (IS)-,A             ; 4730 5e
                BT   4,A4734             ; 4731 84 02
                DS   (IS)                ; 4733 3c
A4734:          DCI  $08f0               ; 4734 2a 08 f0
                LR   A,(IS)+             ; 4737 4d
                ST                       ; 4738 17
                LR   A,(IS)+             ; 4739 4d
                SL   4                   ; 473a 15
                SR   1                   ; 473b 12
                SL   4                   ; 473c 15
                LR   (IS),A              ; 473d 5c
                DCI  VIDEOMODE           ; 473e 2a 0f ea
                LM                       ; 4741 16
                NI   $7f                 ; 4742 21 7f
                XS   (IS)                ; 4744 ec
                DCI  VID_COMMAND       ; 4745 2a 08 f7
                ST                       ; 4748 17
                DCI  VIDEOMODE           ; 4749 2a 0f ea
                ST                       ; 474c 17
                LI   $f2                 ; 474d 20 f2
                ADC                      ; 474f 8e
                LM                       ; 4750 16
                OUTS 0                   ; 4751 b0		;keyboard columns/joystick pots
                LISL 2                   ; 4752 6a
                LR   DC,Q                ; 4753 0f
                LR   A,(IS)-             ; 4754 4e
                LR   QL,A                ; 4755 07
                LR   A,(IS)-             ; 4756 4e
                LR   QU,A                ; 4757 06
                LR   A,(IS)              ; 4758 4c
                LR   IS,A                ; 4759 0b
                LIS  $1                  ; 475a 71		;enable external int, disable timer int
                OUTS 14                  ; 475b be		;3853 interrupt control
                SL   4                   ; 475c 15
                XS   $9                  ; 475d e9
                LR   $9,A                ; 475e 59
                LR   A,$0                ; 475f 40
                LR   W,J                 ; 4760 1d
                POP                      ; 4761 1c
                
A4762:          LR   K,P                 ; 4762 08
                DCI  $0850               ; 4763 2a 08 50
                LIS  $4                  ; 4766 74
                SL   4                   ; 4767 15
                LR   $8,A                ; 4768 58
                LI   $ff                 ; 4769 20 ff
A476b:          ST                       ; 476b 17
                DS   $8                  ; 476c 38
                BF   $4,A476b            ; 476d 94 fd
                PK                       ; 476f 0c

PUSHGTEXT:		;PUSH G TO START
                db   $25,$03,$21,$19,$00,$1B,$00,$07,$13,$00,$21,$07,$11,$09,$07,$00
                                
A4780:			db   $38,$4e,$64,$78,$8e,$a4,$bc,$40,$56,$6c,$80,$96,$ac,$c4
                
A478e:          db   $aa,$f5,$40,$00,$e0,$04,$64		;memcopied to fe4
                
                LR   K,P                 ; 4795 08
                DCI  $0fdb               ; 4796 2a 0f db
                LR   Q,DC                ; 4799 0e
                LM                       ; 479a 16
                LR   $b,A                ; 479b 5b
                LM                       ; 479c 16
                LR   $a,A                ; 479d 5a
                SL   4                   ; 479e 15
                LR   $8,A                ; 479f 58
                LR   A,$b                ; 47a0 4b
                SR   4                   ; 47a1 14
                XS   $8                  ; 47a2 e8
                LR   $8,A                ; 47a3 58
                LR   A,$b                ; 47a4 4b
                SL   4                   ; 47a5 15
                INC                      ; 47a6 1f
                AS   $b                  ; 47a7 cb
                LR   DC,Q                ; 47a8 0f
                ST                       ; 47a9 17
                LR   A,$a                ; 47aa 4a
                LNK                      ; 47ab 19
                AS   $8                  ; 47ac c8
                ST                       ; 47ad 17
                PK                       ; 47ae 0c
                
                ; BOOT MENU TEXT:
                
                ;VIDEO BRAIN TM
                ;  CHOOSE KEY:
                ;TEXT COLOR CLOCK
                ;   ALARM -OR-
                ;ENTER CARTRIDGE
                
MENUTEXT:
				db   $2F,$01,$1F,$0B,$13,$00,$2D,$09,$11,$01,$2B,$00,$07,$29,$00,$00
				db   $00,$00,$31,$19,$13,$13,$21,$0B,$00,$15,$0B,$05,$2A,$00,$00,$00
				db   $07,$0B,$33,$07,$00,$31,$13,$27,$13,$09,$00,$31,$27,$13,$31,$15
				db   $00,$00,$00,$11,$27,$11,$09,$29,$00,$1C,$13,$09,$1C,$00,$00,$00
				db   $0B,$2B,$07,$0B,$09,$00,$31,$11,$09,$07,$09,$01,$1F,$1B,$0B
				db   $00,$00
				