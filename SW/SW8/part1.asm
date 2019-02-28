;--------------------------------------------------------------------
; Software Assignment 8.1
; Author: Victor Delaplaine
; Date: 2019-02-27
; Description :  Interrupt drivewn program, that toggles the LED(port 0x42)
;		based on the input switches from port 0x9A when an interupt ;		    occurs. If the switch (SW) is a specific bit the correspond-;		ing bit on the LED will toggle.
;
; Register uses:
; R0 - input value (SW) 
; R1 - output value (LED) 
;--------------------------------------------------------------------

.EQU IN_PORT = 0x42
.EQU OUT_PORT = 0x9A 

.CSEG
.ORG 0x01

main:
	SEI ; enabling interrupts
output: 
	OUT R1, OUT_PORT
	BRN output 

ISR:
	IN R0, IN_PORT
	EXOR R1, R0 ;LED = LED xor SW
	RETIE

.CSEG 
.ORG 0x3FF

	BRN ISR

