

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


(0001)                       016  || .EQU LED_PORT = 0x10               ; port for output
(0002)                            || .CSEG
(0003)                       004  || .ORG         0x04                  ; code starts here
(0004)                            ||         
(0005)                            || 
(0006)  CS-0x004  0x36A05  0x004  || main_loop:   MOV     R10,0x05
(0007)  CS-0x005  0x36B64         ||              MOV     R11,0x64
(0008)  CS-0x006  0x02A58         ||              ADD     R10,R11
(0009)  CS-0x007  0x28A14         ||              ADD     R10,0x14
(0010)  CS-0x008  0x05451         ||              MOV     R20,R10
(0011)  CS-0x009  0x35410         ||              OUT     R20,LED_PORT
(0012)  CS-0x00A  0x08020         ||              BRN     main_loop      ; endless loop





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
MAIN_LOOP      0x004   (0006)  ||  0012 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LED_PORT       0x010   (0001)  ||  0011 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
