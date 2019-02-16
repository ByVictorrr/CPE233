

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
(0002)                            || ; Software Assignment 6.1
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 2019-02-14
(0005)                            || ; Description : Read a sequence of values from port 0x9A.
(0006)                            || ; 		Each value is added to the stack until the
(0007)                            || ;		value read is 0xFF.
(0008)                            || 		
(0009)                            || ;		When 0xFF is inputted dont add 0xFF to the stack,
(0010)                            || ;		rather output the values saved in reverse order to 
(0011)                            || ;		port 0x42
(0012)                            || ;
(0013)                            || ; Register uses:
(0014)                            || ; R0 - for inputted values (X)
(0015)                            || ; R1 - for to count the number of values inputted before 0xff (count)
(0016)                            || ; R2 - for the index of the number begin outputed (current_SP = SP_START-count) 
(0017)                            || ; R3 - output value (res)
(0018)                            || ;--------------------------------------------------------------------
(0019)                            || 
(0020)                       154  || .EQU IN_PORT = 0x9A
(0021)                       066  || .EQU OUT_PORT = 0x42 
(0022)                       000  || .EQU SP_START = 0x00 ; assuming already start at zero
(0023)                            || .CSEG
(0024)                            || 
(0025)                            || 
(0026)                       001  || .ORG 0x01
(0027)                            || 
(0028)  CS-0x001  0x3209A  0x001  || main: 	IN R0, IN_PORT 
(0029)                            || 	;check if R0 is 0xFF
(0030)  CS-0x002  0x04301         || 	MOV R3, R0 ; res = X
(0031)  CS-0x003  0x240FF         || 	EXOR R0, 0xFF
(0032)                            || 	;if (z==1){R0 == 0xFF}
(0033)                            || 	;else {R0 != 0xFF}
(0034)  CS-0x004  0x08042         || 	BREQ output_1 ; if(z==1){PC = output }
(0035)                            || 	;else if z == 0
(0036)                            || 
(0037)  CS-0x005  0x28101  0x005  || inc_push:	ADD R1, 1 ; count = count + 1		
(0038)  CS-0x006  0x12301         || 		PUSH R3 ; arr[SP_START - count ] = X
(0039)  CS-0x007  0x08008         || 		BRN main
(0040)                            || 
(0041)  CS-0x008  0x36200  0x008  || output_1:	MOV R2, SP_START ;
(0042)  CS-0x009  0x0220A         || 		SUB R2, R1 ; R2 = SP_START - count
(0043)                            || 
(0044)                            || 		; When R2 == SP_START end program
(0045)  CS-0x00A  0x30200  0x00A  || output_2:	CMP R2, SP_START 
(0046)                            || 		; if z == 1 { R2 == SP_START } 
(0047)                            || 		; else z==0 { R2 != SP_START}
(0048)  CS-0x00B  0x08082         || 		BREQ done
(0049)                            || 		;else if R2 != SP_START
(0050)  CS-0x00C  0x12302         || 		POP R3 ; res = arr[current_SP]
(0051)  CS-0x00D  0x34342         || 		OUT R3, OUT_PORT 
(0052)  CS-0x00E  0x28201         || 		ADD R2, 1
(0053)  CS-0x00F  0x08050         || 		BRN output_2
(0054)                     0x010  || done: 
(0055)                            || 		
(0056)                            || 





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
DONE           0x010   (0054)  ||  0048 
INC_PUSH       0x005   (0037)  ||  
MAIN           0x001   (0028)  ||  0039 
OUTPUT_1       0x008   (0041)  ||  0034 
OUTPUT_2       0x00A   (0045)  ||  0053 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0020)  ||  0028 
OUT_PORT       0x042   (0021)  ||  0051 
SP_START       0x000   (0022)  ||  0041 0045 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
