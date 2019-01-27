j;--------------------------------------------------------------------
; Software Assignment 3.1
; Author: Victor Delaplaine and Crystal PrimaLang
; Date: 1/23/19
; Description : Reads a value from port 0x9a, this value is an 8 bit number (X).
;		X, is two 4-bit unsigned number X1(4MSB) and X2(4LSB).
;		X1=X[7:4]
;		X2=X[3:0]
;		res = X1*X2
;		Output res 
;
; Register uses:
; R0 - reads in value X: (X)
; R1 - holds higher 4 -bits of X: (X1)
; R2 - holds lower 4 -bits of X: (X2)
; R3 - holds the result (res)
; R4 - temp value for masking: (temp)
; R5 - loop counter: (count)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU COUNT = 4

.CSEG
.ORG 0x01 

main:	IN R0, IN_PORT ; X = IN_PORT
		MOV R4, R0 ; temp = X
		AND R4, 15 ; temp = temp & 0000 1111   
		MOV R2, R4 ; X2 = temp = X & 0000 1111
		
		;get X1 - Higher bits
		MOV R4, R0 ; temp = x	
		AND R4, 240 ; temp = temp & 1111 0000
		MOV R5, COUNT 	;Shift right four times to get to LSB

loop1:  CLC ; c = 0
		LSR R4 ; R4/2
		SUB R5, 1 ; count = count -1
		BRNE loop1 ; if(z = 0){PC = loop1}else {PC = PC +1}
		MOV R1, R4 ; X1= (X & 1111 0000)/8
		
		; check if X2 = 0
		CMP R2, 0x00
		BRNE loop2
		BRN output
		

		
loop2: 	ADD R3, R1; res = res + X1
		SUB R2, 1 ; X2 = X2 - 1
 		BRNE loop2 ;

		
output:	OUT R3, OUT_PORT ; (OUT_PORT = res)