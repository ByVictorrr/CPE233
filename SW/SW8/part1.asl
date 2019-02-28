

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
(0002)                            || ; Software Assignment 8.1
(0003)                            || ; Author: Victor Delaplaine
(0004)                            || ; Date: 2019-02-27
(0005)                            || ; Description :  Interrupt drivewn program, that toggles the LED(port 0x42)
(0006)                            || ;		based on the input switches from port 0x9A when an interupt ;		    occurs. If the switch (SW) is a specific bit the correspond-;		ing bit on the LED will toggle.
(0007)                            || ;
(0008)                            || ; Register uses:
(0009)                            || ; R0 - input value (SW) 
(0010)                            || ; R1 - output value (LED) 
(0011)                            || ;--------------------------------------------------------------------
(0012)                            || 
(0013)                       066  || .EQU IN_PORT = 0x42
(0014)                       154  || .EQU OUT_PORT = 0x9A 
(0015)                            || 
(0016)                            || .CSEG
(0017)                       001  || .ORG 0x01
(0018)                            || 
(0019)                     0x001  || main:
(0020)  CS-0x001  0x1A000         || 	SEI ; enabling interrupts
(0021)                     0x002  || output: 
(0022)  CS-0x002  0x3419A         || 	OUT R1, OUT_PORT
(0023)  CS-0x003  0x08010         || 	BRN output 
(0024)                            || 
(0025)                     0x004  || ISR:
(0026)  CS-0x004  0x32042         || 	IN R0, IN_PORT
(0027)  CS-0x005  0x00102         || 	EXOR R1, R0 ;LED = LED xor SW
(0028)  CS-0x006  0x1A003         || 	RETIE
(0029)                            || 
(0030)                            || .CSEG 
(0031)                       1023  || .ORG 0x3FF
(0032)                            || 
(0033)  CS-0x3FF  0x08020         || 	BRN ISR
(0034)                            || 





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
ISR            0x004   (0025)  ||  0033 
MAIN           0x001   (0019)  ||  
OUTPUT         0x002   (0021)  ||  0023 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x042   (0013)  ||  0026 
OUT_PORT       0x09A   (0014)  ||  0022 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
