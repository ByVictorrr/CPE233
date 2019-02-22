;--------------------------------------------------------------------
; Software Assignment 7.2
; Author: Victor Delaplaine
; Date: 2019-02-20
; Description : Create a subroutine that will help you multiply to values inputed on port 0x9A,
;		These values are R3, and R4; 
;		Any carry that is generated in this subroutine (ADD16) will be added to a seperate
;		register(R2) as part of the 16-bit result, the lower 8 bits is stored in R0.
;		Output the upper 8bits(R2) to port 0x42 and lower(R0) to 0x41
;
; Register uses:
; R0 - used as a parameter final value is lower 8 bits of the result
; R1 - used as a parameter
; R2 - upper 8 bits of the result
; R3 - input value 
; R4 - input value
;--------------------------------------------------------------------

.EQU OUT_PORT_UPPER =  0x42
.EQU OUT_PORT_LOWER = 0x41
.EQU IN_PORT = 0x9A
.CSEG
.ORG 0x01


main:
		IN R3, IN_PORT
		IN R4, IN_PORT
		MOV R0, R3
		MOV R1, R4

multiply:	CMP R1, 0
		BREQ output
		CALL ADD16
		SUB R1, 1
		BRN multiply

output:		OUT R0, OUT_PORT_LOWER
		OUT R2, OUT_PORT_UPPER

;------------------------------------------------------------------------------------
; ADD16 subroutine
; Adds 2 - 8 bit numbers and stores them into a 16 bit result {R2, R0}
; Parameters : R0 - value of an input
;	       R1 - value of an input
;	
; Return : R0 - lower 8 bits of result
;	   R2 - upper 8 bits of result
; Tweaked Parmeter : R0

ADD16:
	ADD R0, R1;
	ADDC R2, 0 ;
	RET 
;------------------------------------------------------------------------------------


