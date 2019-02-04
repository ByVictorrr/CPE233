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
.EQU OUT_PORT = 

;-----------------Data Segment-------------------------------------
.DSEG
.ORG 0x01;

.DEF R_LOWER = R0 
.DEF R_HIGER = R1

fib_seq: .DB 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 
;-------------------------------------------------------------------


;--------------------Code Segment --------------------------------
.CSEG
.ORG 0x1D

main: 
