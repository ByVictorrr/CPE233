

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
(0002)                            || ; Software Assignment .1
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 2019-02-12
(0005)                            || ; Description :  
(0006)                            || ;
(0007)                            || ; Register uses:
(0008)                            || ; R0 - holds the addr of the current characters being read 
(0009)                            || ; R1 - hold the value of the character just read 
(0010)                            || ; R2 - holds string length 
(0011)                            || ;--------------------------------------------------------------------
(0012)                            || .DSEG 
(0013)                       001  || .ORG 0x01
(0014)                            || 
(0015)  DS-0x001             005  || array: .DB 4, 9, 1, 1, 2
(0016)                            || 
(0017)                       001  || .EQU IN_PORT = 1
(0018)                       002  || .EQU OUT_PORT = 2 
(0019)                       001  || .EQU ST_ADDR = 1
(0020)                            || .CSEG
(0021)                       017  || .ORG 0x11
(0022)                            || 
(0023)                            || 
(0024)                     0x011  || main_loop: 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36004  0x004  ||              MOV     r0,0x04     ; write dseg data to reg
-STUP-  CS-0x001  0x3A001  0x001  ||              LD      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x002  0x36009  0x009  ||              MOV     r0,0x09     ; write dseg data to reg
-STUP-  CS-0x003  0x3A002  0x002  ||              LD      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x004  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x005  0x3A003  0x003  ||              LD      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x006  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x007  0x3A004  0x004  ||              LD      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x008  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x009  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00A  0x08088  0x100  ||              BRN     0x11        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0025)  CS-0x011  0x36001         || 		MOV R0, ST_ADDR
(0026)                     0x012  || Loop1: 		
(0027)  CS-0x012  0x28001         || 		ADD R0, 1
(0028)                     0x013  || Loop2:
(0029)  CS-0x013  0x04102         || 		LD R1, (R0)
(0030)                            || 
(0031)  CS-0x014  0x30100         || 		CMP R1, 0
(0032)                            || 
(0033)  CS-0x015  0x080C2         || 		BREQ done
(0034)                            || 
(0035)  CS-0x016  0x28301         || 		ADD R3, 1
(0036)                            || 		
(0037)  CS-0x017  0x08090         || 		BRN Loop1
(0038)                            || 
(0039)  CS-0x018  0x34302  0x018  || done: OUT R3, OUT_PORT
(0040)                            || 	





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
DONE           0x018   (0039)  ||  0033 
LOOP1          0x012   (0026)  ||  0037 
LOOP2          0x013   (0028)  ||  
MAIN_LOOP      0x011   (0024)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x001   (0017)  ||  
OUT_PORT       0x002   (0018)  ||  0039 
ST_ADDR        0x001   (0019)  ||  0025 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
ARRAY          0x006   (0015)  ||  
