

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


(0001)                            || ; Software Assignment 3.1
            syntax error

(0002)                            || ; Author: Victor Delaplaine
(0003)                            || ; Date: 1/23/19
(0004)                            || ; Description : Reads a value from port 0x9a, this value is an 8 bit number (X).
(0005)                            || ;		X, is two 4-bit unsigned number X1(4MSB) and X2(4LSB).
(0006)                            || ;		X1=X[7:4]
(0007)                            || ;		X2=X[3:0]
(0008)                            || ;		res = X1*X2
(0009)                            || ;		Output res 
(0010)                            || ;
(0011)                            || ; Register uses:
(0012)                            || ; R0 - reads in value X: (X)
(0013)                            || ; R1 - holds higher 4 -bits of X: (X1)
(0014)                            || ; R2 - holds lower 4 -bits of X: (X2)
(0015)                            || ; R3 - holds the result (res)
(0016)                            || ; R4 - temp value for masking: (temp)
(0017)                            || ; R5 - loop counter: (count)
(0018)                            || ;--------------------------------------------------------------------
(0019)                            || 
(0020)                       154  || .EQU IN_PORT = 0x9A
(0021)                       066  || .EQU OUT_PORT = 0x42
(0022)                       004  || .EQU COUNT = 4
(0023)                            || 
(0024)                            || .CSEG
(0025)                       001  || .ORG 0x01 
(0026)                            || 
(0027)  CS-0x001  0x3209A  0x001  || main:	IN R0, IN_PORT ; X = IN_PORT
(0028)  CS-0x002  0x04401         || 		MOV R4, R0 ; temp = X
(0029)  CS-0x003  0x2040F         || 		AND R4, 15 ; temp = temp & 0000 1111   
(0030)  CS-0x004  0x04221         || 		MOV R2, R4 ; X2 = temp = X & 0000 1111
(0031)                            || 		
(0032)                            || 		;get X1 - Higher bits
(0033)  CS-0x005  0x04401         || 		MOV R4, R0 ; temp = x	
(0034)  CS-0x006  0x204F0         || 		AND R4, 240 ; temp = temp & 1111 0000
(0035)  CS-0x007  0x36504         || 		MOV R5, COUNT 	;Shift right four times to get to LSB
(0036)                            || 
(0037)  CS-0x008  0x18000  0x008  || loop1:  CLC ; c = 0
(0038)  CS-0x009  0x10401         || 		LSR R4 ; R4/2
(0039)  CS-0x00A  0x2C501         || 		SUB R5, 1 ; count = count -1
(0040)  CS-0x00B  0x08043         || 		BRNE loop1 ; if(z = 0){PC = loop1}else {PC = PC +1}
(0041)  CS-0x00C  0x04121         || 		MOV R1, R4 ; X1= (X & 1111 0000)/8
(0042)  CS-0x00D  0x08070         || 		BRN loop2
(0043)                            || 		
(0044)  CS-0x00E  0x02308  0x00E  || loop2: 	ADD R3, R1; res = res + X1
(0045)  CS-0x00F  0x2C201         || 		SUB R2, 1 ; X2 = X2 - 1
(0046)  CS-0x010  0x08073         ||  		BRNE loop2 ;
(0047)                            || 
(0048)                            || 		
(0049)  CS-0x011  0x34342  0x011  || output:	OUT R3, OUT_PORT ; (OUT_PORT = res)
 = PC +1}





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
LOOP1          0x008   (0037)  ||  0040 
LOOP2          0x00E   (0044)  ||  0042 0046 
MAIN           0x001   (0027)  ||  
OUTPUT         0x011   (0049)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
COUNT          0x004   (0022)  ||  0035 
IN_PORT        0x09A   (0020)  ||  0027 
OUT_PORT       0x042   (0021)  ||  0049 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
