;--------------------------------------------------------------------
; Software Assignment 6.1
; Author: Victor Delaplaine
; Date: 2019-02-14
; Description : Read a sequence of values from port 0x9A.
; 		Each value is added to the stack until the
;		value read is 0xFF.
		
;		When 0xFF is inputted dont add 0xFF to the stack,
;		rather output the values saved in reverse order to 
;		port 0x42
;
; Register uses:
; R0 - for inputted values (X)
; R1 - for to count the number of values inputted before 0xff (count)
; R2 - for the index of the number begin outputed (current_SP = SP_START-count) 
; R3 - output value (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42 
.EQU SP_START = 0x00 ; assuming already start at zero
.CSEG


.ORG 0x01

main: 	IN R0, IN_PORT 
	;check if R0 is 0xFF
	MOV R3, R0 ; res = X
	EXOR R0, 0xFF
	;if (z==1){R0 == 0xFF}
	;else {R0 != 0xFF}
	BREQ output_1 ; if(z==1){PC = output }
	;else if z == 0

inc_push:	ADD R1, 1 ; count = count + 1		
		PUSH R3 ; arr[SP_START - count ] = X
		BRN main

output_1:	MOV R2, SP_START ;
		SUB R2, R1 ; R2 = SP_START - count

		; When R2 == SP_START end program
output_2:	CMP R2, SP_START 
		; if z == 1 { R2 == SP_START } 
		; else z==0 { R2 != SP_START}
		BREQ done
		;else if R2 != SP_START
		POP R3 ; res = arr[current_SP]
		OUT R3, OUT_PORT 
		ADD R2, 1
		BRN output_2
done: 
		

