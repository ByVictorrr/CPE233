;--------------------------------------------------------------------
; Software Assignment 8.2
; Author: Victor Delaplaine
; Date: 2019-02-27
; Description :  Interrupt drivewn program, that toggles the LED(port 0x42)
;		based on the input switches from port 0x9A when an interupt occurs. 
;		If the switch (SW) is a specific bit the corresponding bit on the LED will toggle.
;		
;		if the switch values are the same for the consecutive cycles, then disable interupts,
;		ouput led = 0, until an input of BTN[0] == 1, then output the previous led value, 
;		enable interrupts and output it, and return to the ISR functionality.
; Register uses:
; R0 - input value (SW) 
; R1 - output value (LED) 
; R2 - previous value of the switches (prev_SW)
; R3 - previous value of the LED (prev_LED)
; R4 - input value (BTN)
;--------------------------------------------------------------------

.EQU IN_PORT_SW = 0x9A
.EQU IN_PORT_BTN = 0x9B
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0x01

main:
	SEI ; enabling interrupts
output: 
	OUT LED, OUT_PORT
	BRN output 

ISR:
	IN R0, IN_PORT
	CMP R0, R2 ; Z = 1 (if SW == prev_SW)
	MOV R2, R0 ; prev_SW = SW
	BREQ isr_op
	EXOR R1, R0 ;LED = LED xor SW
	MOV R3, R1 ; prev_LED = LED
	RETIE ; done

isr_branch:

	CLI ; disable interrupts
	MOV R0, 0 ; LED = 0
	OUT R0, OUT_PORT 
	IN R4, IN_PORT_BTN ; BTN
	;get BTN[0] compare to 1
	
read_btn: 
	AND R4, 0x01 ; if BTN[0] == 1 (BTN = 1) else BTN =0;
	BREQ read_btn
	; if BTN[0] == 1
	MOV R1, R3 ; LED = prev_LED
	SEI
	OUT R1, OUT_PORT 
	BRN ISR
	

.CSEG 
.ORG 0x3FF

	BRN ISR

