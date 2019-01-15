`include "./mux_4t1_nb.sv"
`include "./ProgCounter.sv"

module main(
	input CLK,
	input PC_LD, 
	input PC_INC, 
	input RST, 
	input [1:0] PC_MUX_SEL, 
	input [9:0] FROM_IMMED, 
	input [9:0] FROM_STACK,
	output PC_COUNT [9:0]);

wire [9:0] DIN;

mux_4t1_nb #(.n(10)) MUX(
	.SEL(PC_MUX_SEL),
	.D0(FROM_IMMED),
	.D1(FROM_STACK),
	.D2('h03FF),
	.D3(0),
	.D_OUT(DIN));

ProgCounter #(.(10))COUNTER(
	.DIN(DIN),
	.PC_LD(PC_LD),
	.PC_INC(PC_INC),
	.RST(RST),
	.CLK(CLK),
	.PC_COUNT(PC_COUNT));

endmodule
