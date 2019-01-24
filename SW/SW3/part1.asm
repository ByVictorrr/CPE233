;--------------------------------------------------------------------
; Software Assignment 3.1
; Author: Victor Delaplaine
; Date: 1/23/19
; Description : Reads a value from port 0x9a, this value is an 8 bit number (X).
;		X, is two 4-bit unsigned number X1(4MSB) and X2(4LSB).
;		X1=X[7:4]
;		X2=X[3:0]
;		res = X1*X2
;		Output res 
;
; Register uses:
; R0 - reads in X
; R1 - holds higher 4 -bits of X
; R2 - holds lower 4 -bits of X
; R3 - holds the result (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT ; X = IN_PORT
		AND 

output:		OUT R1, OUT_PORT ; (OUT_PORT = res)

