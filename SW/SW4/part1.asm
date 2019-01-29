j;--------------------------------------------------------------------
; Software Assignment 4.1
; Author: Victor Delaplaine 
; Date: 1/23/19
; Description : Reads a value from port 0x9a, this value is an 8 bit number (X).
;		X, is then divided by 3. Its result ouputed to port 0x42 and remainder to 0x43.
;
; Register uses:
; R0 - reads in value X: (X)
; R1 - remainder: (R)
; R2 - res of division: (res)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT_RES = 0x42
.EQU OUT_PORT_R = 0x43

.CSEG
.ORG 0x01 

main:		IN R0, IN_PORT ; X = IN_PORT
		MOV R1, R0 ; R = X

loop:		CMP R1, 0x03 ; R-3, if (C = 0 ){R >= 3}
		BRCC div3 ; if(C==0){PC=div3}else{PC=PC+1}
		BRN output		

div3:		SUB R1, 0x03 ; R=R-3
		ADD R2, 0x01 ; res=res+1	
		BRN loop;

		
output:		
		OUT R2, OUT_PORT_RES ; (OUT_PORT = res)
		OUT R1, OUT_PORT_R ; (OUT_PORT = R)
