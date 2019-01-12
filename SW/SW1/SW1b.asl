

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
(0002)                            || ; Software Assignment 1.b
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 1/9/19
(0005)                            || ; Description : Reads in one value (X) from port 0x30, 
(0006)                            || ;               performs ~X+1(twos complement), then outputs result (res) to 0x40
(0007)                            || ;
(0008)                            || ; Register uses:
(0009)                            || ; R0 - input value (X)
(0010)                            || ; R1 - holds the result (res)
(0011)                            || ;--------------------------------------------------------------------
(0012)                            || 
(0013)                       048  || .EQU IN_PORT = 0x30
(0014)                       064  || .EQU OUT_PORT = 0x40
(0015)                            || 
(0016)                            || .CSEG
(0017)                       001  || .ORG 0x01 
(0018)                            || 
(0019)  CS-0x001  0x32030  0x001  || main:		IN R0, IN_PORT
(0020)  CS-0x002  0x02102         || 		SUB R1, R0 ; R1 <-- R1 - R0 (res = 0 - X)
(0021)  CS-0x003  0x34140         || 		OUT R1, OUT_PORT 
(0022)                            || 		
(0023)                            || 





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
MAIN           0x001   (0019)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x030   (0013)  ||  0019 
OUT_PORT       0x040   (0014)  ||  0021 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
