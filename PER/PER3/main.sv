`include "./Keypad_Diver.sv"
`include "./BinSseg.sv"
/*
 * main
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/21/2019 19:49
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-21-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
	input A,
	input B,
	input C,
	input D,
	input E,
	input F,
	input G,
	input CLK,
	output [3:0] an,
	output [7:0] seg,
);

Keypad_Diver KEY_DRIVER(
		.C(C),
		.A(A),
		.E(E),
		.CLK(CLK),
		.seg(),
		.an(),
		.B(),
		.G(),
		.F(),
		D(),
		.INTR()
);
	_
endmodule

