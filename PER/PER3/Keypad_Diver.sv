`include "/home/victor/CPE233/Modules/ClockDivider.sv"
`include "/home/victor/CPE233/Modules/reg_nb.v"
`include "./BinSseg.sv"
`include "/home/victor/CPE233/PER/PER3/KeyFSM.sv"
`include "/home/victor/CPE233/PER/PER3/IntrFSM.sv"
/*
 * Keypad_Diver
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/19/2019 21:09
// Design Name: 
// Module Name: Keypad_Diver
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-19-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Keypad_Diver(
		input C,
		input A,
		input E,
		input CLK,
		output [6:0] seg,
		output [3:0] an,
		output B,
		output G,
		output F,
		output D,
		output INTR
		
		);


	logic [3:0] DATA;
	logic PRESS;
	logic [3:0] binary;
	logic sclk;

ClockDivider DIV(
      .clk(CLK),
      .maxcount(10), //change to mine
      .sclk(sclk)
);

KeyFSM KEY_FSM(
	 .CLK(sclk),
	 .C(C),
	 .A(A),
	 .E(E),
	 .PRESS(PRESS),
	 .DATA(DATA),
	 .B(B),
	 .G(G),
	 .F(F),
	 .D(D)
);

reg_nb #(.n(4)) key_to_seg(
	          .data_in  (DATA), 
	          .ld       (PRESS), 
	          .clk      (sclk), 
	          .clr      (0), //nvr clear
	          .data_out (binary)
          ); 

BinSseg seg_dcdr(
     		.binary(binary),    
     		.seg(seg),
     		.an(an)
    );   
 

IntrFSM INTR_FSM(
	 .PRESS(PRESS),
	 .CLK(CLK),
	 .INTR(INTR)
);

endmodule

