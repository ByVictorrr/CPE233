;--------------------------------------------------------------------
; RAT MCU Assignment 1.a
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
		
.EQU LED_PORT = 0x10               ; port for output
.CSEG
.ORG         0x40                  ; code starts here
        
main_loop:   MOV     R10,0x05
             MOV     R11,0x64
             ADD     R10,R11
             ADD     R10,0x14
             MOV     R20,R10
             OUT     R20,LED_PORT
             BRN     main_loop      ; endless loop 
