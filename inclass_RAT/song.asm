;--------------------------------
;Short Song
;By: Bridget Benson
;Illustrates how to use subroutines
;By playing a short song.
;Quarter note is a half second
;
;--------------------------------


;Counts to generate a half second
;in subroutine.  Counts reduced to 2
;for testing purposes (actual counts
;in comments
.EQU INSIDE_FOR_COUNT    = 2;0xB4
.EQU MIDDLE_FOR_COUNT    = 2;0xCA
.EQU OUTSIDE_FOR_COUNT   = 2;0xAA


.EQU SPEAKER = 0x41

.CSEG
.ORG 0x01

		MOV		R16, 1	;set delay value
		MOV		R0, 1	;Note C
		MOV		R1, 3 	;Note D
		MOV		R2, 5	;Note E		
		
		
		;START SONG
		OUT		R2, SPEAKER
		CALL	delay			;Plays quarter note
		OUT		R1, SPEAKER
		CALL	delay			;Plays quarter ntoe
		OUT		R0, SPEAKER
		MOV		R16, 2			;Play half note
		CALL	delay
		OUT		R17, SPEAKER
		MOV		R16, 1	
		CALL	delay			;Play quarter note
		OUT		R1, SPEAKER
		CALL	delay			;Play quarter note
		OUT		R0, SPEAKER
		MOV		R16, 4 			
		CALL 	delay			;Play full note
		MOV		R0, 0
		OUT		R0, SPEAKER		;Turn off





;----------------DELAY SUBROUTINE----------------
;Delays in increments of about a half second
;Parameters: R16 - number of half seconds to delay
;Return Value: none
;Tweaked registers: R17, R18, R19, R20
;------------------------------------------------			

delay:			MOV		R20, R16
begin_loop:		MOV     R17, OUTSIDE_FOR_COUNT  
outside_for0: 	SUB     R17, 0x01

             	MOV     R18, MIDDLE_FOR_COUNT   
middle_for0:  	SUB     R18, 0x01
             
             	MOV     R19, INSIDE_FOR_COUNT   
inside_for0:  	SUB     R19, 0x01
             	BRNE    inside_for0
             
             	OR      R18, 0x00              
             	BRNE    middle_for0
             
             	OR      R17, 0x00               
             	BRNE    outside_for0
				
				SUB		R20, 1
				BRNE	begin_loop
				RET
				
				