;-----------------------------
.CSEG
.ORG         0x040                  ; code starts here

main_loop:   MOV     R29,  0xFC

			ADD     R29, 0x01

             MOV     R30, 0xFA

             MOV     R31, 0x05

             EXOR    R30, R31

			 SUB     R30, R29

			 BRNE    0x41

			 AND     R0, R0

             BRN     main_loop      ; endless loop 

