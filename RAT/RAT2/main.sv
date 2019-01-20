`include "./mux_4t1_nb.sv"
`include "./ProgCounter.sv"


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   VANC
// Engineer:  Victor Delaplaine and Crystal PrimaLang
// 
// Create Date: 01/18/2019 02:46:31 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A program counter that has a selection of 3 inputs to load. 
//  
//
// Dependencies:  mux_4t1_nb.sv, ProgCounter.sv
// 
// Revision:
// Revision 1.00 - File Created (01-18-2019)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module main(
	input CLK,
	input PC_LD, 
	input PC_INC, 
	input RST, 
	input [1:0] PC_MUX_SEL, 
	input [9:0] FROM_IMMED, 
	input [9:0] FROM_STACK,
	output reg [9:0] PC_COUNT );

wire [9:0] DIN;

mux_4t1_nb #(.n(10)) MUX(
	.SEL(PC_MUX_SEL),
	.D0(FROM_IMMED),
	.D1(FROM_STACK),
	.D2('h03FF),
	.D3(0),
	.D_OUT(DIN));

ProgCounter #(.n(10)) COUNTER(
	.DIN(DIN),
	.PC_LD(PC_LD),
	.PC_INC(PC_INC),
	.RST(RST),
	.CLK(CLK),
	.PC_COUNT(PC_COUNT));

endmodule
