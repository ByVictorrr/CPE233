;--------------------------------------------------------------------
; Software Assignment 7.1
; Author: Victor Delaplaine
; Date: 2019-02-20
; Description : Create a subroutin that will divide a value by 10, then use the soubtouine to
;		convert an unsigned 8-bit value into a 3 digit binary coded decimal.
;		The main program should read in the value X from port_id 0x9A.
;		The value will tbe converted into a BC of 3 values 100's 10s and 1's places,
;		Finally 1s is outputed on port 0x43, 10th on port 0x42, and 100s on port 41.
;
; Register uses:
; R0 - X main value 
; R1 - Ones 
; R2 - Tens
; R3 - HUNDs
; R4 - R
; R5  -res
; R6 - for masking temp
;--------------------------------------------------------------------

.EQU OUT_PORT_ONES =  0x43
.EQU OUT_PORT_TENS =  0x42
.EQU OUT_PORT_HUNDS =  0x41
.EQU IN_PORT = 0x9A
.EQU COUNT_DIV = 5 
.CSEG
.ORG 0x01

main:
		IN R0, IN_PORT
		MOV R4, COUNT_DIV ; for loop 
		CALL subroutine
end:		BRN end



subroutine:	MOV R4, R0
		CMP R0, 0 
		;if z== 1 R0 is zero
		BREQ output
compare:	CMP R4, 10
		;c== 1 if R is less than 10
		BRCS outputs 
		;else loop
		SUB R4, 10;
		ADD R5, 1;
		BRN compare 



outputs:	MOV R6, R5;
		AND R6, 7; ;try to mask rightmost bits
		MOV R1, R6 
 
		MOV R6, R5;
		AND R6, 56 ; ;try to mask rightmost bits
		MOV R2, R6 
 

		MOV R6, R5;
		AND R6, 192; ;try to mask rightmost bits
		MOV R3, R6 
 


		OUT R1, OUT_PORT_ONES 
		OUT R2, OUT_PORT_TENS
		OUT R3, OUT_PORT_HUNDS
		RET

