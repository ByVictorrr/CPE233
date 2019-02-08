

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ;--------------------------------------------------------------------
(0002)                            || ; Software Assignment .1
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 2019-02-03
(0005)                            || ; Description : inputted 10 values to an array from port_id 0x9A,
(0006)                            || ;		After the 10th value has been saved, the array
(0007)                            || ;		should be sorted from leaste to greatest.
(0008)                            || ;		The sorted array should be ouput to port_id 0x42 in order least to greatest.
(0009)                            || ;
(0010)                            || ; Register uses:
(0011)                            || ; R0 - input_count 
(0012)                            || ; R1 - outer count
(0013)                            || ; R2 - inner count
(0014)                            || ; R3 - ADDR for inner count arr[i]
(0015)                            || ; R4 - ADDR for inner count + 1 ( arr[i+1[)
(0016)                            || ; R5 - temp
(0017)                            || ; R6  - used for input and outputting values (X)
(0018)                            || ; R7 - value fro arr[i] 
(0019)                            || ; R8 - value for arr[i+1]
(0020)                            || ;--------------------------------------------------------------------
(0021)                       066  || .EQU OUT_PORT = 0x42  
(0022)                       010  || .EQU COUNT = 10
(0023)                       010  || .EQU OUTER_COUNT =  10 ; one extra one because on 10 transversal print out array
(0024)                       009  || .EQU INNER_COUNT = 9
(0025)                            || ;-----------------Data Segment-------------------------------------
(0026)                            || .DSEG
(0027)                       001  || .ORG 0x01;
(0028)                            || 
(0029)  DS-0x001             00A  || fib_seq: .BYTE 10 ; declare 10 bytes at 0x01 ....0x0B 
(0030)                            || ;-------------------------------------------------------------------
(0031)                            || 
(0032)                            || ;--------------------Code Segment --------------------------------
(0033)                            || .CSEG
(0034)                       029  || .ORG 0x1D
(0035)                            || 
(0036)  CS-0x01D  0x3610A  0x01D  || main: 	MOV R1, COUNT ; initalizing count_input = 10
(0037)  CS-0x01E  0x36301         || 	MOV R3, 1 ; address three is stored into arr[10 - count_input]
(0038)                            || 	
(0039)                            || ;read in 10 values and store in SCR from addrss 1 ... 11
(0040)                            || 	
(0041)                     0x01F  || input:  	
(0042)  CS-0x01F  0x32642         || 	IN R6, OUT_PORT ; x = 10-count_input value
(0043)  CS-0x020  0x04303         ||     ST R3, (R0) ; X = arr[10-count_input]	
(0044)  CS-0x021  0x28301         ||         ADD R3, 1 ; address = address + 1
(0045)  CS-0x022  0x2C001         || 	SUB R0, 1 ; count_input = count_input - 1
(0046)  CS-0x023  0x080FB         || 	BRNE input ; if(count_input-1 != 0){PC=input}else{PC=PC+1}
(0047)                            || 
(0048)                     0x024  || bubble_sort: 
(0049)  CS-0x024  0x3610A         || 	MOV R1, OUTER_COUNT ; outer_count = 10
(0050)                            || 
(0051)                            || 
(0052)                     0x025  || outer_loop: 
(0053)  CS-0x025  0x36209         || 	MOV R2, INNER_COUNT ; inner_count = 9
(0054)  CS-0x026  0x36309         || 	MOV R3, 9 ; ADDR_i  =9
(0055)  CS-0x027  0x3640A         || 	MOV R4, 10 ; ADDR_i+1 = 10
(0056)                            || 	
(0057)                     0x028  || inner_loop:
(0058)                            || 	;get index of k and k+1 from 0->10
(0059)                            || 
(0060)  CS-0x028  0x02312         || 	SUB R3, R2 ; ADDR_i = 9 - count_inner
(0061)  CS-0x029  0x02412         || 	SUB R4, R2 ; ADDR_i+1 = 10 - count_inner
(0062)                            || 	
(0063)                            || 	;get those values stored in the addres
(0064)  CS-0x02A  0x0471A         || 	LD R7, (R3) ; Y = arr[ADDR_i]
(0065)  CS-0x02B  0x04822         || 	LD R8, (R4) ; Z = arr[ADDR_i+1]
(0066)                            || 
(0067)                            || 	;COMPARE now
(0068)                            || 
(0069)  CS-0x02C  0x04838         || 	CMP R8, R7 ; 
(0070)                            || ;if we get c = 1 that means arr[ADDR_i] is greater than or equal to arr[ADDR_i+1]
(0071)                            || ;so lets swap if this is the case
(0072)  CS-0x02D  0x0A198         || 	BRCS swap 
(0073)                            || 
(0074)                     0x02E  || decrement_count_inner: 	
(0075)  CS-0x02E  0x2C201         || 	SUB R2, 1 ; count_inner = count_inner -1 
(0076)  CS-0x02F  0x08143         || 	BRNE inner_loop 
(0077)  CS-0x030  0x2C101         || 	SUB R1, 1
(0078)                            || 	
(0079)  CS-0x031  0x0812B         || 	BRNE outer_loop
(0080)  CS-0x032  0x081B8         || 	BRN output 
(0081)                            || 
(0082)                     0x033  || swap:   ;swap(arr[ADD_i], arr[ADD_i+1]) 
(0083)  CS-0x033  0x04539         || 	MOV R5, R7 ; temp = arr[ADDR_i]
(0084)  CS-0x034  0x04741         || 	MOV R7, R8 ; arr[ADDR_i] = arr[ADDR_i+1]
(0085)  CS-0x035  0x04829         || 	MOV R8, R5 ; arr[ADDR_i+1] temp
(0086)  CS-0x036  0x08170         || 	BRN decrement_count_inner 
(0087)                            || 
(0088)                            || ; check if count_outer ==1 to output sorted list
(0089)                            || 
(0090)                            || 	
(0091)  CS-0x037  0x3600A  0x037  || output: MOV R0, COUNT ; count = 10
(0092)  CS-0x038  0x36301         || 	MOV R3, 1 ;addres thre is stored in the arr[10-count] 
(0093)                            || 	
(0094)                     0x039  || output_arr:
(0095)  CS-0x039  0x0461A         ||         LD R6, (R3) ; X = arr[10-count_input]	
(0096)  CS-0x03A  0x34642         ||         OUT R6, OUT_PORT  
(0097)  CS-0x03B  0x28301         || 	ADD R3, 1 ; address = address + 1
(0098)  CS-0x03C  0x2C001         || 	SUB R0, 1 ; count_input = count_input - 1
(0099)  CS-0x03D  0x081CB         || 	BRNE output_arr ; 
(0100)                            || 
(0101)                            || 
(0102)                            || 
(0103)                            || 
(0104)                            || 
(0105)                            || 
(0106)                            || 
(0107)                            || 
(0108)                            || 
(0109)                            || 
(0110)                            || 
(0111)                            ||  





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
BUBBLE_SORT    0x024   (0048)  ||  
DECREMENT_COUNT_INNER 0x02E   (0074)  ||  0086 
INNER_LOOP     0x028   (0057)  ||  0076 
INPUT          0x01F   (0041)  ||  0046 
MAIN           0x01D   (0036)  ||  
OUTER_LOOP     0x025   (0052)  ||  0079 
OUTPUT         0x037   (0091)  ||  0080 
OUTPUT_ARR     0x039   (0094)  ||  0099 
SWAP           0x033   (0082)  ||  0072 


-- Directives: .BYTE
------------------------------------------------------------ 
FIB_SEQ        0x00B   (0029)  ||  


-- Directives: .EQU
------------------------------------------------------------ 
COUNT          0x00A   (0022)  ||  0036 0091 
INNER_COUNT    0x009   (0024)  ||  0053 
OUTER_COUNT    0x00A   (0023)  ||  0049 
OUT_PORT       0x042   (0021)  ||  0042 0096 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
