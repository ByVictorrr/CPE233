;------------------------------------------------------------------------------------------------------
.EQU LED_PORT		=   	0X40		;port for LED outputs
.EQU SWITCH_PORT	=   	0X20		;port for switch inputs
;------------------------------------------------------------------------------------------------------
.CSEG 
.ORG 0x40		


MOV R1, 23
ANDTest: 		MOV 	R3, 10
			AND 	R3, R2
			CMP 	R3, 0x0

			OR 	R20 , 2
			OUT 	R20, LED_PORT

