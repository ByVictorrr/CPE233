

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


(0001)                       016  || .EQU IN_PORT = 0x10
(0002)                       032  || .EQU OUT_PORT = 0x20
(0003)                            || 
(0004)                       001  || .ORG 0x01
            syntax error
            syntax error

(0005)                            || 
(0006)                     0x001  || start:
(0007)                            || 	
(0008)  CS-0x001  0x32010         || 	IN R0, IN_PORT
(0009)  CS-0x002  0x32110         || 	IN R1, IN_PORT
(0010)  CS-0x003  0x0200A         || 	SUB R0, R1
(0011)  CS-0x004  0x04201         || 	MOV R2, R0
(0012)  CS-0x005  0x28207         || 	ADD R2, 0x07
(0013)  CS-0x006  0x0200A         || 	SUB R0, R1
(0014)  CS-0x007  0x34220         || 	OUT R2, OUT_PORT
(0015)  CS-0x008  0x08008         || 	BRN start
(0016)                            || 
(0017)                            || 	
(0018)                            || 
(0019)                            || 
(0020)                            || 
(0021)                            || 
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
START          0x001   (0006)  ||  0015 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x010   (0001)  ||  0008 0009 
OUT_PORT       0x020   (0002)  ||  0014 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
