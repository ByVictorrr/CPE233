;--------------------------------------------------------------------
; Software Assignment 2.1
; Author: Victor Delaplaine
; Date: 1/14/19
; Description : Reads in an 80bit unsigned value (X) from port 0x30. 
;		If (X % 4 =0){ 
		;x is even => 
		
		;} 128, then the value X/4.
;		Else, th;en the value X*2;
;		This result should be ourput on port 0x42
;
; Register uses:
; R0 - holds the result (res)
; R1 - holds the temp (temp) for masking
; R2 - holds the result (result)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT
		MOV R1, R0 ; make copy of X
		AND R1, 0x03 ; masking (temp = temp &n 0x03 picking out 1's)
		CMP R1, 0x00 ;( if R1 = 0000000..0 then div by 4)
		BREQ div4 ; if(div by four) => jump to div4
		MOV R1, R0 ; R1=R0
		AND R1, 0x01 ; to check if x is even or odd
	
		; second branch
		CLC
		CMP R1, 0x01;
		BREQ odd ; (z = 1)
		ADD R0 = R0 - 0x01	 ; if even
		BRNE output ;

odd: 		ADD R0, 0x12 ; (X = X + 17)
		CLC ; (clear carry flag)
		RSR R0; 
		BRNE output


div4:		EXOR R0, 0xFF ;flip bits by using 111111111
		BRNE output	
	

output: 	OUT R0 ; output


		

