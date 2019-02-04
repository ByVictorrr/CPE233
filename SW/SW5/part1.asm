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
.EQU INC_ARR = 10 
;-----------------Data Segment-------------------------------------
.DSEG
.ORG 0x01;
.DEF R_INC = R0
.DEF R_LOWER = R1 
.DEF R_HIGER = R2
.DEF R_LOWER_ADDR = R3
.DEF R_HIGER_ADDR = R4
.DEF R_DIFF = R5

fib_seq: .DB 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 
;-------------------------------------------------------------------


;--------------------Code Segment --------------------------------
.CSEG
.ORG 0x1D

main: 	MOV R_INC, INC_ARR ; initalizing R_INC = 10
	
   ;address initalization of arary
	MOV R_LOWER_ADDR, fib_seq ; R_LOWER = address array[0]
	MOV R_HIGHER_ADDR, R_LOWER_ADDR ; 
	ADD R_HIGHER_ADDR, 3 ; R= 
	
	;Values at the location of address
	LD R_LOWER, R_LOWER_ADDR ; from sctach mem to reg
	LD R_HIGHER, R_HIGHER_ADDR ; from sctach mem to reg

diff:   SUB R_HIGHER, R_LOWER ; differnce
	MOV R_DIFF, R_HIGHER
	SUB R_INC, 1 ; decremen	
	BRNE output  ; branch only if z != 0	
	BRN main  
	
output: OUT R_DIFF
	ADD R_LOWER_ADDR, 1 ; incrment array address
	ADD R_HIGHER_ADDR, 1 ; incrment array adres
	BRN diff

 
