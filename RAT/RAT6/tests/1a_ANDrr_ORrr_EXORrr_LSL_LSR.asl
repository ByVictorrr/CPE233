

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
(0005)                            || .CSEG 
(0006)                       064  || .ORG 0x40		
(0007)                            || 
(0008)                            || 
(0009)  CS-0x040  0x36117         || MOV R1, 23
(0010)  CS-0x041  0x3630A  0x041  || ANDTest: 		MOV 	R3, 10
(0011)  CS-0x042  0x00310         || 			AND 	R3, R2
(0012)  CS-0x043  0x30300         || 			CMP 	R3, 0x0
(0013)                            || 
(0014)  CS-0x044  0x23402         || 			OR 	R20 , 2
(0015)  CS-0x045  0x35440         || 			OUT 	R20, LED_PORT
(0016)                            || 





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
ANDTEST        0x041   (0010)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LED_PORT       0x040   (0002)  ||  0015 
SWITCH_PORT    0x020   (0003)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
