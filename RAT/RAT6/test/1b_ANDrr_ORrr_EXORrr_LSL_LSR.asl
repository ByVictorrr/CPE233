

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


(0001)                            || ;- Test Info: ----------------------------------------------------------|
(0002)                            || ;- Programmers: Kevin Brewer and Kyle Patterson                       |
(0003)                            || ;- Date: 02-27-2011      |
(0004)                            || ;- Version: 1      |
(0005)                            || ;-----------------------------------------------------------------------|
(0006)                            || ;- Test Cases:      |
(0007)                            || ;-      |
(0008)                            || ;- Test1:   Tests AND(reg/reg)         lights up LED0 (rightmost LED) |
(0009)                            || ;- Test2:   Tests OR(reg/reg)          lights up LED1      |
(0010)                            || ;- Test3:   Tests EXOR(reg/reg)        lights up LED2      |
(0011)                            || ;- Test4:   Tests LSL(reg)             lights up LED3      |
(0012)                            || ;- Test5:   Tests LSR(reg)             lights up LED4 through LED7    |
(0013)                            || ;-----------------------------------------------------------------------|
(0014)                            || ;- Results:      |
(0015)                            || ;-|
(0016)                            || ;- Each successful test results in an LED lighting up. A failed test|
(0017)                            || ;- results in an unlit LED. The LEDs light up in sequential order |
(0018)                            || ;- starting with LED0 for the first test through LED7 for the last |
(0019)                            || ;- test.  If all tests pass all eight LEDs on the board should be lit.|
(0020)                            || ;- There will be a half second delay between each test.|
(0021)                            || ;-----------------------------------------------------------------------|
(0022)                            || ;- Registers of Interest:|
(0023)                            || ;-|
(0024)                            || ;- R1, R2, and R3:  Used in loops that causes half second delay|
(0025)                            || ;- R10 and R11:    Used for testing AND, OR, EXOR, LSL, and LSR|
(0026)                            || ;- R31:    Used with LEDs to show which tests passed|
(0027)                            || ;-----------------------------------------------------------------------|
(0028)                            || 
(0029)                            || 
(0030)                            || ;- Port Constants: -----------------------------------------------------|
(0031)                       064  || .EQU LED_PORT = 0x40; switch and button ports not needed for tests|
(0032)                            || ;-----------------------------------------------------------------------|
(0033)                            || 
(0034)                            || ;- Looping Constants: --------------------------------------------------|
(0035)                       186  || .EQU INSIDE_FOR_COUNT    = 0xBA ;
(0036)                       186  || .EQU MIDDLE_FOR_COUNT    = 0xBA ;
(0037)                       186  || .EQU OUTSIDE_FOR_COUNT   = 0xBA ;
(0038)                            || ;-----------------------------------------------------------------------|
(0039)                            || 
(0040)                            || .DSEG
(0041)                       000  || .ORG         0x00  
(0042)                            || .CSEG
(0043)                       064  || .ORG         0x40
(0044)                            || 
(0045)                            || 
(0046)                            ||    
(0047)                            || main_loop:MOVR31, 0x00; Initialize LEDs to all unlit
            syntax error
            syntax error
            syntax error

