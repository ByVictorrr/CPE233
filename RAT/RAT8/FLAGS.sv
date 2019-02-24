`include "/home/victor/CPE233/Modules/mux_2t1_nb.v"

/*
 * FLAGS
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/03/2019 16:56
// Design Name: 
// Module Name: FLAGS
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


module FLAGS(
	input CLK,
	input FLG_C_SET,
	input FLG_C_LD,
	input C,
	input FLG_C_CLR,
	input FLG_Z_LD,
	input Z,
	output reg C_FLAG,
	output reg Z_FLAG
	output reg FLG_LD_SEL 
	output reg FLG_SHAD_LD
	);

//for C flip flop 
always_ff @(posedge CLK)
begin
	if (FLG_C_CLR ==1)
		C_FLAG <= 0;
	else if (FLG_C_SET == 1)
		C_FLAG <= 1;
	else if (FLG_C_LD == 1)
		C_FLAG <= C;
	
end	
//for Z flip flip
always_ff @(posedge CLK)
begin
	if (FLG_Z_LD ==1)
		Z_FLAG <= Z;
	
end
endmodule
 
