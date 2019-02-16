

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
(0002)                            || ; Software Assignment 4.2
(0003)                            || ; Author: Victor Delaplaine 
(0004)                            || ; Date: 1/23/19
(0005)                            || ; Description : Reads two values from port 0x9a, this value is an 8 bit numbers (X,Y).
(0006)                            || ;		X, is then divided by Y. Its result outputed to port 0x42 and remainder to 0x43.
(0007)                            || ;
(0008)                            || ; Register uses:
(0009)                            || ; R0 - reads in value X: (X)
(0010)                            || ; R1 - reads in value Y: ()
(0011)                            || ; R2 - res of division: (res)
(0012)                            || ; R3 - remainder: (R)
(0013)                            || ;--------------------------------------------------------------------
(0014)                            || 
(0015)                       154  || .EQU IN_PORT = 0x9A
(0016)                       066  || .EQU OUT_PORT_RES = 0x42
(0017)                       067  || .EQU OUT_PORT_R = 0x43
(0018)                            || 
(0019)                            || .CSEG
(0020)                       001  || .ORG 0x01 
(0021)                            || 
(0022)  CS-0x001  0x3209A  0x001  || main:   IN R0, IN_PORT ; X = IN_PORT
(0023)  CS-0x002  0x3219A         || 		IN R1, IN_PORT ; y = IN_PORT
(0024)  CS-0x003  0x04301         || 		MOV R3, R0 ; R = X
(0025)                            || 		;is Y ==0 ?
(0026)  CS-0x004  0x30100         || 		CMP R1, 0x00 ; R1-0, if(R1-0 == 0){z ==1, implying R1 = 0}
(0027)  CS-0x005  0x08062         || 		BREQ output ;
(0028)                            || 
(0029)                            || 
(0030)  CS-0x006  0x04308  0x006  || loop:   	CMP R3,R1  ; R-Y, if (C = 0 ){R >= 3}
(0031)  CS-0x007  0x0A049         || 		BRCC div ; if(C==0){PC=div}else{PC=PC+1}
(0032)  CS-0x008  0x08060         || 		BRN output		
(0033)                            || 
(0034)  CS-0x009  0x0230A  0x009  || div:	SUB R3, R1 ; R=R-Y
(0035)  CS-0x00A  0x28201         || 		ADD R2, 0x01 ; res=res+1	
(0036)  CS-0x00B  0x08030         || 		BRN loop 
(0037)                            || 
(0038)                            || 		
(0039)                     0x00C  || output:		
(0040)  CS-0x00C  0x34242         || 		OUT R2, OUT_PORT_RES ; (OUT_PORT = res)
(0041)  CS-0x00D  0x34343         || 		OUT R3, OUT_PORT_R ; (OUT_PORT = R)





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
DIV            0x009   (0034)  ||  0031 
LOOP           0x006   (0030)  ||  0036 
MAIN           0x001   (0022)  ||  
OUTPUT         0x00C   (0039)  ||  0027 0032 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0015)  ||  0022 0023 
OUT_PORT_R     0x043   (0017)  ||  0041 
OUT_PORT_RES   0x042   (0016)  ||  0040 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
