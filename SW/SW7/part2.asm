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
; R0 - parameter of MULT16 subroutine
; R1 - parameter of MULT16 subroutine, also return of lower 8 bits
; R2 - return of ADD16 subroutine, upper 8 bits
; R3 - parameter of MULT16 subroutine 
; R4 - parameter of MULT16 subroutine, also return of lower 8 bits
; R5 - return of MULT16 subroutine, upper 8 bits
; R6 - input reg
; R7 - input reg
;--------------------------------------------------------------------

.EQU OUT_PORT_UPPER =  0x42
.EQU OUT_PORT_LOWER = 0x41
.EQU IN_PORT = 0x9A
.CSEG
.ORG 0x01


main:
		IN R6, IN_PORT
		IN R7, IN_PORT
		MOV R3, R6
		MOV R4, R7
		CALL MULT16
		
	
output:	OUT R4, OUT_PORT_LOWER
		OUT R5, OUT_PORT_UPPER

end: BRN end ; branch to it self
;------------------------------------------------------------------------------------
; ADD16 subroutine
; Adds 2 - 8 bit numbers and stores them into a 16 bit result {R2, R0}
; Parameters : R0 a input
;			 : R1 an input
;	      
;	
; Return : R1 - lower 8 bits of result
;	   	   R2 - upper 8 bits of result 
; Tweaked Parmeter : R2

ADD16:
	CLC
	ADD R1, R0;
	ADDC R2, 0 ;
	RET 
;------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------
; MULT16 subroutine
; Multiplies two 8 bit numbers and stores them into a 16 bit result {R5, R2}
; Parameters : R3 - value of an input
;	       	   R4 - value of an input
;	
; Return : R4 - lower 8 bits of result
;	       R5 - upper 8 bits of result
; Tweaked Parmeter : R4

MULT16: MOV R0, R4

MULT16_loop:
		CMP R3, 0
		BREQ ret_MULT16
		CALL ADD16
		SUB R3, 1
		BRN MULT16_loop
		
ret_MULT16: 
			MOV R4, R1 ; setting R0 to lower 8 bit return value
			MOV R5, R2 ; setting R5 to higher 8 bit for return value
			
			RET	
;------------------------------------------------------------------------------------