(0048)                            || 
(0049)  CS-0x040  0x36AD6  0x040  || Test1: MOV R10, 0xD6; 11010110
(0050)  CS-0x041  0x36B55         || MOV R11, 0x55; 01010101
(0051)  CS-0x042  0x00A58         || AND R10, R11; 01010100 = 0x54
(0052)  CS-0x043  0x30A54         || CMP R10, 0x54 ; If AND works, Z = 1
(0053)  CS-0x044  0x08293         || BRNE Test2;; If Z = 1, no branch
(0054)  CS-0x045  0x23F01         || OR R31, 0x01
(0055)  CS-0x046  0x35F40         || OUT R31, LED_PORT; LED0 lit
(0056)                            || 
(0057)                            || 
(0058)                            || ;-HOLD-DELAY-1-----------------------------------------------------------
(0059)  CS-0x047  0x361BA         || MOV     R1, OUTSIDE_FOR_COUNT
(0060)  CS-0x048  0x2C101  0x048  || OUTSIDE_FOR1: SUB     R1, 0x01
(0061)                            ||  
(0062)  CS-0x049  0x362BA         || MOV     R2, MIDDLE_FOR_COUNT
(0063)  CS-0x04A  0x2C201  0x04A  || MIDDLE_FOR1:  SUB     R2, 0x01
(0064)                            ||              
(0065)  CS-0x04B  0x363BA         || MOV     R3, INSIDE_FOR_COUNT
(0066)  CS-0x04C  0x2C301  0x04C  || INSIDE_FOR1:  SUB     R3, 0x01
(0067)  CS-0x04D  0x08263         || BRNE    INSIDE_FOR1
(0068)                            || 
(0069)  CS-0x04E  0x22200         || OR      R2, 0x00
(0070)  CS-0x04F  0x08253         || BRNE    MIDDLE_FOR1
(0071)                            || 
(0072)  CS-0x050  0x22100         || OR      R1, 0x00
(0073)  CS-0x051  0x08243         || BRNE    OUTSIDE_FOR1
(0074)                            || ;-END-HOLD---------------------------------------------------------------
(0075)                            || 
(0076)                            || 
(0077)  CS-0x052  0x36AD6  0x052  || Test2:MOV R10, 0xD6; 11010110
(0078)  CS-0x053  0x36B55         || MOV R11, 0x55; 01010101
(0079)  CS-0x054  0x00A59         || OR R10, R11; 11010111 = 0xD7
(0080)  CS-0x055  0x30AD7         ||                 CMP R10, 0xD7; If OR works, Z = 1
(0081)  CS-0x056  0x08313         || BRNE Test3;; If Z = 1, no branch
(0082)                            || ORR31, 0x02
            syntax error
            syntax error

(0083)                            || 
            syntax error
            syntax error

(0084)                            || 
(0085)                            || ;-HOLD-DELAY-2-----------------------------------------------------------
(0086)  CS-0x057  0x361BA         || MOV     R1, OUTSIDE_FOR_COUNT
(0087)  CS-0x058  0x2C101  0x058  || OUTSIDE_FOR2: SUB     R1, 0x01
(0088)                            ||  
(0089)  CS-0x059  0x362BA         || MOV     R2, MIDDLE_FOR_COUNT
(0090)  CS-0x05A  0x2C201  0x05A  || MIDDLE_FOR2:  SUB     R2, 0x01
(0091)                            ||              
(0092)  CS-0x05B  0x363BA         || MOV     R3, INSIDE_FOR_COUNT
(0093)  CS-0x05C  0x2C301  0x05C  || INSIDE_FOR2:  SUB     R3, 0x01
(0094)  CS-0x05D  0x082E3         || BRNE    INSIDE_FOR2
(0095)                            || 
(0096)  CS-0x05E  0x22200         || OR      R2, 0x00
(0097)  CS-0x05F  0x082D3         || BRNE    MIDDLE_FOR2
(0098)                            || 
(0099)  CS-0x060  0x22100         || OR      R1, 0x00
(0100)  CS-0x061  0x082C3         || BRNE    OUTSIDE_FOR2
(0101)                            || ;-END-HOLD---------------------------------------------------------------
(0102)                            || 
(0103)                            || 
(0104)  CS-0x062  0x36AD6  0x062  || Test3:MOV R10, 0xD6; 11010110
(0105)  CS-0x063  0x36B55         || MOV R11, 0x55; 01010101
(0106)  CS-0x064  0x00A5A         || EXOR R10, R11; 10000011 = 0x83
(0107)  CS-0x065  0x30A83         ||                 CMP R10, 0x83; If OR works, Z = 1
(0108)  CS-0x066  0x08393         || BRNE Test4;; If Z = 1, no branch
(0109)                            || ORR31, 0x04
            syntax error
            syntax error

