;--------------------------------------------------------------------
;- Programmer: Jeff Gerfen
;- Date: 2011.01.09
;- 
;- Program Functionality:  Initialize R10 and R11 with decimal 5
;- and decimal 100 respectively, add the two values and place 
;- the result back into R10.  Then add 20 decimal to this sum 
;- placing the result back into R10.  Move this result from R10
;- to R20 and then output this result to port 0x100.  
;- This program should be stored at address 0xA0 in instruction 
;- memory.
;--------------------------------------------------------------------


;--------------------------------------------------------------------
;- Port Constants
;--------------------------------------------------------------------
.EQU LED_PORT = 0x10            ; port for LED output --- OUTOUT
;--------------------------------------------------------------------


;--------------------------------------------------------------------
;- Memory Designation Constants
;--------------------------------------------------------------------
.DSEG
.ORG     0x00
;--------------------------------------------------------------------
 

;--------------------------------------------------------------------
;- Main program
;--------------------------------------------------------------------
  
.CSEG
.ORG         0x00           

main_loop:   MOV     R10,0x05
             MOV     R11,0x64
             ADD     R10,R11
             ADD     R10,0x14
             MOV     R20,R10
             OUT     R20,LED_PORT
             BRN     main_loop            ; endless loop   
                              
