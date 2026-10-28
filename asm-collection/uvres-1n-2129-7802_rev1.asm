;RES1 

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010
;further comments by Kurt WOloch - Kurt_Woloch@hotmail.com
;May - June 2012

org $4000

;VLSI registers	$0800-$08FF
REG_BKGCOLOR:	equ $08F5
REG_VIDEOMODE:	equ $08F7

;RAM $0C00-$0FFF
RAMSTART:		equ $0C00	;RAM from $0C00 to $0FFF
FIRSTCHAR:		equ $0C2F	;display buffer $0C2F to $0F3E

TXTBUF: 		equ $0F3F	;TEXT editor buffer - 7x16=112 bytes
CURSORPOS:		equ $0FDF       ;cursor position; $xy where x = line no. and y = column
SHIFTSTATE:		equ $0FE2       ;state of shift key
WARMBOOTFLAG:	equ $0FE4	;set to $AA to indicate warm boot
BKGCOLOR:		equ	$0FE9   ;background color
VIDEOMODE:		equ $0FEA       ;shadow register for $08F7 (command register)

REFRESHDATA:            equ $0FFA       ;pointers to data where RAM addresses, and heights of segments get refreshed
;CARTS $1000-$1FFF
CARTSTART:		equ $1000	;where carts appear in memory
CARTBKGCOLOR:	equ $1002	;set when name of cart printed
CARTNAME:		equ $1003	;the name of the cart
CARTCODE:		equ $1012	;jump here to run the cart

;RES2 $2000-$27FF
FONT:			equ $2010	;7 bytes per character
PRINTWRKEY:		equ $2468
MONTEXT:		equ $2437
JANTEXT:		equ $245b
SELKEYTEXT:		equ $23EF

;In the CPU itself, the following registers are reserved for the following purposes:
;R16 through R19: used during the video refresh routine, free otherwise
;R20: contains number of characters to print for PRINT subroutine, free otherwise
;R21: contains number of frames before clock counts up by a second
;R22: contains running number of seconds used to index table at $4351
;R23: contains minutes of the clock
;R24: MSB of year on clock
;R25: LSB of year on clock
;R26: month on clock
;R27: day of month on clock
;R29: hour on clock
;R30: minute on clock
;R31: second on clock
;R32 through R34: used as temporary storage when sound gets output
;R35 through R39: used to control sound output when outputting sound, free to use otherwise
;R60: stack register for stack that stores return addresses if nested subroutine calls are needed
;R61: temporarily stores ISAR while return addresses get pushed and popped on / from stack

;The following section is the start of execution on power up.
;First the status register is saved into register J, then the setupstack routine gets called

                DI                       ; 4000 1a		reset jumps here (actually $0000)
                LR   J,W                 ; 4001 1e              load status register into register J (09)
                PI   SETUPSTACK          ; 4002 28 40 d0        call setupstack routine (Load $3b into register 60 and set ISAR to 16)

;Now we check the warm boot flag. If it's $AA, the machine is warm booted and we don't clear memory.

                DCI  WARMBOOTFLAG        ; 4005 2a 0f e4	load address of warm boot flag into dc0
                LR   Q,DC                ; 4008 0e              copy data counter into reg. 14/15 (Q)
                LI   $aa		 ; 4009 20 aa		load $AA into accumulator
                CM                       ; 400b 8d              compare to location given at data counter
                BT   4,WARMBOOT          ; 400c 84 12		if it's $AA, don't clear memory

;The machine hasn't been warm booted, so let's clear memory. To do this, we set each RAM cell of $C00 to $FFF to $00 in a loop.
;The loop uses registers $a/$b as a counter to keep track of how many cells still have to be cleared.
;DC0 gets used as the pointer to the memory cell being cleared.
                
                LIS  $4                  ; 400e 74		RAM is 0x0400 bytes long (1K) - accumulator is now $04
                LR   $a,A                ; 400f 5a              register a is now $04 (contents of accumulator)
                LIS  $0                  ; 4010 70              accumulator is now $00
                LR   $b,A                ; 4011 5b              register b is now $00 (contents of accumulator)
                DCI  RAMSTART            ; 4012 2a 0c 00	
CLRRAM:         ST                       ; 4015 17
                DS   $b                  ; 4016 3b              decrement b and loop back if not zero
                BF   $4,CLRRAM           ; 4017 94 fd
                DS   $a                  ; 4019 3a              decrement a and loop back if not zero
                BF   $4,CLRRAM           ; 401a 94 fa
                LISL 6                   ; 401c 6e              clearing RAM should be complete here; load ISAR to x6 (should now be 22)
                LR   (IS),A              ; 401d 5c              and load contents of A (which should be zero) into register 22
                LISL 0                   ; 401e 68              set ISAR back to 16
                
WARMBOOT:       DCI  A478e               ; 401f 2a 47 8e        Load address $478e into DC0
                XDC                      ; 4022 2c              swap DC0 and DC1
                LR   DC,Q                ; 4023 0f              copy contents of Q-register into Data counter (should contain warmbootflag)
                LIS  $7                  ; 4024 77              load $07 into accumulator
                LR   (IS),A              ; 4025 5c              load $07 into register 16 (which should be pointed to by ISAR)
                PI   COPYMEMTOMEM        ; 4026 28 43 cd	;copy 7 bytes from 478e to fe4 (sets warm boot flag)
                PI   A45db               ; 4029 28 45 db        ;lots of initialisation
                PI   A41c8               ; 402c 28 41 c8        ;wait for scanline, call clock routine
                
                DCI  $08f2               ; 402f 2a 08 f2
                LIS  $0                  ; 4032 70
                ST                       ; 4033 17              ;clear $08f2 (Final modifier register)
                
                DCI  REG_BKGCOLOR        ; 4034 2a 08 f5
                LIS  $4                  ; 4037 74
                ST                       ; 4038 17              ;set Background color register ($08f5) to $04 (blue at intensity 0)
                
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
                BF   $0,NOCART           ; 4070 90 d7           ;jump back to NOCART loop
                
CART:           PI   CLRSCREEN           ; 4072 28 41 d5	;cart inserted- show TM, cart name
                DCI  MENUTEXT            ; 4075 2a 47 af
                LI   $10                 ; 4078 20 10		;print VIDEO BRAIN TM (16 bytes)
                LISL 4                   ; 407a 6c
                LR   (IS),A              ; 407b 5c
                PI   PRINT               ; 407c 28 42 05
                DCI  CARTBKGCOLOR        ; 407f 2a 10 02
                LM                       ; 4082 16
                XDC                      ; 4083 2c
                DCI  REG_BKGCOLOR        ; 4084 2a 08 f5	;set background color
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

;--------------------------------------------------------
;PUSHK subroutine; Push K onto stack
;Isar -> A -> Reg. 61 (save ISAR)
;Reg. 60 -> A -> ISAR
;K -> A -> (ISAR) (16-bit op.)
;Dec. R60 by two
;Reg. 61 -> A -> Isar (restore ISAR)

;So, what this does is:
;- Store the contents of K (16-bit) into the register number given by Reg. 60
;- decrement Reg. 60 by two

;For example, if you store 35 into register 60, and $BFF0 into K, and then call PUSHK,
;$BFF0 gets stored into registers 35 and 34, and register 60 gets decremented to 33.

;Subroutine parameters:
;- R60... contains the register number to be written to and gets decremented by two
;- K... contains the 16-bit value to be written to the two registers given by R60

;Trashes: A, W, Reg. 61
 
PUSHK:          DI                       ; 40a9 1a             disable interrupts
                LR   A,IS                ; 40aa 0a             copy ISAR to A
                LISU 7                   ; 40ab 67             set ISAR window to reg. 61
                LISL 5                   ; 40ac 6d             
                LR   (IS)-,A             ; 40ad 5e             store A content in reg. 61 and decrement ISAR to 60
A40ae:          LR   A,(IS)              ; 40ae 4c             load contents of reg. 60 to A
                LR   IS,A                ; 40af 0b             store A into ISAR
                LR   A,KL                ; 40b0 01             set A to content of scratchpad register 13 (KL)
                LR   (IS)-,A             ; 40b1 5e             store A content in given register and decrement by one
                LR   A,KU                ; 40b2 00             set A to content of scratchpad register 12 (KU)
                LR   (IS),A              ; 40b3 5c             store A content in given register
                LISU 7                   ; 40b4 67             set ISAR window to reg. 60
                LISL 4                   ; 40b5 6c
                DS   (IS)                ; 40b6 3c             decrement scratchpad content (should be reg. 60)
                DS   (IS)+               ; 40b7 3d             decrement scratchpad content (reg. 60) again and increment ISAR
                LR   A,(IS)              ; 40b8 4c             load A from reg. 61
                LR   IS,A                ; 40b9 0b             copy into ISAR
                LR   W,J                 ; 40ba 1d             load status register from scratchpad reg. 9
                POP                      ; 40bb 1c             return

;--------------------------------------------------------
;POPK subroutine; Pop K from Stack
;Isar -> A -> Reg. 61 (save ISAR)
;Reg. 60 -> A -> increment -> ISAR
;(ISAR) -> A -> K (16-bit op.)
;Isar -> A -> R60
;Reg. 61 -> A -> Isar (restore ISAR)

;So, what this does is:
;- Store the contents of the register number given by Reg. 60 into K (16-bit)
;- increment Reg. 60 by two

;For example, if you store 33 into register 60, and registers 35 and 34 contain $BFF0, and POPK gets called,
;$BFF0 gets stored into the K register, and register 60 gets incremented to 33.

;Subroutine parameters:
;- R60... contains the register number to be written to and gets incremented by two

;Return value:
;- K... contains the 16-bit value read from the two registers given by R60

;Trashes: A, W, Reg. 61
                
