;--------------------------------------------------------------------
; Software Assignment 1.a
; Author: Victor Delaplaine
; Date: 1/9/19
; Description : Reads in three values (X, Y, Z) from port 0x30, 
;               performs X+Y+Z, then outputs result (res) to 0x40
;
; Register uses:
; R0 - input value (X)
; R1 - input value (Y)
; R2 - input value (Z)
; R3 - holds the result (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x40

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT
		IN R1, IN_PORT
		IN R2, IN_PORT
		MOV R3, R0 ; R3 <-- R0 (res = X)
		ADD R3, R1 ; R3 <-- R3 + R1 (res = X+Y)
		ADD R3, R2 ; R3 <-- R3 + R1 (res = res + Z)
		OUT R3, OUT_PORT 
		

