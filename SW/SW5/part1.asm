;--------------------------------------------------------------------
; Software Assignment .1
; Author: Victor Delaplaine
; Date: 2019-02-03
; Description : Create an array in the data segment (1..n=14) fib seq
;		Iterate through array and calc diff between values that
;		are three spots aways from eachother.
;		When no value is availble to subtract dont subtract.
;		For each differnce output to port 0x42
;
;
; Register uses:
; R0 - for incrementing (count) 
; R1 - for lower number in the array (Lower)
; R2 - for higher number in the array (Higher)
; R3 - for lower numbers address in the array (Higher_ADDR)
; R4 - for higher numbers address in the array (Lower_ADDR)
; R5 - for the difference between higher and lower value (DIFF = Higher - Lower)
;--------------------------------------------------------------------
.EQU OUT_PORT = 0x42  
.EQU INC_ARR = 12 
;-----------------Data Segment-------------------------------------
.DSEG
.ORG 0x01;

fib_seq: .DB 0x00, 0x01, 0x01, 0x02, 0x03, 0x05, 0x08, 0x0d, 0x15, 0x22, 0x37, 0x59, 0x90, 0xe9 
;-------------------------------------------------------------------


;--------------------Code Segment --------------------------------
.CSEG
.ORG 0x1D

main: 	MOV R0, INC_ARR ; initalizing R0 = 10
	
   ;address initalization of arary
	MOV R3, 1 ; R1 = address array[1]
	MOV R4, R3 ;
	ADD R4, 3 ; R= 
	
	
diff:	
	;Values at the location of address

	LD R1, (R3) ; from sctach mem to reg (lower value)
	LD R2, (R4) ; from sctach mem to reg (higher value)
	
    SUB R2, R1 ; differnce
	MOV R5, R2


	SUB R0, 1 ; decremen	
	BRNE output  ; branch only if z != 0	
	BRN done  
	

output: OUT R5, OUT_PORT

	ADD R4, 1 ; incrment array address
	ADD R3, 1 ; incrment array adres
	BRN diff

 done: CLC
