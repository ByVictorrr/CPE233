;--------------------------------------------------------------------
; Software Assignment 2.1
; Author: Victor Delaplaine
; Date: 1/14/19
; Description : Reads in an 8 bit unsigned value (X) from port 0x30. 
;		If X > 128, then the value X/4.
;		Else, th;en the value X*2;
;		This result should be ourput on port 0x42
;
; Register uses:
; R0 - read in X
; R1 - holds the result (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT
		CLC ; c = 0
		CMP R0, 128 ; (C and Z = X - 128 )
		BRCC div4  ; if (C and Z = 0 x >= 128  )
		LSL R0 ; ( R0 = R0 * 2)
		MOV R1, R0 ; R1 = R0
		BRN output ; PC = Output

div4: 		RSR R0 ;  ( x = x/2)
		CLC ; c = 0
		RSR R0 ; x = x/2
		MOV R1, R0 ; res = x

output:		OUT R1, OUT_PORT ; (OUT_PORT = res)

