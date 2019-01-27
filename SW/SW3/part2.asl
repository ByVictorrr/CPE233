

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


(0001)                            || ;--------------------------------------------------------------------
(0002)                            || ; Software Assignment 3.2
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 1/23/19
(0005)                            || ; Description : Reads a value from port 0x9a, delays for .5s,
(0006)                            || ;		Then outputs to the port 0x42
(0007)                            || ;
(0008)                            || ;
(0009)                            || ; Register uses:
(0010)                            || ; R0 - reads in value X: (X)
(0011)                            || ; R1 - inner count variable  (C1)
(0012)                            || ; R2 - middle count variable  (C2)
(0013)                            || ; R3 - count variable  (C3)
(0014)                            || 
(0015)                            || ;--------------------------------------------------------------------
(0016)                            || 
(0017)                       154  || .EQU IN_PORT = 0x9A
(0018)                       066  || .EQU OUT_PORT = 0x42
(0019)                            || 
(0020)                       108  || .EQU COUNT_INNER = 108
(0021)                       232  || .EQU COUNT_MIDDLE = 232
(0022)                       246  || .EQU COUNT_OUTER = 246
(0023)                            || ;N_inner = 5
(0024)                            || ;N_middle = 3
(0025)                            || ;N_outer = 2
(0026)                            || 
(0027)                            || 
(0028)                            || .CSEG
(0029)                       001  || .ORG 0x01 
(0030)                            || 
(0031)  CS-0x001  0x3209A  0x001  || main:		IN R0, IN_PORT ; X = IN_PORT
(0032)  CS-0x002  0x361F6         || 		MOV R1, COUNT_OUTER ; R1 = OUTER_COUNT
(0033)                            || 
(0034)  CS-0x003  0x362E8  0x003  || outer_loop:	MOV R2, COUNT_MIDDLE
(0035)                            || 				
(0036)                            ||  	
(0037)  CS-0x004  0x3636C  0x004  || middle_loop:	MOV R3, COUNT_INNER
(0038)                            || 		
(0039)  CS-0x005  0x2C301  0x005  || inner_loop:	SUB R3, 1 
(0040)  CS-0x006  0x18000         || 		CLC
(0041)  CS-0x007  0x18000         || 		CLC
(0042)  CS-0x008  0x18000         || 		CLC
(0043)  CS-0x009  0x0802B         || 		BRNE inner_loop
(0044)                            || 		
(0045)  CS-0x00A  0x18000         || 		CLC
(0046)  CS-0x00B  0x08023         || 		BRNE middle_loop
(0047)  CS-0x00C  0x0801B         || 		BRNE outer_loop
(0048)                            || 		
(0049)  CS-0x00D  0x34042  0x00D  || output:		OUT R0, OUT_PORT ; (OUT_PORT = res)
(0050)                            || 





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
INNER_LOOP     0x005   (0039)  ||  0043 
MAIN           0x001   (0031)  ||  
MIDDLE_LOOP    0x004   (0037)  ||  0046 
OUTER_LOOP     0x003   (0034)  ||  0047 
OUTPUT         0x00D   (0049)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
COUNT_INNER    0x06C   (0020)  ||  0037 
COUNT_MIDDLE   0x0E8   (0021)  ||  0034 
COUNT_OUTER    0x0F6   (0022)  ||  0032 
IN_PORT        0x09A   (0017)  ||  0031 
OUT_PORT       0x042   (0018)  ||  0049 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
