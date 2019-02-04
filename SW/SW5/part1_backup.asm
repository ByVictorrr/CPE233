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
; R0 - 
; R1 - 
; R2 - 
;--------------------------------------------------------------------
.EQU OUT_PORT = 0x42  
.EQU INC_ARR = 7 

;--------------REG DEF--------------------------------------------
.DEF R_INC = R0
.DEF R_LOWER = R1 
.DEF R_HIGHER = R2
.DEF R_LOWER_ADDR = R3
.DEF R_HIGHER_ADDR = R4
.DEF R_DIFF = R5
;-----------------Data Segment-------------------------------------
.DSEG
.ORG 0x01;


fib_seq: .DB 0x00, 0x01, 0x01, 0x02, 0x03, 0x05, 0x08, 0xd, 0x15, 0x22, 0x37, 0x59, 0x90, 0xe9 

;-------------------------------------------------------------------


;--------------------Code Segment --------------------------------
.CSEG
.ORG 0x1D

main: 	MOV R_INC, INC_ARR ; initalizing R_INC = 10
	
   ;address initalization of arary
	MOV R3, fib_seq ; R_LOWER = address array[0]
	MOV R4, R3 ; get same value then add 3 
	ADD R4, 3 ; R= 

diff:	
		LD R_LOWER, R3; from sctach mem to reg
		LD R_HIGHER, R4; from sctach mem to reg
		SUB R_HIGHER, R_LOWER ; differnce
	
	MOV R_DIFF, R_HIGHER
	
	SUB R_INC, 1 ; decremen	
	BRNE output  ; branch only if z != 0	
	BRN main  
	
output: 
	OUT R_DIFF, OUT_PORT
	ADD R3, 1 ; incrment array address
	ADD R4, 1 ; incrment array adres
	BRN diff

 
