;- Programmer: Pat Wankaholic
;- Date: 09-29-10
;- 
;- This program does something really cool. Here's the description. 
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;- Port Constants
;--------------------------------------------------------------------
.EQU SWITCH_PORT = 0x30          ; port for switches ----- INPUT
.EQU LED_PORT = 0x0C             ; port for LED output --- OUTOUT
.EQU BTN_PORT = 0x10             ; port for button input - INPUT
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;- Misc Constants
;--------------------------------------------------------------------
.EQU BTN2_MASK = 0x08            ; mask all but BTN5
.EQU B0_MASK = 0x01              ; mask all but bit0
.EQU B1_MASK = 0x02              ; mask all but bit1
;--------------------------------------------------------------------    

;--------------------------------------------------------------------
;- Memory Designation Constants
;--------------------------------------------------------------------
.DSEG
.ORG     0x00

COW:   .DB 9,7,6,5 
       .DB 4,3,2,1 

.ORG     0x34

btn2_counter:  .BYTE    5
btn3_counter:  .BYTE    4
;--------------------------------------------------------------------
    
.CSEG
.ORG         0x00                            

start:       SEI                           ; enable interrupts 
            
main_loop:   IN      R0, BTN_PORT          ; input status of buttons
             IN      R1, SWITCH_PORT       ; input status of switches
             AND     R0, BTN2_MASK         ; clear all but BTN2 
             BRN     bit_wank              ; jumps when BTN2 is pressed
             
             ;-----------------------------------------------------------------
             ;- nibble wank portion of code
             ;-----------------------------------------------------------------
wank:        ROL      R1                   ; rotate 2 times - msb-->lsb
             ROL      R1
             MOV      R0,R1                ; transfer data register to be read out 
bit3:        BRN      fin_out              ; jump unconditionally to led output
             ;------------------------------------------------------------------
    
             ;------------------------------------------------------------------
             ; bit-wank algo: do something Blah, blah, blah ...
             ;-------------------------------------------------------------------
bit_wank:    LD      R0,0x00               ; clear s0 for use as working register
             
             OR      R0, B0_MASK           ; set bit0
bit1:        LSR     R1                    ; shift msb into carry bit
             BRCC    bit2                  ; jump if carry not set
             OR      R0, B1_MASK           ; set bit1
bit2:        LSR     R1                    ; shift msb into carry bit
             BRCS    bit3                  ; jump if carry not set
             ;------------------------------------------------------------------
             
             CALL    My_sub               ; subroutine call
fin_out:     OUT     R0,LED_PORT          ; output data to LEDs
             BRN     main_loop            ; endless loop   
             ;------------------------------------------------------------------
             
             ;------------------------------------------------------------------
             ; My_sub: This routines does something useful. It expects to find
             ; some special data in registers s0, s1, and s2. It changes the
             ; contents of registers blah, blah, blah...  
             ;-------------------------------------------------------------------
My_sub:      LSR     R1                   ; shift msb into carry bit
             BRCS    bit3                 ; jump if carry not set
             RET  




