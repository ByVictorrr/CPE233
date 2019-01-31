

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


(0001)                            || ; Software Assignment 4.1
            syntax error

(0002)                            || ; Author: Victor Delaplaine 
(0003)                            || ; Date: 1/23/19
(0004)                            || ; Description : Reads a value from port 0x9a, this value is an 8 bit number (X).
(0005)                            || ;		X, is then divided by 3. Its result ouputed to port 0x42 and remainder to 0x43.
(0006)                            || ;
(0007)                            || ; Register uses:
(0008)                            || ; R0 - reads in value X: (X)
(0009)                            || ; R1 - remainder: (R)
(0010)                            || ; R2 - res of division: (res)
(0011)                            || ;--------------------------------------------------------------------
(0012)                            || 
(0013)                       154  || .EQU IN_PORT = 0x9A
(0014)                       066  || .EQU OUT_PORT_RES = 0x42
(0015)                       067  || .EQU OUT_PORT_R = 0x43
(0016)                            || 
(0017)                            || .CSEG
(0018)                       001  || .ORG 0x01 
(0019)                            || 
(0020)  CS-0x001  0x3209A  0x001  || main:	IN R0, IN_PORT ; X = IN_PORT
(0021)  CS-0x002  0x04101         || 		MOV R1, R0 ; R = X
(0022)                            || 
(0023)  CS-0x003  0x30103  0x003  || loop:		CMP R1, 0x03 ; R-3, if (C = 0 ){R >= 3}
(0024)  CS-0x004  0x0A031         || 		BRCC div3 ; if(C==0){PC=div3}else{PC=PC+1}
(0025)  CS-0x005  0x08048         || 		BRN output		
(0026)                            || 
(0027)  CS-0x006  0x2C103  0x006  || div3:		SUB R1, 0x03 ; R=R-3
(0028)  CS-0x007  0x28201         || 		ADD R2, 0x01 ; res=res+1	
(0029)  CS-0x008  0x08018         || 		BRN loop;
(0030)                            || 
(0031)                            || 		
(0032)                     0x009  || output:		
(0033)  CS-0x009  0x34242         || 		OUT R2, OUT_PORT_RES ; (OUT_PORT = res)
(0034)  CS-0x00A  0x34143         || 		OUT R1, OUT_PORT_R ; (OUT_PORT = R)





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
DIV3           0x006   (0027)  ||  0024 
LOOP           0x003   (0023)  ||  0029 
MAIN           0x001   (0020)  ||  
OUTPUT         0x009   (0032)  ||  0025 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0013)  ||  0020 
OUT_PORT_R     0x043   (0015)  ||  0034 
OUT_PORT_RES   0x042   (0014)  ||  0033 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
