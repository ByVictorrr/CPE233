

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
(0002)                            || ; Software Assignment 1.a
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 1/9/19
(0005)                            || ; Description : Reads in three values (X, Y, Z) from port 0x30, 
(0006)                            || ;               performs X+Y+Z, then outputs result (res) to 0x40
(0007)                            || ;
(0008)                            || ; Register uses:
(0009)                            || ; R0 - input value (X)
(0010)                            || ; R1 - input value (Y)
(0011)                            || ; R2 - input value (Z)
(0012)                            || ; R3 - holds the result (res)
(0013)                            || ;--------------------------------------------------------------------
(0014)                            || 
(0015)                       048  || .EQU IN_PORT = 0x30
(0016)                       064  || .EQU OUT_PORT = 0x40
(0017)                            || 
(0018)                            || .CSEG
(0019)                       001  || .ORG 0x01 
(0020)                            || 
(0021)  CS-0x001  0x32030  0x001  || main:		IN R0, IN_PORT
(0022)  CS-0x002  0x32130         || 		IN R1, IN_PORT
(0023)  CS-0x003  0x32230         || 		IN R2, IN_PORT
(0024)  CS-0x004  0x04301         || 		MOV R3, R0 ; R3 <-- R0 (res = X)
(0025)  CS-0x005  0x02308         || 		ADD R3, R1 ; R3 <-- R3 + R1 (res = X+Y)
(0026)  CS-0x006  0x02310         || 		ADD R3, R2 ; R3 <-- R3 + R1 (res = res + Z)
(0027)  CS-0x007  0x34340         || 		OUT R3, OUT_PORT 
(0028)                            || 		
(0029)                            || 





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
MAIN           0x001   (0021)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x030   (0015)  ||  0021 0022 0023 
OUT_PORT       0x040   (0016)  ||  0027 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
