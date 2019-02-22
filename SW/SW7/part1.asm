;--------------------------------------------------------------------
; Software Assignment 7.1
; Author: Victor Delaplaine
; Date: 2019-02-20
; Description : Create a subroutin that will divide a value by 10, then use the soubtouine to
;		convert an unsigned 8-bit value into a 3 digit binary coded decimal.
;		The main program should read in the value X from port_id 0x9A.
;		The value will tbe converted into a BC of 3 values 100's 10s and 1's places,
;		Finally 1s is outputed on port 0x43, 10th on port 0x42, and 100s on port 41.
;
; Register uses:
; R0 - parmeter for DIV10 
; R1 - result of DIV10
; R2 - input value
; R3 - ones place of R2
; R4 - tens place of R2
; R5 - hundreds place of R2
; R6 - for masking temp
;--------------------------------------------------------------------
; use div 10 to find ones , ten, hundreds
.EQU OUT_PORT_ONES =  0x43
.EQU OUT_PORT_TENS =  0x42
.EQU OUT_PORT_HUNDS =  0x41
.EQU IN_PORT = 0x9A
.CSEG
.ORG 0x01

main:
		IN R2, IN_PORT
		MOV R0, R2 ; using R0 as parameter
		CALL DIV10 ; getting 1's place
		OUT R0, OUT_PORT_ONES ; outputs 1's place of  
		
		MOV R0, R1 ;  
		CALL DIV10
		OUT R0, OUT_PORT_TENS ;
		OUT R1, OUT_PORT_HUNDS 		

end:		BRN end

;------------------------------------------------------------------------------------
; DIV10 subroutine
; Divdes an 8 bit number by 10 and stores it into R1, the remainder is stored into R1
; Parameters : R0 - value being divided by 10
;	
; Return : R0 - remainder
;	   R1 - number divided by 10
; Tweaked : R0
DIV10:		
		CMP R0, 10
		;if (R0 < 0){that is if c==1 return}
		BRCC loop_DIV10
		RET ; if c==1 return

loop_DIV10: 	SUB R0, 10
		ADD R1, 1
		BRN DIV10
		 
;------------------------------------------------------------------------------------
