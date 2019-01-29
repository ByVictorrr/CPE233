`include "mux_16t1_nb.sv"

module ALU(
	input [3:0] SEL,
	input [7:0] A,
	input [7:0] B,
	input CIN,
	output [7:0] RESULT,
	output C,
	output Z,
	
);




mux_16t1_nb MUX(.*);

endmodule
