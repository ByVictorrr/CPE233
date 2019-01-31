;--------------------------------------------------------------------
; Software Assignment 4.2
; Author: Victor Delaplaine 
; Date: 1/23/19
; Description : Reads two values from port 0x9a, this value is an 8 bit numbers (X,Y).
;		X, is then divided by Y. Its result outputed to port 0x42 and remainder to 0x43.
;
; Register uses:
; R0 - reads in value X: (X)
; R1 - reads in value Y: ()
; R2 - res of division: (res)
; R3 - remainder: (R)
;--------------------------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT_RES = 0x42
.EQU OUT_PORT_R = 0x43

.CSEG
.ORG 0x01 

main:   	IN R0, IN_PORT ; X = IN_PORT
		IN R1, IN_PORT ; y = IN_PORT
		MOV R3, R0 ; R = X
		;is Y ==0 ?
		CMP R1, 0x00 ; R1-0, if(R1-0 == 0){z ==1, implying R1 = 0}
		BREQ output ;


loop:   	CMP R3,R1  ; R-Y, if (C = 0 ){R >= 3}
		BRCC div ; if(C==0){PC=div}else{PC=PC+1}
		BRN output		

div:	SUB R3, R1 ; R=R-Y
		ADD R2, 0x01 ; res=res+1	
		BRN loop 

		
output:		
		OUT R2, OUT_PORT_RES ; (OUT_PORT = res)
		OUT R3, OUT_PORT_R ; (OUT_PORT = R)
