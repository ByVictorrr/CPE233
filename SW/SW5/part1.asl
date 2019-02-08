

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
(0013)                            || ; R0 - for incrementing (count) 
(0014)                            || ; R1 - for lower number in the array (Lower)
(0015)                            || ; R2 - for higher number in the array (Higher)
(0016)                            || ; R3 - for lower numbers address in the array (Higher_ADDR)
(0017)                            || ; R4 - for higher numbers address in the array (Lower_ADDR)
(0018)                            || ; R5 - for the difference between higher and lower value (DIFF = Higher - Lower)
(0019)                            || ;--------------------------------------------------------------------
(0020)                       066  || .EQU OUT_PORT = 0x42  
(0021)                       011  || .EQU INC_ARR = 11 
(0022)                            || ;-----------------Data Segment-------------------------------------
(0023)                            || .DSEG
(0024)                       001  || .ORG 0x01;
(0025)                            || 
(0026)  DS-0x001             00E  || fib_seq: .DB 0x00, 0x01, 0x01, 0x02, 0x03, 0x05, 0x08, 0x0d, 0x15, 0x22, 0x37, 0x59, 0x90, 0xe9 
(0027)                            || ;-------------------------------------------------------------------
(0028)                            || 
(0029)                            || 
(0030)                            || ;--------------------Code Segment --------------------------------
(0031)                            || .CSEG
(0032)                       029  || .ORG 0x1D
(0033)                            || 
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
(0034)  CS-0x01D  0x3600B  0x01D  || main: 	MOV R0, INC_ARR ; initalizing R0 = 10
(0035)                            || 	
(0036)                            ||    ;address initalization of arary
(0037)  CS-0x01E  0x36301         || 	MOV R3, 1 ; R1 = address array[1]
(0038)  CS-0x01F  0x04419         || 	MOV R4, R3 ;
(0039)  CS-0x020  0x28403         || 	ADD R4, 3 ; R= 
(0040)                            || 	
(0041)                            || 	
(0042)                     0x021  || diff:	
(0043)                            || 	;Values at the location of address
(0044)                            || 
(0045)  CS-0x021  0x0411A         || 	LD R1, (R3) ; from sctach mem to reg (lower value)
(0046)  CS-0x022  0x04222         || 	LD R2, (R4) ; from sctach mem to reg (higher value)
(0047)                            || 	
(0048)  CS-0x023  0x0220A         ||     SUB R2, R1 ; differnce
(0049)  CS-0x024  0x04511         || 	MOV R5, R2
(0050)                            || 
(0051)                            || 
(0052)  CS-0x025  0x2C001         || 	SUB R0, 1 ; decremen	
(0053)  CS-0x026  0x08143         || 	BRNE output  ; branch only if z != 0	
(0054)  CS-0x027  0x08160         || 	BRN done  
(0055)                            || 	
(0056)                            || 
(0057)  CS-0x028  0x34542  0x028  || output: OUT R5, OUT_PORT
(0058)                            || 
(0059)  CS-0x029  0x28401         || 	ADD R4, 1 ; incrment array address
(0060)  CS-0x02A  0x28301         || 	ADD R3, 1 ; incrment array adres
(0061)  CS-0x02B  0x08108         || 	BRN diff
(0062)                            || 
(0063)  CS-0x02C  0x18000  0x02C  ||  done: CLC





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
DIFF           0x021   (0042)  ||  0061 
DONE           0x02C   (0063)  ||  0054 
MAIN           0x01D   (0034)  ||  
OUTPUT         0x028   (0057)  ||  0053 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INC_ARR        0x00B   (0021)  ||  0034 
OUT_PORT       0x042   (0020)  ||  0057 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
FIB_SEQ        0x00F   (0026)  ||  
