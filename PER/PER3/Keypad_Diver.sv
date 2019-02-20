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

`include "/home/victor/CPE233/Modules/ClockDivider.sv"

`include "/home/victor/CPE233/Modules/reg_nb.v"
`include "./sevenSegment.sv"
`include "/home/victor/CPE233/Modules/KeyFSM.sv"
`include "/home/victor/CPE233/Modules/IntrFSM.sv"
module Keypad_Diver(
		input C,
		input A,
		input E,
		input CLK,
		output [6:0] seg,
		output [3:0] an
		output B,
		output G,
		output F,
		output D
		output INTR);



endmodule

