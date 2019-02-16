

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


		logic [4:0] OPCODE_HI_5;
		logic [1:0] OPCODE_LOW_2;
		logic INT_CU;
		logic C_FLAG;
		logic Z_FLAG;
		logic RESET;
		logic CLK;	
		 logic PC_LD;
		 logic PC_INC;
		 logic [1:0] PC_MUX_SEL;
		 logic ALU_OPY_SEL;
		 logic [3:0] ALU_SEL ;
		 logic RF_WR;
		 logic [1:0] RF_WR_SEL;
        	 logic FLG_C_SET;
        	 logic FLG_C_CLR;
        	 logic FLG_C_LD;
        	 logic FLG_Z_LD;
		 logic RST;
		logic IO_STRB;
		
	CONTROL_UNIT UUT(.*);


	initial begin
	CLK = 1;
	forever # 5 CLK = ~ CLK;
	end	

	initial begin //actual test
//initalize firstj
		

//TEST 1 - test the OPCODE 
# 10 //test mov reg 
		OPCODE_HI_5 =  2'b000_10; // should output 
		OPCODE_LOW_2 = 2'b01; //
		//should output ALU_OPY_SEL = 0;
# 10 //test mov immedaite 
		OPCODE_HI_5 =  2'b000_10; // should output 
		OPCODE_LOW_2 = 2'b00; //
		//should output ALU_OPY_SEL = 1;
#10 //test EXOR	
		OPCODE_HI_5 =  2'b000_00; // should output 
		OPCODE_LOW_2 = 2'b00; 
		//should ouput ALU_OPY_SEL = 0
end
		 	
endmodule

