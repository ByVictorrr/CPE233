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
	input FLG_LD_SEL,
    input FLG_SHAD_LD,
	output reg C_FLAG,
	output reg Z_FLAG
	
	);




	logic C_SHAD_OUT, Z_SHAD_OUT;
	logic C_IN, Z_IN;	
	mux_2t1_nb #(.n(1)) C_MUX(
			.SEL(FLG_LD_SEL),
			.D0(C),
			.D1(C_SHAD_OUT),
			.D_OUT(C_IN)
	);
	
//for C flip flop 

always_ff @(posedge CLK)
begin
	if (FLG_C_CLR ==1)
		C_FLAG <= 0;
	else if (FLG_C_SET == 1)
		C_FLAG <= 1;
	else if (FLG_C_LD == 1)
		C_FLAG <= C_IN;
	
end	

//C shadow
always_ff @(posedge CLK)
begin
	 if (FLG_LD_SEL == 1)
		C_SHAD_OUT <= C_FLAG;;
	
end	

	mux_2t1_nb #(.n(1)) Z_MUX(
			.SEL(FLG_LD_SEL),
			.D0(Z),
			.D1(Z_SHAD_OUT),
			.D_OUT(Z_IN)
	);
	


//for Z flip flip/
always_ff @(posedge CLK)
begin
	if (FLG_Z_LD ==1)
		Z_FLAG <= Z_IN;
	
end


//Z shadow
always_ff @(posedge CLK)
begin
	if (FLG_LD_SEL == 1)
		Z_SHAD_OUT <= Z_FLAG;
	
end	




endmodule
 