(0110)                            || 
            syntax error
            syntax error

(0111)                            || 
(0112)                            || ;-HOLD-DELAY-3-----------------------------------------------------------
(0113)  CS-0x067  0x361BA         || MOV     R1, OUTSIDE_FOR_COUNT
(0114)  CS-0x068  0x2C101  0x068  || OUTSIDE_FOR3: SUB     R1, 0x01
(0115)                            ||  
(0116)  CS-0x069  0x362BA         || MOV     R2, MIDDLE_FOR_COUNT
(0117)  CS-0x06A  0x2C201  0x06A  || MIDDLE_FOR3:  SUB     R2, 0x01
(0118)                            ||              
(0119)  CS-0x06B  0x363BA         || MOV     R3, INSIDE_FOR_COUNT
(0120)  CS-0x06C  0x2C301  0x06C  || INSIDE_FOR3:  SUB     R3, 0x01
(0121)  CS-0x06D  0x08363         || BRNE    INSIDE_FOR3
(0122)                            || 
(0123)  CS-0x06E  0x22200         || OR      R2, 0x00
(0124)  CS-0x06F  0x08353         || BRNE    MIDDLE_FOR3
(0125)                            || 
(0126)  CS-0x070  0x22100         || OR      R1, 0x00
(0127)  CS-0x071  0x08343         || BRNE    OUTSIDE_FOR3
(0128)                            || ;-END-HOLD---------------------------------------------------------------
(0129)                            || 
(0130)                            || 
(0131)  CS-0x072  0x36AD6  0x072  || Test4:MOV R10, 0xD6; 11010110 - Also no R11 needed
(0132)  CS-0x073  0x18001         || SEC; Set C = 1
(0133)  CS-0x074  0x10A00         || LSL R10; 10101101 = 0xAD
(0134)  CS-0x075  0x30AAD         ||                 CMP R10, 0xAD; If OR works, Z = 1
(0135)  CS-0x076  0x08413         || BRNE Test5;; If Z = 1, no branch
(0136)                            || ORR31, 0x08
            syntax error
            syntax error

(0137)                            || 
            syntax error
            syntax error

(0138)                            || 
(0139)                            || ;-HOLD-DELAY-4-----------------------------------------------------------
(0140)  CS-0x077  0x361BA         || MOV     R1, OUTSIDE_FOR_COUNT
(0141)  CS-0x078  0x2C101  0x078  || OUTSIDE_FOR4: SUB     R1, 0x01
(0142)                            ||  
(0143)  CS-0x079  0x362BA         || MOV     R2, MIDDLE_FOR_COUNT
(0144)  CS-0x07A  0x2C201  0x07A  || MIDDLE_FOR4:  SUB     R2, 0x01
(0145)                            ||              
(0146)  CS-0x07B  0x363BA         || MOV     R3, INSIDE_FOR_COUNT
(0147)  CS-0x07C  0x2C301  0x07C  || INSIDE_FOR4:  SUB     R3, 0x01
(0148)  CS-0x07D  0x083E3         || BRNE    INSIDE_FOR4
(0149)                            || 
(0150)  CS-0x07E  0x22200         || OR      R2, 0x00
(0151)  CS-0x07F  0x083D3         || BRNE    MIDDLE_FOR4
(0152)                            || 
(0153)  CS-0x080  0x22100         || OR      R1, 0x00
(0154)  CS-0x081  0x083C3         || BRNE    OUTSIDE_FOR4
(0155)                            || ;-END-HOLD---------------------------------------------------------------
(0156)                            || 
(0157)                            || 
(0158)  CS-0x082  0x36AD6  0x082  || Test5:MOV R10, 0xD6; 11010110 - Also no R11 needed
(0159)  CS-0x083  0x18001         || SEC; Set C = 1
(0160)  CS-0x084  0x10A01         || LSR R10; 11101011 = 0xEB
(0161)  CS-0x085  0x30AEB         ||                 CMP R10, 0xEB; If OR works, Z = 1
(0162)  CS-0x086  0x08493         || BRNE DONE;; If Z = 1, no branch
(0163)                            || ORR31, 0xF0
            syntax error
            syntax error