POPK:           DI                       ; 40bc 1a             disable interrupts
                LR   A,IS                ; 40bd 0a             copy ISAR to A
                LISU 7                   ; 40be 67             set ISAR window to reg. 61
                LISL 5                   ; 40bf 6d             
                LR   (IS)-,A             ; 40c0 5e             store A content in reg. 61 and decrement ISAR to 60 
                LR   A,(IS)              ; 40c1 4c             load contents of reg. 60 to A 
                INC                      ; 40c2 1f             increment A
                LR   IS,A                ; 40c3 0b             store incremented A into ISAR
                LR   A,(IS)+             ; 40c4 4d             load A from ISAR reference and increment ISAR
                LR   KU,A                ; 40c5 04             store A into KU
                LR   A,(IS)              ; 40c6 4c             load A from ISAR reference
                LR   KL,A                ; 40c7 05             store A into KL
                LR   A,IS                ; 40c8 0a             load A from ISAR
                LISU 7                   ; 40c9 67             set ISAR window to reg. 60
                LISL 4                   ; 40ca 6c
                LR   (IS)+,A             ; 40cb 5d             store A into register 60
                LR   A,(IS)              ; 40cc 4c             restore ISAR from register 61
                LR   IS,A                ; 40cd 0b
                LR   W,J                 ; 40ce 1d             load status register from scratchpad reg. 9
                POP                      ; 40cf 1c             return
          
; Setupstack routine seems to be a short, but often used routine. This basically loads the constant $3b into register 60 and returns.
; Register 60 gets used by routines PUSHK and POPK to form some kind of stack in the scratchpad.
; This means that Register 60 is the stack pointer and starts out at register 59. This means that the stack starts growing
; downwards in memory from registers 59 on.
      
SETUPSTACK:     LR   K,P                 ; 40d0 08                 Save return address in Register K (0C/0D)
                LISU 7                   ; 40d1 67                 Load 7 into the 3 upper bits of ISAR
                LISL 4                   ; 40d2 6c                 Load 4 into the 3 lower bits of ISAR
                LI   $3b                 ; 40d3 20 3b              Load immediate $3b into accumulator
                LR   (IS),A              ; 40d5 5c                 Load accumulator contents into register addressed by ISAR (= register 74 octal = 60 decimal)
                LISU 2                   ; 40d6 62                 Load 2 into the 3 upper bits of ISAR
                LISL 0                   ; 40d7 68                 Load 0 into the 3 lower bits of ISAR
                PK                       ; 40d8 0c                 Return to address given in Register K (0C/0D)
;--------------------
; DRAWCHAR subroutine
;
;$0FDF generally contains the next cursor position to draw to
;R8 contains the character that should be drawn
;Trashes: R16, R17, DC0, DC1, K
                
DRAWCHAR:       LR   K,P                 ; 40d9 08              save return address
A40da:          LISU 2                   ; 40da 62              point to R16
                LISL 0                   ; 40db 68
                DCI  CURSORPOS           ; 40dc 2a 0f df        point to $0FDF (Cursor position)
                LM                       ; 40df 16              load cursor position
                LR   (IS)+,A             ; 40e0 5d              store A into R16 and point to R17
                SR   4                   ; 40e1 14              shift right 4 places
                LR   (IS)-,A             ; 40e2 5e              store A into R17 and point to R16 -> R17 = (Cursor position) / 16 (= Line number)
                LIS  $f                  ; 40e3 7f              load $0F into A
                NS   (IS)+               ; 40e4 fd              AND A with R16 and point to R17 => $A = R16 (Cursor position) AND $0F (= Position inside of line)
                DCI  $0bbf               ; 40e5 2a 0b bf	$C2F-$70
                ADC                      ; 40e8 8e		position in row
                LI   $70                 ; 40e9 20 70		7x16=number of bytes between rows of characters
A40eb:          ADC                      ; 40eb 8e              increase DC0 by $70
                DS   (IS)                ; 40ec 3c              decrease R17
                BT   1,A40eb             ; 40ed 81 fd           loop if R17 positive (0 through 127)
                XDC                      ; 40ef 2c              swap DC0 and DC1 (DC0 now contains target position to write to)
                DCI  FONT                ; 40f0 2a 20 10        point to font table (at $2010 in RES2)
                LR   A,$8                ; 40f3 48				;move to character (move R8 into A)
                ADC                      ; 40f4 8e              add to DC0
                SL   1                   ; 40f5 13              shift left (A = A * 2)
                ADC                      ; 40f6 8e              add to DC0 three more times (for a total of 7)
                ADC                      ; 40f7 8e              -> DC0 = $2010 + 7 * R8
                ADC                      ; 40f8 8e
                
                LIS  $7                  ; 40f9 77				;characters have 7 rows of pixels
                LR   (IS),A              ; 40fa 5c              store $7 into R17
A40fb:          LM                       ; 40fb 16				;get line of character
                XDC                      ; 40fc 2c				
                ST                       ; 40fd 17				;draw it on screen
                LIS  $f                  ; 40fe 7f              load $0F into A
                ADC                      ; 40ff 8e              add 15 to DC0 (for a total of 16 with auto-increase on ST)
                XDC                      ; 4100 2c              Swap DC0 and DC1
                DS   (IS)                ; 4101 3c              Decrease R17
                BF   $4,A40fb            ; 4102 94 f8			;next row
                
                PK                       ; 4104 0c              Return
                
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

;Backspace routine - set the cursor one position back
;if it's at the left edge of the top line, it stays there
;
;Trashes: K, DC0, A
;Changes: $0FDF
                
BACKSPACE:
                LR   K,P                 ; 4122 08            ;save return address
                DCI  CURSORPOS           ; 4123 2a 0f df      ;point to cursor position
                LI   $ff                 ; 4126 20 ff         ;add $ff to it (that is, subtract 1)
                AM                       ; 4128 88
                BT   1,A4138             ; 4129 81 0e         ;branch to 4138 if positive, otherwise 4137 (where 0 is put into A)
                BF   $0,A4137            ; 412b 90 0b

;INCCURSOR - increases the cursor position contained in $0FDF.
;Since the display contains 7 rows with 16 characters each,
;the upper nybble is the row and the lower nybble is the column.
;If the cursor reaches the end of the 7th line, it wraps around
;to the start of the first line
;
;Trashes: K, DC0, A
;Changes: $0FDF
                
INCCURSOR:      LR   K,P                 ; 412d 08             ;save return address
                DCI  CURSORPOS           ; 412e 2a 0f df       ;point to cursor position
                LIS  $1                  ; 4131 71             ;load #01 into A
                AM                       ; 4132 88             ;Add cursor position to A
                CI   $70                 ; 4133 25 70          ;compare to $70 (112) = max. number of chars
                BF   $4,A4138            ; 4135 94 02          ;if not reached, skip
A4137:          LIS  $0                  ; 4137 70             ;reset to 0
A4138:          DCI  CURSORPOS           ; 4138 2a 0f df       ;point to cursor position again
                ST                       ; 413b 17             ;store new location in position
                NI   $0f                 ; 413c 21 0f          ;and location with $0f (gives column value)
                PK                       ; 413e 0c             ;return
                
;Subroutine for clock display

A413f:          LR   K,P                 ; 413f 08             ;save return address
                PI   PUSHK               ; 4140 28 40 a9       ;push return address onto stack
                LIS  $0                  ; 4143 70
                XS   $3                  ; 4144 e3             ;load R3 into A
                LISU 3                   ; 4145 63             ;point to R31
                LISL 7                   ; 4146 6f
                BF   $4,A4151            ; 4147 94 09          ;if R3 not zero, skip the following part
                LISU 2                   ; 4149 62             ;store contents of R23 into R31
                LR   A,(IS)              ; 414a 4c
                LISU 3                   ; 414b 63             
                LR   (IS),A              ; 414c 5c
                LISU 7                   ; 414d 67
                LR   A,(IS)-             ; 414e 4e             ;store contents of R63 into R30
                LISU 3                   ; 414f 63
                LR   (IS)-,A             ; 4150 5e
A4151:          LM                       ; 4151 16             ;load memory from DC0 (not previously set!) counting up, store into R29, counting down
                LR   (IS)-,A             ; 4152 5e
                BR7  A4151               ; 4153 8f fd           ;branch back if lower ISAR register is not 7 (thus counts down to R23)
                DCI  $27e3               ; 4155 2a 27 e3	;contains 4,5,6,2,3,1,7
                LISU 3                   ; 4158 63              ;point to register 28
                LISL 4                   ; 4159 6c
                LR   A,(IS)              ; 415a 4c              ;-> DC0 = ($27e3 + contents of R23)
                ADC                      ; 415b 8e
                LM                       ; 415c 16              ;load background color from that address, store into video and shadow register for it
                DCI  BKGCOLOR            ; 415d 2a 0f e9
                ST                       ; 4160 17
                DCI  REG_BKGCOLOR        ; 4161 2a 08 f5
                ST                       ; 4164 17
                DCI  CURSORPOS           ; 4165 2a 0f df        ;set cursor to position 6 in line 1
                LIS  $6                  ; 4168 76
                ST                       ; 4169 17
                DCI  MONTEXT             ; 416a 2a 24 37	;get the day of the week (text) - start of month table at $2437
                PI   A4237               ; 416d 28 42 37        ;display weekday (3 characters)
                DCI  CURSORPOS           ; 4170 2a 0f df        ;set cursor to line 2, column 4
                LI   $13                 ; 4173 20 13
                ST                       ; 4175 17
                LISU 3                   ; 4176 63            ;point to register 27 (day of month)
                LISL 3                   ; 4177 6b
                PI   DRAW2NUMS           ; 4178 28 42 1e      ;draw day of month as 2 numbers
                PI   INCCURSOR           ; 417b 28 41 2d
                LISU 3                   ; 417e 63            ;point to register 26 (month)
                LISL 2                   ; 417f 6a
                LR   A,(IS)              ; 4180 4c            ;load R26 / 16 and skip to 4189 if zero (R26 <= 15)
                SR   4                   ; 4181 14
                BT   4,A4189             ; 4182 84 06
                LIS  $a                  ; 4184 7a             ;else load R26 + $0a and keep only 4 right places
                AS   (IS)                ; 4185 cc             ; then store back in R26
                SL   4                   ; 4186 15             ;(R26 = (R26 + $0a) AND $0F)
                SR   4                   ; 4187 14             ;or in decimal: If R26 >= 16 then R26 = (R26 + 10) AND 15
                LR   (IS),A              ; 4188 5c             ;meaning that 16 becomes 6
