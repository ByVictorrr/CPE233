`include "mux_2t1_nb.sv"

module Arithmetic_unit(
	input [3:0] SEL,
	input [n-1:0] A,
	input [n-1:0] B,
	input CIN,
	output [7:0] RESULT,
	output C,
	output Z,
	
);






mux_16t1_nb MUX(.*);

endmodule