(0164)                            || 
            syntax error
            syntax error

(0165)                            || 
(0166)                            || ;-HOLD-DELAY-5-----------------------------------------------------------
(0167)  CS-0x087  0x361BA         || MOV     R1, OUTSIDE_FOR_COUNT
(0168)  CS-0x088  0x2C101  0x088  || OUTSIDE_FOR5: SUB     R1, 0x01
(0169)                            ||  
(0170)  CS-0x089  0x362BA         || MOV     R2, MIDDLE_FOR_COUNT
(0171)  CS-0x08A  0x2C201  0x08A  || MIDDLE_FOR5:  SUB     R2, 0x01
(0172)                            ||              
(0173)  CS-0x08B  0x363BA         || MOV     R3, INSIDE_FOR_COUNT
(0174)  CS-0x08C  0x2C301  0x08C  || INSIDE_FOR5:  SUB     R3, 0x01
(0175)  CS-0x08D  0x08463         || BRNE    INSIDE_FOR5
(0176)                            || 
(0177)  CS-0x08E  0x22200         || OR      R2, 0x00
(0178)  CS-0x08F  0x08453         || BRNE    MIDDLE_FOR5
(0179)                            || 
(0180)  CS-0x090  0x22100         || OR      R1, 0x00
(0181)  CS-0x091  0x08443         || BRNE    OUTSIDE_FOR5
(0182)                            || ;-END-HOLD---------------------------------------------------------------
(0183)                            || 
(0184)                            || 
(0185)  CS-0x092  0x35F40  0x092  || DONE:OUT R31, LED_PORT
(0186)  CS-0x093  0x08490         || BRN DONE
(0187)                            || ;





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
DONE           0x092   (0185)  ||  0162 0186 
INSIDE_FOR1    0x04C   (0066)  ||  0067 
INSIDE_FOR2    0x05C   (0093)  ||  0094 
INSIDE_FOR3    0x06C   (0120)  ||  0121 
INSIDE_FOR4    0x07C   (0147)  ||  0148 
INSIDE_FOR5    0x08C   (0174)  ||  0175 
MIDDLE_FOR1    0x04A   (0063)  ||  0070 
MIDDLE_FOR2    0x05A   (0090)  ||  0097 
MIDDLE_FOR3    0x06A   (0117)  ||  0124 
MIDDLE_FOR4    0x07A   (0144)  ||  0151 
MIDDLE_FOR5    0x08A   (0171)  ||  0178 
OUTSIDE_FOR1   0x048   (0060)  ||  0073 
OUTSIDE_FOR2   0x058   (0087)  ||  0100 
OUTSIDE_FOR3   0x068   (0114)  ||  0127 
OUTSIDE_FOR4   0x078   (0141)  ||  0154 
OUTSIDE_FOR5   0x088   (0168)  ||  0181 
TEST1          0x040   (0049)  ||  
TEST2          0x052   (0077)  ||  0053 
TEST3          0x062   (0104)  ||  0081 
TEST4          0x072   (0131)  ||  0108 
TEST5          0x082   (0158)  ||  0135 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INSIDE_FOR_COUNT 0x0BA   (0035)  ||  0065 0092 0119 0146 0173 
LED_PORT       0x040   (0031)  ||  0055 0185 
MIDDLE_FOR_COUNT 0x0BA   (0036)  ||  0062 0089 0116 0143 0170 
OUTSIDE_FOR_COUNT 0x0BA   (0037)  ||  0059 0086 0113 0140 0167 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
