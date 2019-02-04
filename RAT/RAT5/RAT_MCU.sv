/*
 * RAT_MCU
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/03/2019 00:24
// Design Name: 
// Module Name: RAT_MCU
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-03-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAT_MCU(
	input [7:0] IN_PORT,
	input RESET,
	input INT,
	input CLK,
	output [7:0] OUT_PORT,
	output [7:0] PORT_ID;
	output IO_STRB);


CONTROL_UNIT

	
	ProgCounter PC(.DIN(),.PC_LD(),.PC_INC(),.RST(),.CLK(),PC_COUNT());
	ProgRom PROM();


	REG_FILE
SCRATCH_RAM
ALU alu();
endmodule

