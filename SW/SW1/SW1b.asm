;--------------------------------------------------------------------
; Software Assignment 1.b
; Author: Victor Delaplaine
; Date: 1/9/19
; Description : Reads in one value (X) from port 0x30, 
;               performs ~X+1(twos complement), then outputs result (res) to 0x40
;
; Register uses:
; R0 - input value (X)
; R1 - holds the result (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x40

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT
		SUB R1, R0 ; R1 <-- R1 - R0 (res = 0 - X)
		OUT R1, OUT_PORT 
		

