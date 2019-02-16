

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || 
(0002)                            || ;- Programmers: Abesh Mubaraki and Vince Jison
(0003)                            || ;- Date: 26 Feb 2011
(0004)                            || ;- Version: 1a
(0005)                            || ;--------------------------------------------------------------------
(0006)                            || ;-######## Case #3 - BRN, BREQ, BRNE, BRCS, BRCC, CLC, SEC ########-;
(0007)                            || ;--------------------------------------------------------------------
(0008)                            || ;-
(0009)                            || ;- Version 1a update: TABs were removed and replaced with spaces
(0010)                            || ;-
(0011)                            || ;-
(0012)                            || ;- This test case switches on the LEDs on the Nexys2 from right to
(0013)                            || ;- left (LD0 to LD7) for each successful test.
(0014)                            || ;- There is about half a second delay in between each test.
(0015)                            || ;- The correspondence between the test and LEDs is as follows:
(0016)                            || ;- 	BRN	LD0
(0017)                            || ;- 	BREQ	LD1
(0018)                            || ;- 	BRNE	LD2
(0019)                            || ;- 	BRCS	LD3
(0020)                            || ;- 	BRCC	LD4
(0021)                            || ;- 	CLC	LD5
(0022)                            || ;- 	SEC	LD6 and LD7
(0023)                            || ;-
(0024)                            || ;- Some other operations that are used in this test case are
(0025)                            || ;- 	ADD	SUB	EXOR	LSR	MOV	OUT	OR
(0026)                            || ;-
(0027)                            || ;- LEDs must turn on from 0 to 7 to indicate a successful test.
(0028)                            || ;-
(0029)                            || ;--------------------------------------------------------------------
(0030)                            || 
(0031)                            || ;--------------------------------------------------------------------
(0032)                            || ;- Port Constants
(0033)                            || ;--------------------------------------------------------------------
(0034)                       032  || .EQU SWITCH_PORT = 0x20       ; port for switches ----- INPUT
(0035)                       064  || .EQU LED_PORT    = 0x40         ; port for LED output --- OUTOUT
(0036)                       255  || .EQU BTN_PORT    = 0xFF         ; port for button input - INPUT
(0037)                            || ;--------------------------------------------------------------------
(0038)                            || 
(0039)                            || ;--------------------------------------------------------------------
(0040)                            || ;- Misc Constants
(0041)                            || ;--------------------------------------------------------------------
(0042)                            || 
(0043)                       001  || .EQU B0_MASK = 0x01             ; mask all but bit0
(0044)                       002  || .EQU B1_MASK = 0x02             ; mask all but bit1
(0045)                       004  || .EQU B2_MASK = 0x04             ; mask all but bit2
(0046)                       008  || .EQU B3_MASK = 0x08             ; mask all but bit3
(0047)                       016  || .EQU B4_MASK = 0x10             ; mask all but bit4
(0048)                       032  || .EQU B5_MASK = 0x20             ; mask all but bit5
(0049)                       064  || .EQU B6_MASK = 0x40             ; mask all but bit6
(0050)                       128  || .EQU B7_MASK = 0x80             ; mask all but bit7
(0051)                            ||  
(0052)                       255  || .EQU INSIDE_FOR_COUNT  = 0xFF   ; These three contestants set the
(0053)                       255  || .EQU MIDDLE_FOR_COUNT  = 0xFF   ; amount of delay between each test.
(0054)                       096  || .EQU OUTSIDE_FOR_COUNT = 0x60   ; Current time delay is about 503 mS.
(0055)                            || ;- 	Setting the last constant to FF will give a 1.3 sec delay.
(0056)                            || 
(0057)                            || ;--------------------------------------------------------------------
(0058)                            || 
(0059)                            || ;--------------------------------------------------------------------
(0060)                            || 
(0061)                            || .DSEG
(0062)                       000  || .ORG   0x00
(0063)                            || 
(0064)                            || ;--------------------------------------------------------------------
(0065)                            || 
(0066)                            || ;--------------------------------------------------------------------
(0067)                            || 
(0068)                            || .CSEG
(0069)                       064  || .ORG   0x40
(0070)                            || 
(0071)                            || 
(0072)  CS-0x040  0x36A00  0x040  || Main:         MOV R10, 0x00             ; R10 used to outputs to LEDs
(0073)  CS-0x041  0x36B00         ||               MOV R11, 0x00             ;
(0074)  CS-0x042  0x08650         ||               BRN 0xCA                  ;
(0075)  CS-0x043  0x28B00  0x043  || Zero_Down:    ADD R11, 0x00             ; Zero flag set
(0076)  CS-0x044  0x08392         ||               BREQ Check_One            ;
(0077)  CS-0x045  0x28B01  0x045  || One_Down:     ADD R11, 0x01             ; Zero flag cleared
(0078)  CS-0x046  0x08403         ||               BRNE Check_Two            ;
(0079)  CS-0x047  0x28BFF  0x047  || Two_Down:     ADD R11, 0xFF             ; Carry flag set
(0080)  CS-0x048  0x0A470         ||               BRCS Check_Three          ;
(0081)  CS-0x049  0x36B00  0x049  || Three_Down:   MOV R11, 0x00             ;
(0082)  CS-0x04A  0x28B01         ||               ADD R11, 0x01             ; Carry flag cleared
(0083)  CS-0x04B  0x0A4E1         ||               BRCC Check_Four           ;
(0084)  CS-0x04C  0x28BFF  0x04C  || Four_Down:    ADD R11, 0xFF             ; Carry flag set & R1 = 0x00
(0085)  CS-0x04D  0x18000         ||               CLC                       ; Carry flag cleared
(0086)  CS-0x04E  0x10B01         ||               LSR R11                   ; Moving the C value in
(0087)  CS-0x04F  0x10B01         ||               LSR R11                   ; 	proper location to
(0088)  CS-0x050  0x10B01         ||               LSR R11                   ; 	test it.
(0089)  CS-0x051  0x24B20         ||               EXOR R11, B5_MASK         ;
(0090)  CS-0x052  0x00A5A         ||               EXOR R10, R11             ; Entering the test result
(0091)  CS-0x053  0x34A40         ||               OUT R10, LED_PORT         ; 	to R10
(0092)                            || 
(0093)                            || ; Delay ----------------------------------------------------------------
(0094)  CS-0x054  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0095)  CS-0x055  0x2C101  0x055  || outside_one:  SUB R1, 0x01
(0096)  CS-0x056  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0097)  CS-0x057  0x2C201  0x057  || middle_one:   SUB R2, 0x01
(0098)  CS-0x058  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0099)  CS-0x059  0x2C301  0x059  || inside_one:   SUB R3, 0x01
(0100)  CS-0x05A  0x082CB         ||               BRNE inside_one
(0101)  CS-0x05B  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0102)  CS-0x05C  0x082BB         ||               BRNE middle_one
(0103)  CS-0x05D  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0104)  CS-0x05E  0x082AB         ||               BRNE outside_one
(0105)                            || 
(0106)  CS-0x05F  0x36B00  0x05F  || Five_down:    MOV R11, 0x00             ;
(0107)  CS-0x060  0x18001         ||               SEC                       ;
(0108)  CS-0x061  0x10B01         ||               LSR R11                   ;
(0109)  CS-0x062  0x00A5A         ||               EXOR R10, R11             ;
(0110)  CS-0x063  0x10B01         ||               LSR R11                   ;
(0111)  CS-0x064  0x00A5A         ||               EXOR R10, R11             ;
(0112)  CS-0x065  0x34A40         ||               OUT R10, LED_PORT         ;
(0113)                            || 
(0114)                            || ; Delay ----------------------------------------------------------------
(0115)  CS-0x066  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0116)  CS-0x067  0x2C101  0x067  || outside_two:  SUB R1, 0x01
(0117)  CS-0x068  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0118)  CS-0x069  0x2C201  0x069  || middle_two:   SUB R2, 0x01
(0119)  CS-0x06A  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0120)  CS-0x06B  0x2C301  0x06B  || inside_two:   SUB R3, 0x01
(0121)  CS-0x06C  0x0835B         ||               BRNE inside_two
(0122)  CS-0x06D  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0123)  CS-0x06E  0x0834B         ||               BRNE middle_two
(0124)  CS-0x06F  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0125)  CS-0x070  0x0833B         ||               BRNE outside_two
(0126)                            || 
(0127)  CS-0x071  0x08200  0x071  || Six_down:     Brn Main                  ;
(0128)                            ||                                         ;
(0129)                            ||                                         ;<-Code dies when it crosses
(0130)                            ||                                         ;	this border
(0131)                            ||                                         ;
(0132)                            ||                                         ; Step aside Janet Napolitano
(0133)                            || ;--------------------------------------------------------------------
(0134)                            || 
(0135)  CS-0x072  0x22A02  0x072  || Check_One:    OR R10, B1_MASK
(0136)  CS-0x073  0x34A40         ||               OUT R10, LED_PORT
(0137)                            || 
(0138)                            || ; Delay ----------------------------------------------------------------
(0139)  CS-0x074  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0140)  CS-0x075  0x2C101  0x075  || outside_tre:  SUB R1, 0x01
(0141)  CS-0x076  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0142)  CS-0x077  0x2C201  0x077  || middle_tre:   SUB R2, 0x01
(0143)  CS-0x078  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0144)  CS-0x079  0x2C301  0x079  || inside_tre:   SUB R3, 0x01
(0145)  CS-0x07A  0x083CB         ||               BRNE inside_tre
(0146)  CS-0x07B  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0147)  CS-0x07C  0x083BB         ||               BRNE middle_tre
(0148)  CS-0x07D  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0149)  CS-0x07E  0x083AB         ||               BRNE outside_tre
(0150)                            || 
(0151)  CS-0x07F  0x08228         ||               BRN One_Down
(0152)                            ||                 
(0153)  CS-0x080  0x22A04  0x080  || Check_Two:    OR R10, B2_MASK
(0154)  CS-0x081  0x34A40         ||               OUT R10, LED_PORT
(0155)                            || 
(0156)                            || ; Delay ----------------------------------------------------------------
(0157)  CS-0x082  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0158)  CS-0x083  0x2C101  0x083  || outside_for:  SUB R1, 0x01
(0159)  CS-0x084  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0160)  CS-0x085  0x2C201  0x085  || middle_for:   SUB R2, 0x01
(0161)  CS-0x086  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0162)  CS-0x087  0x2C301  0x087  || inside_for:   SUB R3, 0x01
(0163)  CS-0x088  0x0843B         ||               BRNE inside_for
(0164)  CS-0x089  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0165)  CS-0x08A  0x0842B         ||               BRNE middle_for
(0166)  CS-0x08B  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0167)  CS-0x08C  0x0841B         ||               BRNE outside_for
(0168)                            || 
(0169)  CS-0x08D  0x08238         ||               BRN Two_Down
(0170)                            ||               
(0171)  CS-0x08E  0x22A08  0x08E  || Check_Three:  OR R10, B3_MASK
(0172)  CS-0x08F  0x34A40         ||               OUT R10, LED_PORT
(0173)                            || 
(0174)                            || ; Delay ----------------------------------------------------------------
(0175)  CS-0x090  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0176)  CS-0x091  0x2C101  0x091  || outside_fiv:  SUB R1, 0x01
(0177)  CS-0x092  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0178)  CS-0x093  0x2C201  0x093  || middle_fiv:   SUB R2, 0x01
(0179)  CS-0x094  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0180)  CS-0x095  0x2C301  0x095  || inside_fiv:   SUB R3, 0x01
(0181)  CS-0x096  0x084AB         ||               BRNE inside_fiv
(0182)  CS-0x097  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0183)  CS-0x098  0x0849B         ||               BRNE middle_fiv
(0184)  CS-0x099  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0185)  CS-0x09A  0x0848B         ||               BRNE outside_fiv
(0186)                            || 
(0187)  CS-0x09B  0x08248         ||               BRN Three_Down
(0188)                            || 
(0189)  CS-0x09C  0x22A10  0x09C  || Check_Four:   OR R10, B4_MASK
(0190)  CS-0x09D  0x34A40         ||               OUT R10, LED_PORT
(0191)                            || 
(0192)                            || ; Delay ----------------------------------------------------------------
(0193)  CS-0x09E  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0194)  CS-0x09F  0x2C101  0x09F  || outside_six:  SUB R1, 0x01
(0195)  CS-0x0A0  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0196)  CS-0x0A1  0x2C201  0x0A1  || middle_six:   SUB R2, 0x01
(0197)  CS-0x0A2  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0198)  CS-0x0A3  0x2C301  0x0A3  || inside_six:   SUB R3, 0x01
(0199)  CS-0x0A4  0x0851B         ||               BRNE inside_six
(0200)  CS-0x0A5  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0201)  CS-0x0A6  0x0850B         ||               BRNE middle_six
(0202)  CS-0x0A7  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0203)  CS-0x0A8  0x084FB         ||               BRNE outside_six
(0204)                            || 
(0205)  CS-0x0A9  0x08260         ||               BRN Four_Down
(0206)                            || 
(0207)                            || ;--------------------------------------------------------------------
(0208)                            || .CSEG
(0209)                       202  || .ORG   0xCA
(0210)                            || 
(0211)  CS-0x0CA  0x22A01  0x0CA  || Check_Zero:   OR R10, B0_MASK
(0212)  CS-0x0CB  0x34A40         ||               OUT R10, LED_PORT
(0213)                            || 
(0214)                            || ; Delay ----------------------------------------------------------------
(0215)  CS-0x0CC  0x36160         ||               MOV R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
(0216)  CS-0x0CD  0x2C101  0x0CD  || outside_sev:  SUB R1, 0x01
(0217)  CS-0x0CE  0x362FF         ||               MOV R2, MIDDLE_FOR_COUNT	 ;set middle for loop count
(0218)  CS-0x0CF  0x2C201  0x0CF  || middle_sev:   SUB R2, 0x01
(0219)  CS-0x0D0  0x363FF         ||               MOV R3, INSIDE_FOR_COUNT   ;set inside for loop count
(0220)  CS-0x0D1  0x2C301  0x0D1  || inside_sev:   SUB R3, 0x01
(0221)  CS-0x0D2  0x0868B         ||               BRNE inside_sev
(0222)  CS-0x0D3  0x22200         ||               OR R2, 0x00           ;load flags for middle for counter
(0223)  CS-0x0D4  0x0867B         ||               BRNE middle_sev
(0224)  CS-0x0D5  0x22100         ||               OR R1, 0x00           ;load flags for outsde for counter value
(0225)  CS-0x0D6  0x0866B         ||               BRNE outside_sev
(0226)                            || 
(0227)  CS-0x0D7  0x08218         ||               BRN Zero_down;
(0228)                            ||               





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
CHECK_FOUR     0x09C   (0189)  ||  0083 
CHECK_ONE      0x072   (0135)  ||  0076 
CHECK_THREE    0x08E   (0171)  ||  0080 
CHECK_TWO      0x080   (0153)  ||  0078 
CHECK_ZERO     0x0CA   (0211)  ||  
FIVE_DOWN      0x05F   (0106)  ||  
FOUR_DOWN      0x04C   (0084)  ||  0205 
INSIDE_FIV     0x095   (0180)  ||  0181 
INSIDE_FOR     0x087   (0162)  ||  0163 
INSIDE_ONE     0x059   (0099)  ||  0100 
INSIDE_SEV     0x0D1   (0220)  ||  0221 
INSIDE_SIX     0x0A3   (0198)  ||  0199 
INSIDE_TRE     0x079   (0144)  ||  0145 
INSIDE_TWO     0x06B   (0120)  ||  0121 
MAIN           0x040   (0072)  ||  0127 
MIDDLE_FIV     0x093   (0178)  ||  0183 
MIDDLE_FOR     0x085   (0160)  ||  0165 
MIDDLE_ONE     0x057   (0097)  ||  0102 
MIDDLE_SEV     0x0CF   (0218)  ||  0223 
MIDDLE_SIX     0x0A1   (0196)  ||  0201 
MIDDLE_TRE     0x077   (0142)  ||  0147 
MIDDLE_TWO     0x069   (0118)  ||  0123 
ONE_DOWN       0x045   (0077)  ||  0151 
OUTSIDE_FIV    0x091   (0176)  ||  0185 
OUTSIDE_FOR    0x083   (0158)  ||  0167 
OUTSIDE_ONE    0x055   (0095)  ||  0104 
OUTSIDE_SEV    0x0CD   (0216)  ||  0225 
OUTSIDE_SIX    0x09F   (0194)  ||  0203 
OUTSIDE_TRE    0x075   (0140)  ||  0149 
OUTSIDE_TWO    0x067   (0116)  ||  0125 
SIX_DOWN       0x071   (0127)  ||  
THREE_DOWN     0x049   (0081)  ||  0187 
TWO_DOWN       0x047   (0079)  ||  0169 
ZERO_DOWN      0x043   (0075)  ||  0227 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
B0_MASK        0x001   (0043)  ||  0211 
B1_MASK        0x002   (0044)  ||  0135 
B2_MASK        0x004   (0045)  ||  0153 
B3_MASK        0x008   (0046)  ||  0171 
B4_MASK        0x010   (0047)  ||  0189 
B5_MASK        0x020   (0048)  ||  0089 
B6_MASK        0x040   (0049)  ||  
B7_MASK        0x080   (0050)  ||  
BTN_PORT       0x0FF   (0036)  ||  
INSIDE_FOR_COUNT 0x0FF   (0052)  ||  0098 0119 0143 0161 0179 0197 0219 
LED_PORT       0x040   (0035)  ||  0091 0112 0136 0154 0172 0190 0212 
MIDDLE_FOR_COUNT 0x0FF   (0053)  ||  0096 0117 0141 0159 0177 0195 0217 
OUTSIDE_FOR_COUNT 0x060   (0054)  ||  0094 0115 0139 0157 0175 0193 0215 
SWITCH_PORT    0x020   (0034)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
