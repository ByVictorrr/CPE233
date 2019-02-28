

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
(0002)                            || ; Software Assignment 8.2
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 2019-02-27
(0005)                            || ; Description :  Interrupt drivewn program, that toggles the LED(port 0x42)
(0006)                            || ;		based on the input switches from port 0x9A when an interupt occurs. 
(0007)                            || ;		If the switch (SW) is a specific bit the corresponding bit on the LED will toggle.
(0008)                            || ;		
(0009)                            || ;		if the switch values are the same for the consecutive cycles, then disable interupts,
(0010)                            || ;		ouput led = 0, until an input of BTN[0] == 1, then output the previous led value, 
(0011)                            || ;		enable interrupts and output it, and return to the ISR functionality.
(0012)                            || ; Register uses:
(0013)                            || ; R0 - input value (SW) 
(0014)                            || ; R1 - output value (LED) 
(0015)                            || ; R2 - previous value of the switches (prev_SW)
(0016)                            || ; R3 - previous value of the LED (prev_LED)
(0017)                            || ; R4 - input value (BTN)
(0018)                            || ;--------------------------------------------------------------------
(0019)                            || 
(0020)                       154  || .EQU IN_PORT_SW = 0x9A
(0021)                       155  || .EQU IN_PORT_BTN = 0x9B
(0022)                       066  || .EQU OUT_PORT = 0x42
(0023)                            || 
(0024)                            || .CSEG
(0025)                       001  || .ORG 0x01
(0026)                            || 
(0027)                     0x001  || main:
(0028)  CS-0x001  0x1A000         || 	SEI ; enabling interrupts
(0029)                     0x002  || output: 
(0030)  CS-0x002  0x34142         || 	OUT R1, OUT_PORT
(0031)  CS-0x003  0x08010         || 	BRN output 
(0032)                            || 
(0033)                     0x004  || ISR:
(0034)  CS-0x004  0x3209A         || 	IN R0, IN_PORT_SW
(0035)  CS-0x005  0x04010         || 	CMP R0, R2 ; Z = 1 (if SW == prev_SW)
(0036)  CS-0x006  0x04201         || 	MOV R2, R0 ; prev_SW = SW
(0037)  CS-0x007  0x0805A         || 	BREQ isr_branch
(0038)  CS-0x008  0x00102         || 	EXOR R1, R0 ;LED = LED xor SW
(0039)  CS-0x009  0x04309         || 	MOV R3, R1 ; prev_LED = LED
(0040)  CS-0x00A  0x1A003         || 	RETIE ; done
(0041)                            || 
(0042)                     0x00B  || isr_branch:
(0043)                            || 
(0044)  CS-0x00B  0x1A001         || 	CLI ; disable interrupts
(0045)  CS-0x00C  0x36000         || 	MOV R0, 0 ; LED = 0
(0046)  CS-0x00D  0x34042         || 	OUT R0, OUT_PORT 
(0047)  CS-0x00E  0x3249B         || 	IN R4, IN_PORT_BTN ; BTN
(0048)                            || 	;get BTN[0] compare to 1
(0049)                            || 	
(0050)                     0x00F  || read_btn: 
(0051)  CS-0x00F  0x20401         || 	AND R4, 0x01 ; if BTN[0] == 1 (BTN = 1) else BTN =0;
(0052)  CS-0x010  0x0807A         || 	BREQ read_btn
(0053)                            || 	; if BTN[0] == 1
(0054)  CS-0x011  0x04119         || 	MOV R1, R3 ; LED = prev_LED
(0055)  CS-0x012  0x1A000         || 	SEI
(0056)  CS-0x013  0x34142         || 	OUT R1, OUT_PORT
(0057)  CS-0x014  0x08020         || 	BRN ISR
(0058)                            || 	
(0059)                            || 
(0060)                            || .CSEG 
(0061)                       1023  || .ORG 0x3FF
(0062)                            || 
(0063)  CS-0x3FF  0x08020         || 	BRN ISR
(0064)                            || 





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
ISR            0x004   (0033)  ||  0057 0063 
ISR_BRANCH     0x00B   (0042)  ||  0037 
MAIN           0x001   (0027)  ||  
OUTPUT         0x002   (0029)  ||  0031 
READ_BTN       0x00F   (0050)  ||  0052 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT_BTN    0x09B   (0021)  ||  0047 
IN_PORT_SW     0x09A   (0020)  ||  0034 
OUT_PORT       0x042   (0022)  ||  0030 0046 0056 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
