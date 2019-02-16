;--------------------------------------------------------------------
; Software Assignment .1
; Author: Victor Delaplaine
; Date: 2019-02-12
; Description :  
;
; Register uses:
; R0 - holds the addr of the current characters being read 
; R1 - hold the value of the character just read 
; R2 - holds string length 
;--------------------------------------------------------------------
.DSEG 
.ORG 0x01

array: .DB 4, 9, 1, 1, 2

.EQU IN_PORT = 1
.EQU OUT_PORT = 2 
.EQU ST_ADDR = 1
.CSEG
.ORG 0x11


main_loop: 
		MOV R0, ST_ADDR
Loop1: 		
		ADD R0, 1
Loop2:
		LD R1, (R0)

		CMP R1, 0

		BREQ done

		ADD R3, 1
		
		BRN Loop1

done: OUT R3, OUT_PORT
	
