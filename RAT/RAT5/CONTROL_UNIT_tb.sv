/*
 * CONTROL_UNIT_tb
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/11/2019 00:54
// Design Name: 
// Module Name: CONTROL_UNIT_tb
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-11-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CONTROL_UNIT_tb();


		logic [4:0] OPCODE_HI_5,
		logic [1:0] OPCODE_LOW_2,
		logic INT_CU,
		logic C_FLAG,
		logic Z_FLAG,
		logic RESET,
		logic CLK,	
		 logic PC_LD,
		 logic PC_INC,
		 logic [1:0] PC_MUX_SEL,
		 logic ALU_OPY_SEL,
		 logic [3:0] ALU_SEL ,
		 logic RF_WR,
		 logic [1:0] RF_WR_SEL,
        	 logic FLG_C_SET,
        	 logic FLG_C_CLR,
        	 logic FLG_C_LD,
        	 logic FLG_Z_LD,
		 logic RST,
		 logic IO_STRB
		
	CONTROL_UNIT UUT(.*);


	initial begin
	CLK = 1;
	always CLK = ~ CLK;
	end	

	initial begin //actual test
//initalize firstj
	 	OPCODE_HI_5=0;
		 OPCODE_LOW_2=0;
		 INT_CU=0;
		 C_FLAG=0;
		 Z_FLAG=0;
		 RESET=0;
		 CLK=0;	
		
//TEST 1 - test the OPCODE 
# 10 
	       OPCODE_HI_5 = 
endmodule