A4189:          DCI  JANTEXT             ; 4189 2a 24 5b	;get the month
                PI   A4237               ; 418c 28 42 37        ;display month (again?)
                PI   INCCURSOR           ; 418f 28 41 2d
                LISU 3                   ; 4192 63             ;point to register 24 (year MSB)
                LISL 0                   ; 4193 68
                PI   DRAW2NUMS           ; 4194 28 42 1e       ;draw as 2 numbers
                LISU 3                   ; 4197 63             ;point to register 25 (year LSB)
                LISL 1                   ; 4198 69
                PI   DRAW2NUMS           ; 4199 28 42 1e       ;draw as 2 numbers
                PI   A41c8               ; 419c 28 41 c8       ;wait for scanline, call clock routine
                DCI  CURSORPOS           ; 419f 2a 0f df
                LI   $24                 ; 41a2 20 24          ;set cursor to line 2, column 5
                ST                       ; 41a4 17
                LISU 3                   ; 41a5 63             ;point to register 29 (hour)
                LISL 5                   ; 41a6 6d
                PI   DRAW2NUMS           ; 41a7 28 42 1e       ;draw hour as 2 numbers
                LI   $2a                 ; 41aa 20 2a
                LR   $8,A                ; 41ac 58
                PI   DRAWCHAR            ; 41ad 28 40 d9       ;draw : character
                PI   INCCURSOR           ; 41b0 28 41 2d
                LISU 3                   ; 41b3 63             ;point to register 30 (minute)
                LISL 6                   ; 41b4 6e
                PI   DRAW2NUMS           ; 41b5 28 42 1e       ;draw minute as 2 numbers
                LI   $2a                 ; 41b8 20 2a
                LR   $8,A                ; 41ba 58
                PI   DRAWCHAR            ; 41bb 28 40 d9       ;draw : character
                PI   INCCURSOR           ; 41be 28 41 2d
                LISU 3                   ; 41c1 63             ;point to register 31 (second)
                LISL 7                   ; 41c2 6f
                PI   DRAW2NUMS           ; 41c3 28 42 1e       ;draw second as 2 numbers
                BF   $0,A41cc            ; 41c6 90 05          ;wait for scanline, call clock routine and return
     
;The following subroutine get called quite often, also from cartridges
;waits for a scanline, calls the clock routine and returns
           
A41c8:          LR   K,P                 ; 41c8 08            ;save return address
                PI   PUSHK               ; 41c9 28 40 a9      ;push return address onto stack
A41cc:          PI   WAITSCANLINE        ; 41cc 28 45 01      ;wait for scanline
                PI   A424d               ; 41cf 28 42 4d      ;call clock routine (?)
                LISL 0                   ; 41d2 68            ;point to R16
                BF   $0,A4201            ; 41d3 90 2d         ;jump to 4201 for POPK and Return
                
CLRSCREEN:      LR   K,P                 ; 41d5 08            ;save return address
                PI   PUSHK               ; 41d6 28 40 a9      ;push return address onto stack
                DCI  REG_VIDEOMODE       ; 41d9 2a 08 f7      ;load command register address
                LIS  $0                  ; 41dc 70            ;clear A
                ST                       ; 41dd 17            ;store 0 into command register
                PI   A41c8               ; 41de 28 41 c8      ;call a41c8
                
                DCI  FIRSTCHAR           ; 41e1 2a 0c 2f		; memory location of upper left char
                LIS  $4                  ; 41e4 74				;4 times...
                LR   $a,A                ; 41e5 5a
A41e6:          LI   $c4                 ; 41e6 20 c4			;...196 bytes=784 bytes=7 rows of 16 7-pixel high chars
                LR   $b,A                ; 41e8 5b
                LIS  $0                  ; 41e9 70
A41ea:          ST                       ; 41ea 17            ;clear all line segments in a loop
                DS   $b                  ; 41eb 3b
                BF   $4,A41ea            ; 41ec 94 fd         ;next byte
                DS   $a                  ; 41ee 3a
                BF   $4,A41e6            ; 41ef 94 f6         ;next 196-byte-block
                
                PI   A41c8               ; 41f1 28 41 c8      ; wait for scanline and do clock
                DCI  VIDEOMODE           ; 41f4 2a 0f ea      ;point to $0fea
                LM                       ; 41f7 16            ;load into A
                DCI  REG_VIDEOMODE       ; 41f8 2a 08 f7      ;point to $08f7 (command register)
                ST                       ; 41fb 17            ;store into command register
                DCI  CURSORPOS           ; 41fc 2a 0f df      ;point to $0fdf (cursor position)
                LIS  $0                  ; 41ff 70            ;clear A
                ST                       ; 4200 17            ;store 0 to cursor position
A4201:          PI   POPK                ; 4201 28 40 bc   ;restore return address from stack
                PK                       ; 4204 0c         ;return

;Print subroutine
;prints out a given number of characters
;
;Parameters:
;DC0 must point to character string
;A contains number of characters to print

;Trashes: K, A, IS

PRINT:          LR   K,P                 ; 4205 08            save return address
                PI   PUSHK               ; 4206 28 40 a9      push return address
A4209:          LM                       ; 4209 16            load from memory at DC0
                LR   Q,DC                ; 420a 0e            save DC0 in Q
                LR   $8,A                ; 420b 58            store A into R8
                PI   DRAWCHAR            ; 420c 28 40 d9      call DRAWCHAR
                PI   INCCURSOR           ; 420f 28 41 2d      call INCCURSOR (leaves column no. in A)
                BF   $4,A4217            ; 4212 94 04         if not equal, skip next call
                PI   A41c8               ; 4214 28 41 c8      wait for scanline and do clock before writing next line
A4217:          LISL 4                   ; 4217 6c            point to R20
                DS   (IS)                ; 4218 3c            decrease R20
                LR   DC,Q                ; 4219 0f            restore DC0 from Q
                BF   $4,A4209            ; 421a 94 ee         if r20 is not 0, loop back to 4209
                BF   $0,A4201            ; 421c 90 e4         branch to Restore Return Addres / Return

;Draw2nums:
;draws a 2-digit number stored in (IS) as 2 characters on screen
;(IS) contains 2-digit number
;trashes: K, A, R5, R8 and everything DRAWNUM and INCCURSOR trashes
                
DRAW2NUMS:      LR   K,P                 ; 421e 08            save return address
                PI   PUSHK               ; 421f 28 40 a9      push return address
                LR   A,(IS)              ; 4222 4c            load A from (IS), store in R5
                LR   $5,A                ; 4223 55
                SR   4                   ; 4224 14            divide by 16 and store in R8
                LR   $8,A                ; 4225 58
                PI   DRAWNUM             ; 4226 28 41 05      draw number
                PI   INCCURSOR           ; 4229 28 41 2d      increase cursor
                LIS  $f                  ; 422c 7f
                NS   $5                  ; 422d f5            A = R5 AND $0f (only lower nybble of stored (is))
                LR   $8,A                ; 422e 58            store in R8
                PI   DRAWNUM             ; 422f 28 41 05      draw number
                PI   INCCURSOR           ; 4232 28 41 2d      increase cursor
A4235:          BF   $0,A4201            ; 4235 90 cb         branch to A2401 for return

;Display_Month:
;Month number is contained in (IS)
;DC0 should be set to the month table before calling here
;trashes: K, A, DC0, R20

A4237:          LR   K,P                 ; 4237 08            ;subroutine for displaying month (?) - save return address
                PI   PUSHK               ; 4238 28 40 a9      ;push return address onto stack
                LR   A,(IS)              ; 423b 4c            ;A = (IS) * 3
                SL   1                   ; 423c 13
                AS   (IS)                ; 423d cc
                COM                      ; 423e 18            ;A = 255 - (IS) * 3
                INC                      ; 423f 1f            ;A = 256 - (IS * 3)
                ADC                      ; 4240 8e            ;add to DC0 (now points to name of month to display)
                LIS  $3                  ; 4241 73
                LISU 2                   ; 4242 62            ;point to Reg.20
                LISL 4                   ; 4243 6c
                LR   (IS),A              ; 4244 5c            ;store $03 to Reg. 20 (number of characters to print)
                PI   PRINT               ; 4245 28 42 05      ;print month
                BF   $0,A4235            ; 4248 90 ec         ;2-step branch to restore return address and return
                
A424a:          LR   K,P                 ; 424a 08            ;another subroutine - save return address
                BF   $0,A4293            ; 424b 90 47         ;unconditional branch to 4293, in the middle of clock processing

;Subroutine for doing something with the display and segments and with the clock (?)
;this one effectively gets called once every frame - in fact HAS to be called in order to have a stable display
;Contents of $0ffa get copied into reg. 16 and 17, (($0ffa) EOR FF) + $11 into reg. 19
;if $0ffb is zero, on with A4264, else store $07 into reg. 18 and on with A4271
;contents of $0ffa are $09,$00,$46,$47 on first clear screen,
;otherwise $09,$01,$0f,$b1,$0f,$b1                
;trashes: R16, R17, R19, R18
;
;$0ffa-$0fff should contain a block of control info for this routine:
;
;$0ffa contains the number of objects on screen that have to be refreshed
;$0ffb... I'm not sure. If it's zero, $03 gets written to R18, otherwise $07... normally, $0ffb should be $01
;$0ffc/$0ffd points to the list of y-value LSB's, followed by y-value MSB's, RAM LSB's and RAM MSB's if lightpen not active
;$0ffe/$0fff points to the list of y-value LSB's, followed by y-value MSB's, RAM LSB's and RAM MSB's if lightpen active (?!)

