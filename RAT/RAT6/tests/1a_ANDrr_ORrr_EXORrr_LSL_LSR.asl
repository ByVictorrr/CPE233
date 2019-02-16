

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


(0001)                            || ;------------------------------------------------------------------------------------------------------
(0002)                       064  || .EQU LED_PORT		=   	0X40		;port for LED outputs
(0003)                       032  || .EQU SWITCH_PORT	=   	0X20		;port for switch inputs
(0004)                            || ;------------------------------------------------------------------------------------------------------
(0005)                            || 
(0006)                            || ;------------------------------------------------------------------------------------------------------
(0007)                            || ; - Other Constants
(0008)                            || ;------------------------------------------------------------------------------------------------------
(0009)                       001  || .EQU BIT_0_MASK = 0X01
(0010)                       002  || .EQU BIT_1_MASK = 0X02
(0011)                       004  || .EQU BIT_2_MASK = 0X04
(0012)                       008  || .EQU BIT_3_MASK = 0X08
(0013)                       016  || .EQU BIT_4_MASK = 0X10
(0014)                       032  || .EQU BIT_5_MASK = 0X20
(0015)                       064  || .EQU BIT_6_MASK = 0X40
(0016)                       128  || .EQU BIT_7_MASK = 0X80
(0017)                            || 
(0018)                       180  || .EQU INSIDE_FOR_COUNT    = 0xB4
(0019)                       202  || .EQU MIDDLE_FOR_COUNT    = 0xCA
(0020)                       170  || .EQU OUTSIDE_FOR_COUNT   = 0xAA
(0021)                            || 
(0022)                            || ;------------------------------------------------------------------------------------------------------
(0023)                            || 
(0024)                            || ;------------------------------------------------------------------------------------------------------
(0025)                            || ; - Memory Designation Constants
(0026)                            || ;------------------------------------------------------------------------------------------------------
(0027)                            || ;- .DESG
(0028)                            || ;- .ORG	0x00
(0029)                            || ;------------------------------------------------------------------------------------------------------
(0030)                            || 
(0031)                            || ;------------------------------------------------------------------------------------------------------
(0032)                            || ;- Main Program - FIVE DIFFERENT TEST CASES
(0033)                            || ;------------------------------------------------------------------------------------------------------
(0034)                            || 
(0035)                            || .CSEG
(0036)                       064  || .ORG		0x40
(0037)                            || 
(0038)  CS-0x040  0x37400  0x040  || INIT:		MOV 	R20,	0x00	;output register
(0039)  CS-0x041  0x36A00         || 			MOV 	R10, 	0x00	;used to set carry flag
(0040)  CS-0x042  0x36B01         || 			MOV 	R11, 	0x01	;used to set carry flag
(0041)  CS-0x043  0x3610F         || 			MOV 	R1, 	0x0F	;used for logic operations
(0042)  CS-0x044  0x362AA         || 			MOV 	R2, 	0xAA	;used for logic operations
(0043)                            || 
(0044)                            || ;---------------------------------------------------------------
(0045)                            || 
(0046)                            || 
(0047)                            || ;---------------------------------------------------------------
(0048)  CS-0x045  0x04309  0x045  || ANDTest: 		MOV 	R3, R1
(0049)  CS-0x046  0x00310         || 			AND 	R3, R2
(0050)  CS-0x047  0x3030A         || 			CMP 	R3, 0x0A
(0051)                            || 
(0052)  CS-0x048  0x23401         || 			OR 	R20,  BIT_0_MASK
(0053)  CS-0x049  0x35440         || 			OUT 	R20, LED_PORT
(0054)                            || 
(0055)                            || 
(0056)  CS-0x04A  0x371AA  0x04A  || timedelay1:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0057)  CS-0x04B  0x2D101  0x04B  || outside_for1: 	SUB     R17, 0x01
(0058)                            || 
(0059)  CS-0x04C  0x372CA         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0060)  CS-0x04D  0x2D201  0x04D  || middle_for1:  	SUB     R18, 0x01
(0061)                            ||              
(0062)  CS-0x04E  0x373B4         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0063)  CS-0x04F  0x2D301  0x04F  || inside_for1:  	SUB     R19, 0x01
(0064)  CS-0x050  0x0827B         ||              	BRNE    inside_for1
(0065)                            ||              
(0066)  CS-0x051  0x23200         ||              	OR      R18, 0x00              
(0067)  CS-0x052  0x0826B         ||              	BRNE    middle_for1
(0068)                            ||              
(0069)  CS-0x053  0x23100         ||              	OR      R17, 0x00               
(0070)  CS-0x054  0x0825B         ||              	BRNE    outside_for1
(0071)                            || 
(0072)                            || ;---------------------------------------------------------------
(0073)  CS-0x055  0x04409  0x055  || ORTest:			MOV 	R4, R1
(0074)  CS-0x056  0x00411         || 			OR 	R4, R2
(0075)  CS-0x057  0x304AF         || 			CMP 	R4, 0XAF
(0076)  CS-0x058  0x082DB         || 			BRNE 	timedelay2
(0077)                            || 
(0078)  CS-0x059  0x23402         || 			OR 	R20, BIT_1_MASK
(0079)  CS-0x05A  0x35440         || 			OUT 	R20, LED_PORT
(0080)                            || 
(0081)  CS-0x05B  0x371AA  0x05B  || timedelay2:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0082)  CS-0x05C  0x2D101  0x05C  || outside_for2: 	SUB     R17, 0x01
(0083)                            || 
(0084)  CS-0x05D  0x372CA         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0085)  CS-0x05E  0x2D201  0x05E  || middle_for2:  	SUB     R18, 0x01
(0086)                            ||              
(0087)  CS-0x05F  0x373B4         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0088)  CS-0x060  0x2D301  0x060  || inside_for2:  	SUB     R19, 0x01
(0089)  CS-0x061  0x08303         ||              	BRNE    inside_for2
(0090)                            ||              
(0091)  CS-0x062  0x23200         ||              	OR      R18, 0x00              
(0092)  CS-0x063  0x082F3         ||              	BRNE    middle_for2
(0093)                            ||              
(0094)  CS-0x064  0x23100         ||              	OR      R17, 0x00               
(0095)  CS-0x065  0x082E3         ||              	BRNE    outside_for2
(0096)                            || 
(0097)                            || ;---------------------------------------------------------------
(0098)  CS-0x066  0x04509  0x066  || EXORTest:		MOV 	R5, R1
(0099)  CS-0x067  0x00512         || 			EXOR 	R5, R2
(0100)  CS-0x068  0x305A5         || 			CMP 	R5, 0XA5
(0101)  CS-0x069  0x08363         || 			BRNE 	timedelay3
(0102)                            || 
(0103)  CS-0x06A  0x23404         || 			OR 	R20,  BIT_2_MASK
(0104)  CS-0x06B  0x35440         || 			OUT 	R20, LED_PORT
(0105)                            || 
(0106)  CS-0x06C  0x371AA  0x06C  || timedelay3:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0107)  CS-0x06D  0x2D101  0x06D  || outside_for3: 	SUB     R17, 0x01
(0108)                            || 
(0109)  CS-0x06E  0x372CA         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0110)  CS-0x06F  0x2D201  0x06F  || middle_for3:  	SUB     R18, 0x01
(0111)                            ||              
(0112)  CS-0x070  0x373B4         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0113)  CS-0x071  0x2D301  0x071  || inside_for3:  	SUB     R19, 0x01
(0114)  CS-0x072  0x0838B         ||              	BRNE    inside_for3
(0115)                            ||              
(0116)  CS-0x073  0x23200         ||              	OR      R18, 0x00              
(0117)  CS-0x074  0x0837B         ||              	BRNE    middle_for3
(0118)                            ||              
(0119)  CS-0x075  0x23100         ||              	OR      R17, 0x00               
(0120)  CS-0x076  0x0836B         ||              	BRNE    outside_for3
(0121)                            || 
(0122)                            || ;---------------------------------------------------------------
(0123)  CS-0x077  0x04609  0x077  || LSLTest:		MOV 	R6, R1
(0124)  CS-0x078  0x04A58         || 			CMP	R10, R11
(0125)  CS-0x079  0x10600         || 			LSL 	R6
(0126)  CS-0x07A  0x3061F         || 			CMP 	R6, 0X1F
(0127)  CS-0x07B  0x083F3         || 			BRNE 	timedelay4
(0128)                            || 
(0129)  CS-0x07C  0x23408         || 			OR 	R20,  BIT_3_MASK
(0130)  CS-0x07D  0x35440         || 			OUT 	R20, LED_PORT
(0131)                            || 
(0132)  CS-0x07E  0x371AA  0x07E  || timedelay4:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0133)  CS-0x07F  0x2D101  0x07F  || outside_for4: 	SUB     R17, 0x01
(0134)                            || 
(0135)  CS-0x080  0x372CA         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0136)  CS-0x081  0x2D201  0x081  || middle_for4:  	SUB     R18, 0x01
(0137)                            ||              
(0138)  CS-0x082  0x373B4         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0139)  CS-0x083  0x2D301  0x083  || inside_for4:  	SUB     R19, 0x01
(0140)  CS-0x084  0x0841B         ||              	BRNE    inside_for4
(0141)                            ||              
(0142)  CS-0x085  0x23200         ||              	OR      R18, 0x00              
(0143)  CS-0x086  0x0840B         ||              	BRNE    middle_for4
(0144)                            ||              
(0145)  CS-0x087  0x23100         ||              	OR      R17, 0x00               
(0146)  CS-0x088  0x083FB         ||              	BRNE    outside_for4
(0147)                            || 
(0148)                            || ;---------------------------------------------------------------
(0149)  CS-0x089  0x04709  0x089  || LSRTest:		MOV 	R7, R1
(0150)  CS-0x08A  0x04A58         || 			CMP	R10, R11
(0151)  CS-0x08B  0x10701         || 			LSR 	R7
(0152)  CS-0x08C  0x30787         || 			CMP 	R7, 0X87
(0153)  CS-0x08D  0x08483         || 			BRNE 	timedelay5
(0154)                            || 
(0155)  CS-0x08E  0x23410         || 			OR 	R20,  BIT_4_MASK
(0156)  CS-0x08F  0x35440         || 			OUT 	R20, LED_PORT
(0157)                            || 
(0158)  CS-0x090  0x371AA  0x090  || timedelay5:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0159)  CS-0x091  0x2D101  0x091  || outside_for5: 	SUB     R17, 0x01
(0160)                            || 
(0161)  CS-0x092  0x372CA         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0162)  CS-0x093  0x2D201  0x093  || middle_for5:  	SUB     R18, 0x01
(0163)                            ||              
(0164)  CS-0x094  0x373B4         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0165)  CS-0x095  0x2D301  0x095  || inside_for5:  	SUB     R19, 0x01
(0166)  CS-0x096  0x084AB         ||              	BRNE    inside_for5
(0167)                            ||              
(0168)  CS-0x097  0x23200         ||              	OR      R18, 0x00              
(0169)  CS-0x098  0x0849B         ||              	BRNE    middle_for5
(0170)                            ||              
(0171)  CS-0x099  0x23100         ||              	OR      R17, 0x00               
(0172)  CS-0x09A  0x0848B         ||              	BRNE    outside_for5
(0173)                            || 
(0174)                            || ;---------------------------------------------------------------
(0175)  CS-0x09B  0x234E0  0x09B  || LightLEDs:		OR	R20, 0xE0
(0176)  CS-0x09C  0x35440         || 				OUT R20, LED_PORT
(0177)                            || 
(0178)                            || ;---------------------------------------------------------------
(0179)  CS-0x09D  0x37F00  0x09D  || endless_loop:	MOV R31, 0x00
(0180)  CS-0x09E  0x084E8         || 				BRN	endless_loop
(0181)                            || 
(0182)                            || 
(0183)                            || 		





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
ANDTEST        0x045   (0048)  ||  
ENDLESS_LOOP   0x09D   (0179)  ||  0180 
EXORTEST       0x066   (0098)  ||  
INIT           0x040   (0038)  ||  
INSIDE_FOR1    0x04F   (0063)  ||  0064 
INSIDE_FOR2    0x060   (0088)  ||  0089 
INSIDE_FOR3    0x071   (0113)  ||  0114 
INSIDE_FOR4    0x083   (0139)  ||  0140 
INSIDE_FOR5    0x095   (0165)  ||  0166 
LIGHTLEDS      0x09B   (0175)  ||  
LSLTEST        0x077   (0123)  ||  
LSRTEST        0x089   (0149)  ||  
MIDDLE_FOR1    0x04D   (0060)  ||  0067 
MIDDLE_FOR2    0x05E   (0085)  ||  0092 
MIDDLE_FOR3    0x06F   (0110)  ||  0117 
MIDDLE_FOR4    0x081   (0136)  ||  0143 
MIDDLE_FOR5    0x093   (0162)  ||  0169 
ORTEST         0x055   (0073)  ||  
OUTSIDE_FOR1   0x04B   (0057)  ||  0070 
OUTSIDE_FOR2   0x05C   (0082)  ||  0095 
OUTSIDE_FOR3   0x06D   (0107)  ||  0120 
OUTSIDE_FOR4   0x07F   (0133)  ||  0146 
OUTSIDE_FOR5   0x091   (0159)  ||  0172 
TIMEDELAY1     0x04A   (0056)  ||  
TIMEDELAY2     0x05B   (0081)  ||  0076 
TIMEDELAY3     0x06C   (0106)  ||  0101 
TIMEDELAY4     0x07E   (0132)  ||  0127 
TIMEDELAY5     0x090   (0158)  ||  0153 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BIT_0_MASK     0x001   (0009)  ||  0052 
BIT_1_MASK     0x002   (0010)  ||  0078 
BIT_2_MASK     0x004   (0011)  ||  0103 
BIT_3_MASK     0x008   (0012)  ||  0129 
BIT_4_MASK     0x010   (0013)  ||  0155 
BIT_5_MASK     0x020   (0014)  ||  
BIT_6_MASK     0x040   (0015)  ||  
BIT_7_MASK     0x080   (0016)  ||  
INSIDE_FOR_COUNT 0x0B4   (0018)  ||  0062 0087 0112 0138 0164 
LED_PORT       0x040   (0002)  ||  0053 0079 0104 0130 0156 0176 
MIDDLE_FOR_COUNT 0x0CA   (0019)  ||  0059 0084 0109 0135 0161 
OUTSIDE_FOR_COUNT 0x0AA   (0020)  ||  0056 0081 0106 0132 0158 
SWITCH_PORT    0x020   (0003)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
