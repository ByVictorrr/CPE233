;--------------------------------------------------------------------
; Software Assignment 3.2
; Author: Victor Delaplaine
; Date: 1/23/19
; Description : Reads a value from port 0x9a, delays for .5s,
;		Then outputs to the port 0x42
;
;
; Register uses:
; R0 - reads in value X: (X)
; R1 - outer count variable  (C1)
; R2 - middle count variable  (C2)
; R3 - inner count variable  (C3)

;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

.EQU COUNT_INNER = 108
.EQU COUNT_MIDDLE = 232
.EQU COUNT_OUTER = 246
;N_inner = 5
;N_middle = 3
;N_outer = 2


.CSEG
.ORG 0x01 

main:	IN R0, IN_PORT ; X = IN_PORT
		MOV R1, COUNT_OUTER ; R1 = OUTER_COUNT

outer_loop:	MOV R2, COUNT_MIDDLE
				
 	
middle_loop:	MOV R3, COUNT_INNER
		
inner_loop:	SUB R3, 1 
		CLC
		CLC
		CLC
		BRNE inner_loop
		
		CLC
		BRNE middle_loop
		BRNE outer_loop
		
output:		OUT R0, OUT_PORT ; (OUT_PORT = res)