A424d:          LR   K,P                 ; 424d 08         ;save return address
                LISU 2                   ; 424e 62         ;set ISAR to reg. 16
                LISL 0                   ; 424f 68
                DCI  $0ffa               ; 4250 2a 0f fa   ;load data pointer with $0ffa
                LM                       ; 4253 16         ;load $0ffa contents into A, data pointer is now $0ffb
                LR   (IS)+,A             ; 4254 5d         ;copy into reg. 16 -> r16 = ($0ffa), usually set to $09
                LR   (IS)+,A             ; 4255 5d         ;copy into reg. 17 -> r17 = ($0ffa)
                COM                      ; 4256 18         ;complement A (->$F6)
                INC                      ; 4257 1f         ;increase A (->$F7)
                AI   $10                 ; 4258 24 10      ;add $10 to A (->$07)
                LISL 3                   ; 425a 6b         ;set ISAR to reg. 19
                LR   (IS)-,A             ; 425b 5e         ;store A into reg. 19, ISAR is now 18 -> r19 = 255 - ($0ffa) + 16 (usually $07)
                LIS  $0                  ; 425c 70         ;clear A
                XM                       ; 425d 8c         ;XOR A with (actually, set A to) memory pointed at by DC0 ($0ffb), DC0 is now $0ffc
                BF   $4,A4264            ; 425e 94 05      ;skip following section if not zero ($0ffb is not zero - is $00 on first CLRSCREEN, $01 otherwise)
                LIS  $7                  ; 4260 77         ;set A to $07
                LR   (IS),A              ; 4261 5c         ;store $07 into reg. 18
                BF   $0,A4271            ; 4262 90 0e      ;unconditional branch to A4271
                
;store $03 into reg. 18, increase data pointer to $0ffe if the Y-Freeze MSB is set

A4264:          LIS  $3                  ; 4264 73         ;load A with $03
                LR   (IS),A              ; 4265 5c         ;store A in reg. 18
                XDC                      ; 4266 2c         ;swap data pointers (DC1 is now $0ffc)
                DCI  $08fa               ; 4267 2a 08 fa   ;load $08Fa into data pointer (Y-Freeze MSB and odd/even)
                LIS  $0                  ; 426a 70         ;clear A
                XM                       ; 426b 8c         ;XOR (in this case, rather set) A with memory at $08Fa, DC0 is now $08fb
                XDC                      ; 426c 2c         ;swap data pointers (DC1 is now $08fb, DC0 is $0ffc)
                BF   $1,A4271            ; 426d 91 03      ;branches if the high-order bit of $08fa (Y-Freeze MSB) is 0
                LIS  $2                  ; 426f 72         ;set A to $02
                ADC                      ; 4270 8e         ;add 2 to DC0 (DC0 now should be $0ffe)

;Prepare for initializing / refreshing segment lists
;The starting address for the graphics of each object must be refreshed during each vertical blanking interval
;because the VLSI counts it up while it's reading the data and putting it out to the screen
;so the VLSI is able to start at the starting address again in the next run
;
;When this label gets reached, DC0 is either $0ffe if Y-Freeze MSB is set and $0ffb is zero, otherwise $0ffc
;A is $07 if $0ffb is zero or $03 if $0ffb is not zero (but gets cleared immediately afterwards)

A4271:          LM                       ; 4271 16         ;load memory pointed to by DC0 (either $0ffe or $0ffc)
                LR   $a,A                ; 4272 5a         ;store in register a
                LM                       ; 4273 16         ;load memory pointed to by DC0 (either $0fff or $0ffd)
                LR   $b,A                ; 4274 5b         ;store in register b
                LR   DC,H                ; 4275 10         ;load data counter with scratchpad reg. a/b (just stored to)
                XDC                      ; 4276 2c         ;swap data pointers
                DCI  $0800               ; 4277 2a 08 00   ;load data pointer with $0800 (start of segment lists)
                LISL 0                   ; 427a 68         ;Set ISR to 16 (at this point, R16 should contain the contents of $0ffa, which is usually $09)

;The following loop copies memory from DC1 to DC0 as many times as given in register (IS)
;DC0 was initialized with $0800, DC1 was initialized earlier with contents of either $0ffc or $0ffe, IS should point to reg. 16 containing $09
;This means that DC1 now either contains $4647 on first clear screen or $0fb1 on subsequent ones, hence 9 bytes get copied from $4647 or $0fb1 to $0800

A427b:          XDC                      ; 427b 2c         ;swap data pointers
                LM                       ; 427c 16         ;load from memory (segment graphics address starts from RAM)
                XDC                      ; 427d 2c         ;swap data pointers
                ST                       ; 427e 17         ;store to memory (VLSI registers for starting addresses)
                DS   (IS)                ; 427f 3c         ;decrement reg. 16
                BF   $4,A427b            ; 4280 94 fa      ;loop back if not finished yet
      
          
