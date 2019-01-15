;--------------------------------------------------------------------
; Software Assignment 2.1
; Author: Victor Delaplaine
; Date: 1/14/19
; Description : Reads in an 80bit unsigned value (X) from port 0x30. 
;		If X > 128, then the value X/4.
;		Else, th;en the value X*2;
;		This result should be ourput on port 0x42
;
; Register uses:
; R0 - holds the result (res)
; R1 - holds the result (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT
		MOV R3, R0 ; R3 <-- R0 (res = X)
		ADD R3, R1 ; R3 <-- R3 + R1 (res = X+Y)
		ADD R3, R2 ; R3 <-- R3 + R1 (res = res + Z)
		OUT R3, OUT_PORT 
		

