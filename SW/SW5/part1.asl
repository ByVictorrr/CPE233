

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
(0004)                            || ; Date: 2019-02-03
(0005)                            || ; Description : Create an array in the data segment (1..n=14) fib seq
(0006)                            || ;		Iterate through array and calc diff between values that
(0007)                            || ;		are three spots aways from eachother.
(0008)                            || ;		When no value is availble to subtract dont subtract.
(0009)                            || ;		For each differnce output to port 0x42
(0010)                            || ;
(0011)                            || ;
(0012)                            || ; Register uses:
(0013)                            || ; R0 - 
(0014)                            || ; R1 - 
(0015)                            || ; R2 - 
(0016)                            || ;--------------------------------------------------------------------
(0017)                       066  || .EQU OUT_PORT = 0x42  
(0018)                       007  || .EQU INC_ARR = 7 
(0019)                            || 
(0020)                            || ;--------------REG DEF--------------------------------------------
(0021)                       r0   || .DEF R_INC = R0
(0022)                       r1   || .DEF R_LOWER = R1 
(0023)                       r2   || .DEF R_HIGHER = R2
(0024)                       r3   || .DEF R_LOWER_ADDR = R3
(0025)                       r4   || .DEF R_HIGHER_ADDR = R4
(0026)                       r5   || .DEF R_DIFF = R5
(0027)                            || ;-----------------Data Segment-------------------------------------
(0028)                            || .DSEG
(0029)                       001  || .ORG 0x01;
(0030)                            || 
(0031)                            || 
(0032)                            || 
(0033)  DS-0x001             00E  || fib_seq: .DB 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 
(0034)                            || ;-------------------------------------------------------------------
(0035)                            || 
(0036)                            || 
(0037)                            || ;--------------------Code Segment --------------------------------
(0038)                            || .CSEG
(0039)                       029  || .ORG 0x1D
(0040)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x001  0x3A001  0x001  ||              LD      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x002  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x003  0x3A002  0x002  ||              LD      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x004  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x005  0x3A003  0x003  ||              LD      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x006  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x007  0x3A004  0x004  ||              LD      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x008  0x36003  0x003  ||              MOV     r0,0x03     ; write dseg data to reg
-STUP-  CS-0x009  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00A  0x36005  0x005  ||              MOV     r0,0x05     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A006  0x006  ||              LD      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x00C  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A007  0x007  ||              LD      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x00E  0x3600D  0x00D  ||              MOV     r0,0x0D     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A008  0x008  ||              LD      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x010  0x36015  0x015  ||              MOV     r0,0x15     ; write dseg data to reg
-STUP-  CS-0x011  0x3A009  0x009  ||              LD      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x012  0x36022  0x022  ||              MOV     r0,0x22     ; write dseg data to reg
-STUP-  CS-0x013  0x3A00A  0x00A  ||              LD      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x014  0x36037  0x037  ||              MOV     r0,0x37     ; write dseg data to reg
-STUP-  CS-0x015  0x3A00B  0x00B  ||              LD      r0,0x0B     ; place reg data in mem 
-STUP-  CS-0x016  0x36059  0x059  ||              MOV     r0,0x59     ; write dseg data to reg
-STUP-  CS-0x017  0x3A00C  0x00C  ||              LD      r0,0x0C     ; place reg data in mem 
-STUP-  CS-0x018  0x36090  0x090  ||              MOV     r0,0x90     ; write dseg data to reg
-STUP-  CS-0x019  0x3A00D  0x00D  ||              LD      r0,0x0D     ; place reg data in mem 
-STUP-  CS-0x01A  0x360E9  0x0E9  ||              MOV     r0,0xE9     ; write dseg data to reg
-STUP-  CS-0x01B  0x3A00E  0x00E  ||              LD      r0,0x0E     ; place reg data in mem 
-STUP-  CS-0x01C  0x080E8  0x100  ||              BRN     0x1D        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0041)  CS-0x01D  0x36007  0x01D  || main: 	MOV R_INC, INC_ARR ; initalizing R_INC = 10
(0042)                            || 	
(0043)                            ||    ;address initalization of arary
(0044)  CS-0x01E  0x3630F         || 	MOV R3, fib_seq ; R_LOWER = address array[0]
(0045)  CS-0x01F  0x04419         || 	MOV R4, R3 ; get same value then add 3 
(0046)  CS-0x020  0x28403         || 	ADD R4, 3 ; R= 
(0047)                            || 
(0048)                     0x021  || diff:	
(0049)                            || 		LD R_LOWER, R3; from sctach mem to reg
            syntax error

(0050)                            || 		LD R_HIGHER, R4; from sctach mem to reg
            syntax error

(0051)  CS-0x021  0x0220A         || 		SUB R_HIGHER, R_LOWER ; differnce
(0052)                            || 	
(0053)  CS-0x022  0x04511         || 	MOV R_DIFF, R_HIGHER
(0054)                            || 	
(0055)  CS-0x023  0x2C001         || 	SUB R_INC, 1 ; decremen	
(0056)  CS-0x024  0x08133         || 	BRNE output  ; branch only if z != 0	
(0057)  CS-0x025  0x080E8         || 	BRN main  
(0058)                            || 	
(0059)                     0x026  || output: 
(0060)                            || 	OUT R_DIFF, OUT_PORT
            syntax error

(0061)  CS-0x026  0x28301         || 	ADD R3, 1 ; incrment array address
(0062)  CS-0x027  0x28401         || 	ADD R4, 1 ; incrment array adres
(0063)  CS-0x028  0x08108         || 	BRN diff
(0064)                            || 
(0065)                            ||  





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
DIFF           0x021   (0048)  ||  0063 
MAIN           0x01D   (0041)  ||  0057 
OUTPUT         0x026   (0059)  ||  0056 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INC_ARR        0x007   (0018)  ||  0041 
OUT_PORT       0x042   (0017)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
R_DIFF           r5    (0026)  ||  0053 
R_HIGHER         r2    (0023)  ||  0051 0053 
R_HIGHER_ADDR    r4    (0025)  ||  
R_INC            r0    (0021)  ||  0041 0055 
R_LOWER          r1    (0022)  ||  0051 
R_LOWER_ADDR     r3    (0024)  ||  


-- Directives: .DB
------------------------------------------------------------ 
FIB_SEQ        0x00F   (0033)  ||  0044 