;DC0 = DC0 + (R19), dec. R18 and branch if zero

                LISL 3                   ; 4282 6b         ;point to reg. 19 (which still contains (($0ffa) EOR FF) + $11
                LR   A,(IS)-             ; 4283 4e         ;load A from reg. 19, point to reg. 18
                ADC                      ; 4284 8e         ;add content of reg. 19 to DC0
                DS   (IS)                ; 4285 3c         ;decrement reg. 18
                BT   4,A4293             ; 4286 84 0c      ;branch if zero; branches forward if reg.18 is zero

;If R17 is $01, add $10 to DC0

                LIS  $1                  ; 4288 71         ;load A with $01
                XS   (IS)-               ; 4289 ee         ;XOR A with reg. 18, point to reg. 17
                BF   $4,A428f            ; 428a 94 04      ;skip following part if not zero (reg. 18 <> "$01")
                LIS  $1                  ; 428c 71         ;load A with $01
                SL   4                   ; 428d 15         ;becomes $10
                ADC                      ; 428e 8e         ;add $10 to DC0

;Copy R17 to R16, back to A427b

A428f:          LR   A,(IS)-             ; 428f 4e         ;load A with contents crom reg. 17, point to 16
                LR   (IS),A              ; 4290 5c         ;copy contents of reg. 17 to reg. 16
                BF   $0,A427b            ; 4291 90 e9      ;unconditional branch back to A427b to do another loop (probably refreshing line heights)

;If R22 not positive (128 through 255) decrement R21 and return if not zero (returns if clock should NOT be advanced by a second)
                
A4293:          LISL 6                   ; 4293 6e         ;point to reg. 22
                LIS  $0                  ; 4294 70         ;clear A
                XS   (IS)-               ; 4295 ee         ;XOR a with reg. 22, point to reg. 21
                BT   1,A429b             ; 4296 81 04      ;branch if positive (0 through 127)
                DS   (IS)+               ; 4298 3d         ;decrement reg. 21, point to reg. 22
                BT   4,A429c             ; 4299 84 02      ;branch if zero
A429b:          PK                       ; 429b 0c         ;return (if not zero)

;A = $FO and (R22) -> R11; ($4351 + ($0f and (R22))) -> R21; Decrement R11, if not positive, reset to $0F
;$4351 is the table containing number of frames to occur per second for 16 consecutive seconds
;R21 contains number of frames before clock counts up by a second
;R22 contains running number of seconds used to index table at $4351

A429c:          LIS  $f                  ; 429c 7f         ;load A with $0f
                NS   (IS)-               ; 429d fe         ;A = A AND R22, point to R21
                LR   $b,A                ; 429e 5b         ;store A into R11
                DCI  A4351               ; 429f 2a 43 51   ;point at $4351 + A
                ADC                      ; 42a2 8e         
                LM                       ; 42a3 16         ;load A from DC0 ($4351 + A)
                LR   (IS)+,A             ; 42a4 5d         ;store A into R21, point at R22
                DS   $b                  ; 42a5 3b         ;decrement R11
                BT   1,A42aa             ; 42a6 81 03      ;branch if positive
                LIS  $f                  ; 42a8 7f         ;load $0F into A
                LR   $b,A                ; 42a9 5b         ;store into R11

;R22 = (R22 and $C0) XOR (R11)

A42aa:          LIS  $c                  ; 42aa 7c         ;load $0C into A
                SL   4                   ; 42ab 15         ;becomes $C0
                NS   (IS)                ; 42ac fc         ;A = A AND R22
                XS   $b                  ; 42ad eb         ;XOR with R11
                LR   (IS),A              ; 42ae 5c         ;store in R22
                LISL 7                   ; 42af 6f         ;point to R23
                LI   $67                 ; 42b0 20 67      ;Load A with $67
                ASD  (IS)                ; 42b2 dc         ;Decimal Add R23 to A (minute register?)
                CI   $59                 ; 42b3 25 59	;mins/hr ;compare A to $59
                BF   $2,A42bb            ; 42b5 92 05      ;branch if no carry
A42b7:          LR   (IS),A              ; 42b7 5c         ;if carry set, store A in R23 and jump to 4326
                JMP  A4326               ; 42b8 29 43 26
A42bb:          LIS  $0                  ; 42bb 70         ;clear A
                LR   (IS),A              ; 42bc 5c         ;store 0 in R23
                LISU 7                   ; 42bd 67         ;point to R63
                LI   $67                 ; 42be 20 67      ;Load A with $67 (again)
                ASD  (IS)                ; 42c0 dc         ;Decimal Add R63 to A (second register?)
                CI   $59                 ; 42c1 25 59	;secs/min ;compare A to $59
                BT   2,A42b7             ; 42c3 82 f3      ;branch if no carry (back to 42b7)
                LIS  $0                  ; 42c5 70         ;clear A
                LR   (IS)+,A             ; 42c6 5d         ;store 0 in R63, point to R0
                LISU 2                   ; 42c7 62         ;point to R16
                
                DCI  $0fd4               ; 42c8 2a 0f d4	;copy 6 bytes from 4110 to fd4 23 06 00 11 99 99
                XDC                      ; 42cb 2c
                DCI  A4110               ; 42cc 2a 41 10
                LIS  $6                  ; 42cf 76         ;set A to $06
                LR   (IS),A              ; 42d0 5c         ;store to R16
A42d1:          LM                       ; 42d1 16         ;Load from $4110 upward
                XDC                      ; 42d2 2c  
                ST                       ; 42d3 17         ;store to $0fd4 upward
                XDC                      ; 42d4 2c
                DS   (IS)                ; 42d5 3c         ;decrement R16
                BF   $4,A42d1            ; 42d6 94 fa      ;loop back if not zero yet
                
                DCI  $0fef               ; 42d8 2a 0f ef   ;point to $0fef (month number)
                LM                       ; 42db 16         ;load content into A (month number, decimal)
                CI   $0f                 ; 42dc 25 0f		;convert to BCD
                BT   2,A42e4             ; 42de 82 05		;if > 15
                SL   4                   ; 42e0 15			;blank top nibble
                SR   4                   ; 42e1 14
                AI   $0a                 ; 42e2 24 0a		;and add 10 (so $17 becomes $11)
                
A42e4:          DCI  DAYSINMON           ; 42e4 2a 41 16    ;point to Daysinmon
                ADC                      ; 42e7 8e          ;add A to pointer (month number?)
                LM                       ; 42e8 16          ;load contents into A -> number of days in current month
                DCI  $0fd6               ; 42e9 2a 0f d6    ;store A into $0FD6
                ST                       ; 42ec 17          ;$0FD6 now contains number of days in current month (?)
                DCI  $0fd4               ; 42ed 2a 0f d4    ;point to $0Fd4
                XDC                      ; 42f0 2c
                DCI  $0fec               ; 42f1 2a 0f ec    ;point to $0FE6
                LIS  $6                  ; 42f4 76          ;set A to $06
                LR   (IS),A              ; 42f5 5c          ;set R16 to $06 (6 loop iterations)

;Loop: DC0 is $0FE6, DC1 is $0Fd4; DC0 -> H; A = $67 + ($0fec); if ($0fd4 >= $0fec), 

A42f6:          LR   H,DC                ; 42f6 11          ;copy Data Counter Register into R10/R11 (should be $0fec)
                LI   $67                 ; 42f7 20 67       ;Load A with $67
                AMD                      ; 42f9 89          ;decimal add $0fec to A ($67), point to $0fed
                XDC                      ; 42fa 2c          
                CM                       ; 42fb 8d          ;compare to $0Fd4, point to $0fde
                XDC                      ; 42fc 2c
                BT   2,A4307             ; 42fd 82 09       ;branch if no carry ($0fd4 smaller than $0fec)
                LIS  $0                  ; 42ff 70          ;clear A
                LR   DC,H                ; 4300 10          ;copy R10/R11 into DC0 (should be $0fec)
                ST                       ; 4301 17          ;store 0 in $0fec
                DS   (IS)                ; 4302 3c          ;decrement R16
                BF   $4,A42f6            ; 4303 94 f2       ;loop back if > 0
                BF   $0,A431b            ; 4305 90 15       ;unconditional branch to A431b
                


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

;The following is a table how many frames should occur before the clock ticks up by one second
;normally there should be 59.97 frames per second; here, apparently, it's about 59.81 frames per second

A4351:			db   $3b,$3c,$3c,$3c,$3c,$3c,$3b,$3c,$3c,$3c,$3c,$3b,$3c,$3c,$3c,$3c

;The following subroutine reads the keyboard and the joystick buttons
;After exiting, R8 should contain the keycode, and R16 should contain the joystick button states (1 bit per state)
;The first sequence sets up the keyboard strobe by setting $01 in R16, designating the first column, and clearing R8.

READKBJOY:      LR   K,P                 ; 4361 08		;called from GETKEY
                LISU 2                   ; 4362 62              ;point to R16
                LISL 0                   ; 4363 68
                LIS  $1                  ; 4364 71		;column strobe
                LR   (IS),A              ; 4365 5c              ;store $01 in R16
                SL   4                   ; 4366 15              ;make it $10
                DCI  VIDEOMODE           ; 4367 2a 0f ea        ;point to video mode shadow register
                OM                       ; 436a 8b              ;A = A OR video mode
                DCI  REG_VIDEOMODE      ; 436b 2a 08 f7         ;point to command register
                ST                       ; 436e 17              ;store in command register -> command register = (video mode OR $10) -> set KBD output pin
                LIS  $0                  ; 436f 70
                LR   $8,A                ; 4370 58              ;clear R8 and output port 0
                OUTS 0                   ; 4371 b0		;keyboard columns/joystick pots
                DCI  $0fde               ; 4372 2a 0f de        ;point to $0fde
                LIS  $f                  ; 4375 7f              ;A = $F0 and ($0fde)
                SL   4                   ; 4376 15
                NM                       ; 4377 8a
                OUTS 1                   ; 4378 b1		;put that value on output port 1 - keyboard rows/joystick buttons
                
CHKKEY:         LR   A,(IS)+             ; 4379 4d		;get keyboard column to strobe (from R16, starting at $01)
                OUTS 0                   ; 437a b0		;set keyboard column hi to value of R16
                NOP                      ; 437b 2b		;wait a bit
                NOP                      ; 437c 2b
                NOP                      ; 437d 2b
                INS  1                   ; 437e a1		;read keyboard rows
                NI   $0f                 ; 437f 21 0f	;mask off high bits
                BT   4,NOKEY             ; 4381 84 2d	;no keys down, branch
                
                LR   (IS),A              ; 4383 5c		;key down - store in R17
A4384:          LR   A,(IS)              ; 4384 4c              ;shift R17 right 1 place (contains column strobe)
                SR   1                   ; 4385 12              
                LR   (IS),A              ; 4386 5c
                BT   4,A438e             ; 4387 84 06           ;if zero, on at 438e
                LIS  $9                  ; 4389 79              ;else increase R8 by 9 and branch back to 4384
                AS   $8                  ; 438a c8              ;at the end of the loop, R8 is set to 9 * bit number of read
                LR   $8,A                ; 438b 58
                BF   $0,A4384            ; 438c 90 f7           ;unconditional branch back to $4384
                
A438e:          LISL 0                   ; 438e 68              ;point to R16 again
A438f:          LIS  $1                  ; 438f 71              ;increase R8 in another loop, and the end of which R8 = (R17 bit number * 9 + R16 bit number)
                AS   $8                  ; 4390 c8
                LR   $8,A                ; 4391 58
                LR   A,(IS)              ; 4392 4c              ;shift R16 right 1 place
                SR   1                   ; 4393 12
                LR   (IS),A              ; 4394 5c
                BF   $4,A438f            ; 4395 94 f9           ;if resulting R6 not zero, loop back
                
CHKKEYEXIT:     DCI  $0feb               ; 4397 2a 0f eb        ;point to $0feb
                LR   H,DC                ; 439a 11              ;store DC in H
                LR   A,$8                ; 439b 48              ;compare R8 with memory $0feb
                CM                       ; 439c 8d
                BT   4,A43a4             ; 439d 84 06           ;if equal, on at 43a4 (last instruction that affects flags before exit)
                LR   DC,H                ; 439f 10              ;else store R8 at $0feb,
                ST                       ; 43a0 17
                OI   $80                 ; 43a1 22 80           ;and store (R8 OR $80) in R8
                LR   $8,A                ; 43a3 58              
A43a4:          LR   J,W                 ; 43a4 1e              ;copy W to J
                DCI  $0fdd               ; 43a5 2a 0f dd        ;load from address $0fdd and store to output port 0
                LM                       ; 43a8 16
                OUTS 0                   ; 43a9 b0		;keyboard columns/joystick pots
                DI                       ; 43aa 1a
                LM                       ; 43ab 16              ;load from address $0fde and store to output port 1
                OUTS 1                   ; 43ac b1		;keyboard rows/joystick buttons
                LR   W,J                 ; 43ad 1d              ;copy J back to W (what for? Has W been destroyed?)
                PK                       ; 43ae 0c              ;return
                
NOKEY:          LISL 0                   ; 43af 68              ;jump gets here from 4381 - point to R16
                LR   A,(IS)              ; 43b0 4c		;next column (shift R16 one place to the left)
                SL   1                   ; 43b1 13
                LR   (IS),A              ; 43b2 5c
                BF   $4,CHKKEY           ; 43b3 94 c5           ;if not zero, branch back to CHKKEY (columns left to read)
                
                DCI  VIDEOMODE           ; 43b5 2a 0f ea	;all columns done - read video mode shadow register and store into command register
                LM                       ; 43b8 16              ;(clearing the KBD pin)
                DCI  REG_VIDEOMODE       ; 43b9 2a 08 f7
                ST                       ; 43bc 17
                INS  1                   ; 43bd a1		;read joystick buttons
                NI   $0f                 ; 43be 21 0f           ;mask off lower 4 bits
                LR   (IS),A              ; 43c0 5c              ;store into R16
                BT   4,CHKKEYEXIT        ; 43c1 84 d5           ;if zero, branch back to exit
A43c3:          LIS  $9                  ; 43c3 79              ;increase R8 by 9
                AS   $8                  ; 43c4 c8
                LR   $8,A                ; 43c5 58
                LR   A,(IS)              ; 43c6 4c              ;shift R16 one bit to the right
                SR   1                   ; 43c7 12
                LR   (IS),A              ; 43c8 5c
                BF   $4,A43c3            ; 43c9 94 f9           ;if not zero (more bits to read), back to A43c3
                BF   $0,CHKKEYEXIT       ; 43cb 90 cb           ;else unconditional branch to CHKKEYEXIT
                
COPYMEMTOMEM:   LR   K,P                 ; 43cd 08		copy (IS) bytes from DC1 to DC0
A43ce:          XDC                      ; 43ce 2c			ex: DCI a, XDC, DCI b, LIS 2, LR   (IS),A, PI COPYMEMTOMEM
                LM                       ; 43cf 16				copies 2 bytes from a to b
                XDC                      ; 43d0 2c
                ST                       ; 43d1 17
                DS   (IS)                ; 43d2 3c
                BF   $4,A43ce            ; 43d3 94 fa
                PK                       ; 43d5 0c              ;return

GETKEY:         LR   K,P                 ; 43d6 08			;gets a keypress or times out (r20 contains number of frames to wait)
                PI   PUSHK               ; 43d7 28 40 a9                ;push return address to stack
A43da:          PI   READKBJOY           ; 43da 28 43 61                ;read keyboard and joysticks
                BF   $4,A43f0            ; 43dd 94 12
                LIS  $0                  ; 43df 70                      ;load R8 (keycode) into A and check flags
                XS   $8                  ; 43e0 e8
                DCI  $0fe3               ; 43e1 2a 0f e3                ;point to 0fe3
                BT   4,A4414             ; 43e4 84 2f                   ;branch to 4414 if R8 is zero (no keys pressed)
                LR   Q,DC                ; 43e6 0e                      ;save DC0 in Q
                LIS  $0                  ; 43e7 70
                XM                       ; 43e8 8c                      ;check contents of $0fe3
                BF   $4,A4415            ; 43e9 94 2b                   ;if not zero, branch to 4415
                LR   DC,Q                ; 43eb 0f                      ;store $01 in $0fe3
                LIS  $1                  ; 43ec 71
                ST                       ; 43ed 17
                LISL 4                   ; 43ee 6c                      ;point at R20 and store $01 in it
                LR   (IS),A              ; 43ef 5c                      
A43f0:          PI   A41c8               ; 43f0 28 41 c8                ;wait for scanline and do clock
                LISL 4                   ; 43f3 6c                      ;decrement R20 and
                DS   (IS)                ; 43f4 3c                      ;branch back to 43da if not zero (more frames to wait)
                BF   $4,A43da            ; 43f5 94 e4
                LIS  $0                  ; 43f7 70
                XS   $8                  ; 43f8 e8                      ;load R8 into A
                LR   J,W                 ; 43f9 1e                      ;load W into J
                DCI  SHIFTSTATE          ; 43fa 2a 0f e2                ;point to Shiftstate (0fe2)
                SL   1                   ; 43fd 13
                LR   $8,A                ; 43fe 58                      ;shift R8 left one place
                LIS  $0                  ; 43ff 70
                XM                       ; 4400 8c                      ;check Shiftstate
                BF   $4,A4404            ; 4401 94 02                   ;if not 0, branch forward to 4404
                DS   $8                  ; 4403 38                      ;else decrement R8
A4404:          DCI  KEYCMDS1            ; 4404 2a 44 f4                ;point to key command table at $4404
                LIS  $7                  ; 4407 77			;7 keys to check
                LR   (IS),A              ; 4408 5c
                LR   A,$8                ; 4409 48			;key that was hit
A440a:          CM                       ; 440a 8d			;see if one of our keys was hit
                BT   4,A4419             ; 440b 84 0d		;yes- call function in jump table
                DS   (IS)                ; 440d 3c			;no- check next key
                BF   $4,A440a            ; 440e 94 fb
A4410:          PI   POPK                ; 4410 28 40 bc	;none of our keys was hit - pop K and return
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
                PI   A45db               ; 4433 28 45 db        ;load rows of text segments with $FF
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
                DCI  REG_VIDEOMODE       ; 44cb 2a 08 f7
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
                
;----------------------------------------
;Subroutine "Wait for scanline"... waits for a given scanline to be reached
;
;Parameters: $0fe5 contains the scanline to be waited for
;Trashes: K, DC0, A

WAITSCANLINE:   LR   K,P                 ; 4501 08              ;save return address
                DCI  $0fe5               ; 4502 2a 0f e5        ;load data counter with address $0fe5 
                LM                       ; 4505 16              ;load data from $0fe5 into A

;If jumped here, the subroutine waits for the scanline given in A to be reached

A4506:          DCI  $08fb               ; 4506 2a 08 fb        ;load data counter with address $08fb (current scanline LSB)
                CM                       ; 4509 8d	        ;compare scanline with value in A
                BF   $2,A4506            ; 450a 92 fb           ;loop if not yet reached
                PK                       ; 450c 0c              ;return

SETCLOCK:
                DCI  $0fe6               ; 450d 2a 0f e6	CLOCK hit from main menu
                LI   $45                 ; 4510 20 45
                ST                       ; 4512 17
                LI   $16                 ; 4513 20 16
                ST                       ; 4515 17
                LIS  $0                  ; 4516 70
                LR   $3,A                ; 4517 53
                PI   SETUPSTACK          ; 4518 28 40 d0
                PI   A45db               ; 451b 28 45 db        ;load rows of text segments with $FF
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

;Here is another often called subroutine which initializes some bytes
;This is also called at startup from cartridges like Gladiator
                
A45db:          LR   K,P                 ; 45db 08              save return address
                PI   PUSHK               ; 45dc 28 40 a9        push return address onto stack
                PI   A4762               ; 45df 28 47 62        initialize starting rows of segments with $FF
                
                DCI  A463e               ; 45e2 2a 46 3e        point to $463E 
                XDC                      ; 45e5 2c 
                DCI  $0ffa               ; 45e6 2a 0f fa        point to $0FFA
                LIS  $4                  ; 45e9 74              load $04 into A
                LISU 2                   ; 45ea 62              point to R16
                LISL 0                   ; 45eb 68              
                LR   (IS),A              ; 45ec 5c              store $04 into R16 (counter)
                PI   COPYMEMTOMEM        ; 45ed 28 43 cd 	copy 4 bytes from 463e to ffa $09,$00,$46,$47
                
                PI   CLRSCREEN           ; 45f0 28 41 d5        clear screen (and other functions)
                LIS  $5                  ; 45f3 75              load $05 into A
                LR   (IS),A              ; 45f4 5c              store into R16
                DCI  A4642               ; 45f5 2a 46 42        point to $4642
                XDC                      ; 45f8 2c
                DCI  $0ffb               ; 45f9 2a 0f fb        
                PI   COPYMEMTOMEM        ; 45fc 28 43 cd	copy 5 bytes from 4642 to ffb $01,$0f,$b1,$0f,$b1; this overwrites all previously written bytes

;this initializes the area which says where the object data should start
;$0f b1 at $ffb says the data gets fetched from $0fb1 on
                
                LI   $12                 ; 45ff 20 12           load $12 into A
                LR   (IS),A              ; 4601 5c              store into R16
                DCI  $0fb1               ; 4602 2a 0f b1        point to $0fb1
                PI   COPYMEMTOMEM        ; 4605 28 43 cd	copy 18 bytes from 4647 to fb1
                
                XDC                      ; 4608 2c              
                LIS  $9                  ; 4609 79
                ADC                      ; 460a 8e
                LR   (IS),A              ; 460b 5c
                XDC                      ; 460c 2c
                PI   COPYMEMTOMEM        ; 460d 28 43 cd	copy 9 bytes from 4659 to fcc

;store contents of $0fe8 into R8
                
                DCI  $0fe8               ; 4610 2a 0f e8        load contents of $0fe8
                LM                       ; 4613 16
                LR   $8,A                ; 4614 58              store into R8

;Bytes $0fba through $0fc1 get manipulated as follows: x = (x AND 1f) XOR ($0fe8)

A4615:          DCI  $0fba               ; 4615 2a 0f ba     
                LIS  $8                  ; 4618 78
                LR   (IS),A              ; 4619 5c              store $08 into R16
A461a:          LI   $1f                 ; 461a 20 1f           load $1f into A
                LR   H,DC                ; 461c 11              copy dc into 8
                NM                       ; 461d 8a              a = a AND memory content
                XS   $8                  ; 461e e8              a = a XOR R8
                LR   DC,H                ; 461f 10              restore DC to address where a was fetched from
                ST                       ; 4620 17              store a
                DS   (IS)                ; 4621 3c              decrement R16
                BF   $4,A461a            ; 4622 94 f7           loop back if not zero
                
                DCI  SHIFTSTATE          ; 4624 2a 0f e2        clear $0fe2 (shiftstate)
                LIS  $0                  ; 4627 70
                ST                       ; 4628 17            
                
                DCI  $0fda               ; 4629 2a 0f da        check $0fda
                XM                       ; 462c 8c              doesn't change since A = 0
                BT   4,A463b             ; 462d 84 0d           skips FILLMEM calls if $0fda = 0
                DCI  $0fb1               ; 462f 2a 0f b1
                PI   FILLMEM             ; 4632 28 44 eb        copies byte at DC0 to DC0+1, DC0+2, ... DC0+6 ($0Fb1 -> $0fb2 through $0fb7)
                DCI  $0fba               ; 4635 2a 0f ba
                PI   FILLMEM             ; 4638 28 44 eb        copies byte at DC0 to DC0+1, DC0+2, ... DC0+6 ($0fba -> $0fbb through $0fc0)
A463b:          JMP  A41cc               ; 463b 29 41 cc        ;wait for scanline, call clock routine and return

A463e:			db   $09,$00,$46,$47					;memcopied to ffa
				;note         ^^^^^^

A4642:			db   $01,$0f,$b1,$0f,$b1				;memcopied to ffb
     
;$4647 - contains the default pointers into the bitmap area of each line (segment)
;first all Y (scanline) LSB's, then the MSB and color values (16 bytes each)
;This gives the address where each segment's graphics data is starting along with its color
;after that, there comes the segment heights for the lines

                  
     			db   $2f,$9f,$0f,$7f,$ef,$5f,$cf,$00,$00,$ec,$ec,$ed,$ed,$ed,$ee,$ee,$e0,$00	;memcopied to fb1
     			
     			db   $70,$70,$70,$70,$70,$70,$70,$61,$01	;memcopied to fc3
                                
                db   $07,$07,$07,$07,$07,$07,$07,$01,$08	;memcopied to fcc - these are the heights of lines
                
                db   $20,$20,$20,$20,$20,$20,$20,$20,$90,$30    ;default y positions of lines (starting with last $30)
                            
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

                LR   K,P                 ; 4686 08     ;save return address
                LISU 2                   ; 4687 62     ;point to R16
A4688:          LISL 0                   ; 4688 68
                LM                       ; 4689 16     ;load from DC0 (wherever it got set) - source address
                LR   $8,A                ; 468a 58     ;store into R8
                LIS  $1                  ; 468b 71     ;store 1 in R7
                LR   $7,A                ; 468c 57
                LIS  $0                  ; 468d 70     ;clear R6
                LR   $6,A                ; 468e 56
A468f:          LIS  $0                  ; 468f 70
                XS   $8                  ; 4690 e8     ;check R8
                BT   1,A4696             ; 4691 81 04  ;if positive, branch to 4696
                LR   A,$6                ; 4693 46     ;otherwise R6 = R6 EOR R7
                XS   $7                  ; 4694 e7
                LR   $6,A                ; 4695 56
A4696:          LR   A,$8                ; 4696 48     ;shift R8 one bit to the left
                SL   1                   ; 4697 13
                LR   $8,A                ; 4698 58
                LR   A,$7                ; 4699 47     ;shift R7 one bit to the left
                SL   1                   ; 469a 13
                LR   $7,A                ; 469b 57
                BF   $4,A468f            ; 469c 94 f2   ;branch if not zero (last bit in R7 has been shifted out) back to 468f
                XDC                      ; 469e 2c      ;now pointing to destination address
                LR   A,$6                ; 469f 46      ;store R6 in destination address
                ST                       ; 46a0 17
                LR   A,(IS)+             ; 46a1 4d      ;load A from (IS) and add to destination
                ADC                      ; 46a2 8e
                XDC                      ; 46a3 2c     ;now pointing to source address
                LR   A,(IS)+             ; 46a4 4d     ;load A from (IS) and add to source
                ADC                      ; 46a5 8e
                DS   (IS)                ; 46a6 3c     ;decrement (IS)
                BF   $4,A4688            ; 46a7 94 e0  ;if not zero, loop back to 4688
                PK                       ; 46a9 0c     ;return

;another subroutine, probably involving the cursor movement, text characters or something like that
;This one does get called by Settime

A46aa:          LR   K,P                 ; 46aa 08        ;save return address
                PI   PUSHK               ; 46ab 28 40 a9  ;push it onto stack
                XDC                      ; 46ae 2c        ;swap DC's
                DCI  $0fcf               ; 46af 2a 0f cf  ;decrease $0fcf by one
                LI   $ff                 ; 46b2 20 ff
                AMD                      ; 46b4 89
                DCI  $0fcf               ; 46b5 2a 0f cf
                ST                       ; 46b8 17
                LM                       ; 46b9 16        ;load contents of $0fd0, just to advance memory pointer
                LI   $ff                 ; 46ba 20 ff     ;trash it again by loading $ff instead
                AMD                      ; 46bc 89        ;decrease $0fd1 by one
                DCI  $0fd1               ; 46bd 2a 0f d1  ;and store back
                ST                       ; 46c0 17
                LIS  $8                  ; 46c1 78        ;store $08 in (IS)
                LR   (IS),A              ; 46c2 5c
                DCI  $0fcc               ; 46c3 2a 0f cc  ;point to $0fcc
                LIS  $0                  ; 46c6 70
                XS   $3                  ; 46c7 e3        ;check R3
                BF   $4,A46ce            ; 46c8 94 05     ;branch if not zero forward to A64c
                LIS  $2                  ; 46ca 72        ;otherwise increase DC0 by two
                ADC                      ; 46cb 8e
                LIS  $6                  ; 46cc 76        ;and store $06 in (IS)
                LR   (IS),A              ; 46cd 5c
A46ce:          XDC                      ; 46ce 2c
                PI   COPYMEMTOMEM        ; 46cf 28 43 cd	copy 8 or 6 bytes from address given in DC0 on call to $0fcc
                PI   POPK                ; 46d2 28 40 bc   ;pop return address
                PK                       ; 46d5 0c         ;return


;The following routine gets called from cartridge to enable sound. It turns on the scanline interrupt
;and sets it to $4647 where the code resides to handle sound via the scanline interrupt. See explanation below...

                DI                       ; 46d6 1a			;called from cartridges - Disable interrupt
                LI   $46                 ; 46d7 20 46                   ;load $46 into A
                OUTS 12                  ; 46d9 bc			;3853 interrupt addr vector hi
                LI   $f7                 ; 46da 20 f7
                OUTS 13                  ; 46dc bd			;3853 interrupt addr vector lo
                DCI  VIDEOMODE           ; 46dd 2a 0f ea                ;point to video mode
                LIS  $8                  ; 46e0 78                      ;load $08 into A
                OM                       ; 46e1 8b                      ;A = A OR video mode
                NI   $fd                 ; 46e2 21 fd                   ;A = A AND $FD (immediate)
                DCI  VIDEOMODE           ; 46e4 2a 0f ea                ;point to video mode again
                ST                       ; 46e7 17                      ;store A into video mode
                LISU 4                   ; 46e8 64                      ;point to R38
                LISL 6                   ; 46e9 6e
                DCI  $08fa               ; 46ea 2a 08 fa                ;point to $08FA (Y-Freeze MSB and odd/even)
                LM                       ; 46ed 16                      ;load contents of $08FA into RAM
                NI   $80                 ; 46ee 21 80                   ;A = A AND $80 (immediate) - keeps only Y-Freeze MSB
                SR   4                   ; 46f0 14                      ;shift right 4 bits
                LR   (IS)-,A             ; 46f1 5e                      ;store in R38, point to R37
                LIS  $2                  ; 46f2 72                      ;load $02 into A
                AM                       ; 46f3 88                      ;A = A + ($08FB) (Current scanline LSB)
                LR   (IS),A              ; 46f4 5c                      ;store A in R37
                BF   $0,A46f8            ; 46f5 90 02                   ;immediate jump to A46F8
                
                ;46f7 = 0100 0110 1111 0111 bit 7=1 must be 1 for ext int

;INTERRUPT ROUTINE FOR SCANLINE SOUND INTERRUPT
;----------------------------------------------
;
;This routine executes whenever the 3853 interrupt occurs. It actually handles sound output as follows:
;The host program has to set the interrupt by calling $46ce above.
;The interrupt routine first saves the values of A, W, IS, Q and DC in temporary registers (R0, J, R32, R33, R34 and Q)
;Those are fetched back at the end.
;There are some registers that control sound output, out of which two are set by the host program:
;R35 is a yet unknown parameter which gets set to $03 for low notes or $0b for high notes... don't know what results from this.
;Anyway, that value gets output to the sound line alternating with $00.
;R36 should contain the period of the wave. THis is the number of scanlines between a transition of 1 to 0 or vice-versa.
;
;Additionally, R37 contains the LSB of the scanline where an interrupt should occur, while R38 contains the most significant bit of it.
;Everytime the interrupt occurs, the sound line gets inverted.
;Then the next scanline where it should occur gets computed from the given period in R36 and stored into the video chip.
;
;Note that if you turn on sound, you should leave R35 through R38 alone, and expect to lose some CPU time for sound generation.
;The higher the note is, the more CPU time you will lose!

INT3853:        LR   $0,A                ; 46f7 50		;3853 interrupt points here (from $46d6 above); store A in R0
A46f8:          LR   J,W                 ; 46f8 1e                      ;copy W to J
                LR   A,IS                ; 46f9 0a                      ;copy IS to A
                LISU 4                   ; 46fa 64                      ;point to R32
                LISL 0                   ; 46fb 68
                LR   (IS)+,A             ; 46fc 5d                      ;store A into R32
                LR   A,QU                ; 46fd 02                      ;store QU into R33 and QL into R34
                LR   (IS)+,A             ; 46fe 5d
                LR   A,QL                ; 46ff 03
                LR   (IS)+,A             ; 4700 5d
                LR   Q,DC                ; 4701 0e                      ;store DC in Q -> end of "save registers"

;decide if sound bit should be turned on or off

                LIS  $8                  ; 4702 78                      ;load $08 into A
                SL   4                   ; 4703 15                      ;make it $80
                XS   (IS)                ; 4704 ec                      ;EOR A with R35 (unknown parameter for music - is $03 on low and $0b on high notes)
                LR   (IS),A              ; 4705 5c                      ;store into R35 -> R35 = R35 EOR $80
                BT   1,A4709             ; 4706 81 02                   ;if positive, branch to 4709, otherwise set to 0
                LIS  $0                  ; 4708 70                      ;clear output 0 or set it to value of R35 ($03 / $0b)
A4709:          OUTS 0                   ; 4709 b0		;keyboard columns/joystick pot's -> set to either 0 or 
                DCI  $0fde               ; 470a 2a 0f de                ;point to $0fde
                LIS  $1                  ; 470d 71                      ;load $10 into A
                SL   4                   ; 470e 15
                XM                       ; 470f 8c                      ;XOR with memory at $0fde -> output ($0fde) XOR $10 on port 1
                OUTS 1                   ; 4710 b1		;keyboard rows/joystick buttons
                XI   $10                 ; 4711 23 10                   ;XOR immediate            -> output ($0fde) on port 1
                OUTS 1                   ; 4713 b1		;keyboard rows/joystick buttons

;calculate next scanline to generate interrupt

                LR   A,(IS)              ; 4714 4c                      ;load R35 into A
                SL   4                   ; 4715 15                      ;shift left 4 places ($03/83 becomes $30, $0b/8b becomes $B0)
                AS   (IS)+               ; 4716 cd                      ;add R35 (= R35 * 17)     (-> $33 / $BB)
                LR   A,(IS)+             ; 4717 4d                      ;load A with contents of R36 (sound period) 
                BF   $2,A471b            ; 4718 92 02                   ;if R35 * 17 invokes carry (R35 was > 15), add 1 to A (sound period)
                INC                      ; 471a 1f                      ;this means that for the "up" phase, there will be one more scanline
A471b:          AS   (IS)                ; 471b cc                      ;add R37
                LR   (IS)+,A             ; 471c 5d                      ;store in R37 -> R37 = R37 + (R36 + (Carry of R35?))
                LR   A,(IS)              ; 471d 4c                      ;load R38 from A
                LNK                      ; 471e 19                      ;add carry if set
                LR   (IS)-,A             ; 471f 5e                      ;store in R38 -> R38 = R38 + carry of adding R37
                NI   $01                 ; 4720 21 01                   ;only keep lowest bit of A (R38) (= highest bit of scanline)
                BT   4,A4734             ; 4722 84 11                   ;branch if zero to 4734 (-> branch if (R38 + carry of adding R37) and 1 = 0
                LR   A,(IS)              ; 4724 4c                      ;compare R37 to $06 (because for scanlines $1xx, only 6 scanlines exist)
                CI   $06                 ; 4725 25 06                   ;branch if carry set (bigger than $06) to 4734 (-> if R37 > $06 then 4734)
                BT   2,A4734             ; 4727 82 0c
                AI   $fa                 ; 4729 24 fa                   ;add $FA to A (Value from R37) and store in R37 (-> subtract 6), point to R38
                LR   (IS)+,A             ; 472b 5d                      ;I think this basically skips the scanlines from 262 through 511.                   
                LIS  $8                  ; 472c 78                      ;load #08 to A
                NS   (IS)                ; 472d fc                      ;A = A AND R38
                XI   $08                 ; 472e 23 08                   ;A = (A AND R38) EOR $08
                LR   (IS)-,A             ; 4730 5e                      ;R38 = (R38 AND 8) EOR $08 -> clears bit 4 from R38, point to R37
                BT   4,A4734             ; 4731 84 02                   ;branch on zero; if (A AND R38) EOR $08 wasn't 0, decrement R37
                DS   (IS)                ; 4733 3c
A4734:          DCI  $08f0               ; 4734 2a 08 f0                ;point to $08F0 (Y-interrupt register)
                LR   A,(IS)+             ; 4737 4d                      ;store R37 in $08F0 (scanline where next interrupt should occur)
                ST                       ; 4738 17
                LR   A,(IS)+             ; 4739 4d                      ;load R38 into A, point to R39
                SL   4                   ; 473a 15                      ;shift left 4 places
                SR   1                   ; 473b 12                      ;shift right 1 place
                SL   4                   ; 473c 15                      ;shift left 4 places -> places lowest bit of R38 in highest bit
                LR   (IS),A              ; 473d 5c                      ;store in R39 -> R39 = (R38 * 128)
                DCI  VIDEOMODE           ; 473e 2a 0f ea                ;point to Videomode ($0fea)
                LM                       ; 4741 16                      ;load into A
                NI   $7f                 ; 4742 21 7f                   ;and #7F
                XS   (IS)                ; 4744 ec                      ;XOR with R39 (changes high bit = Y-Interrupt MSB)
                DCI  REG_VIDEOMODE       ; 4745 2a 08 f7                ;point to reg_videomode ($08f7 = command register)
                ST                       ; 4748 17                      ;store into command register
                DCI  VIDEOMODE           ; 4749 2a 0f ea                ;store back into videomode -> videomode = videomode AND #7F EOR R39
                ST                       ; 474c 17
                LI   $f2                 ; 474d 20 f2                   ;increase DC0 by $F2 (to 10DC?!)
                ADC                      ; 474f 8e
                LM                       ; 4750 16                      ;fetch byte from $10DC (cartridge area?!)
                OUTS 0                   ; 4751 b0		;keyboard columns/joystick pots

                LISL 2                   ; 4752 6a                      ;point to R34 -> start of "fetch saved values" before return
                LR   DC,Q                ; 4753 0f                      ;copy Q into DC
                LR   A,(IS)-             ; 4754 4e                      ;fetch Q from R34, R33
                LR   QL,A                ; 4755 07
                LR   A,(IS)-             ; 4756 4e
                LR   QU,A                ; 4757 06
                LR   A,(IS)              ; 4758 4c                      ;fetch A from R32 and load into IS
                LR   IS,A                ; 4759 0b
                LIS  $1                  ; 475a 71		;enable external int, disable timer int
                OUTS 14                  ; 475b be		;3853 interrupt control
                SL   4                   ; 475c 15                      ;makes it $10
                XS   $9                  ; 475d e9                      ;XOR with R9
                LR   $9,A                ; 475e 59                      ;and store in R9
                LR   A,$0                ; 475f 40                      ;load R0 into A
                LR   W,J                 ; 4760 1d                      ;load J into W
                POP                      ; 4761 1c                      ;return (whatever...)
     
;subroutine for storing $FF into memory addresses $0850 through $0859
;These addresses contain the segment starting rows for (lower bytes) for list A
           
A4762:          LR   K,P                 ; 4762 08             ;save return address
                DCI  $0850               ; 4763 2a 08 50       ;load data counter with $0850
                LIS  $4                  ; 4766 74             ;load a with $04
                SL   4                   ; 4767 15             ;shift left 4 positions -> becomes $40
                LR   $8,A                ; 4768 58             ;store into register 8
                LI   $ff                 ; 4769 20 ff          ;load a with $FF
A476b:          ST                       ; 476b 17             ;store $FF into $0850 (referenced by data counter and increment data counter)
                DS   $8                  ; 476c 38             ;decrement register 8
                BF   $4,A476b            ; 476d 94 fd          ;loop back if not zero
                PK                       ; 476f 0c             ;return

PUSHGTEXT:		;PUSH G TO START
                db   $25,$03,$21,$19,$00,$1B,$00,$07,$13,$00,$21,$07,$11,$09,$07,$00
                                
A4780:			db   $38,$4e,$64,$78,$8e,$a4,$bc,$40,$56,$6c,$80,$96,$ac,$c4
                
A478e:          db   $aa,$f5,$40,$00,$e0,$04,$64		;memcopied to fe4

;The following subroutine manipulates memory addresses $0fdb and $0fdc like this (Pseudocode in BASIC):
;R11 = ($0fdb)
;R10 = ($0fdc)
;R8 = ($0fdc * 16) + (R11 / 16)
;($0fdb) = (R11 * 17) + 1
;($0fdc) = R10 + (R11 * 17 + 1) / 256 + R8
;
;which can be further simplified (or complicated?) as:
;$0fdb = $0fdb * 17 + 1
;$0fdc = $0fdc + ($0fdb * 17 + 1) / 256 + ($0fdc * 16) + ($0fdb / 16)
;
;seems like shifting a 16-bit number contained in $0fdb (LSB) and $0fdc (MSB) 4 places to the left, or something like that
                
                LR   K,P                 ; 4795 08              ;save return address
                DCI  $0fdb               ; 4796 2a 0f db        ;load data counter with $0fdb
                LR   Q,DC                ; 4799 0e              ;copy into Q
                LM                       ; 479a 16              ;load $0fdb-$0fdc into R11/R10
                LR   $b,A                ; 479b 5b
                LM                       ; 479c 16
                LR   $a,A                ; 479d 5a
                SL   4                   ; 479e 15              ;shift left 4 positions
                LR   $8,A                ; 479f 58              ;store in R8 -> R8 = $0fdc * 16
                LR   A,$b                ; 47a0 4b              ;retrieve R11 (formerly $0fdb)
                SR   4                   ; 47a1 14              ;shift right 4 places
                XS   $8                  ; 47a2 e8              ;EOR with R8
                LR   $8,A                ; 47a3 58              ;store in R8 -> R8 = $0fdc * 16 + $0fdb / 16
                LR   A,$b                ; 47a4 4b              ;load R11 (formerly $0fdb)
                SL   4                   ; 47a5 15              ;shift left 4 places and increase by 1
                INC                      ; 47a6 1f
                AS   $b                  ; 47a7 cb              ;add R11 again
                LR   DC,Q                ; 47a8 0f              ;retrieve DC $0fdb from Q
                ST                       ; 47a9 17              ;store R11 into $0fdb -> $0fdb = $0fdb * 17 + 1
                LR   A,$a                ; 47aa 4a              ;load from register 10
                LNK                      ; 47ab 19              ;add carry from addition of R11 above
                AS   $8                  ; 47ac c8              ;add R8
                ST                       ; 47ad 17              ;store in $0fdc -> $0fdc = ($0fdc * 16 + $0fdb / 16) + ($0fdb * 17 + 1) / 256
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
				