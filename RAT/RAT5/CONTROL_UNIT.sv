/*
 * CONTROL_UNIT
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/02/2019 22:45
// Design Name: 
// Module Name: CONTROL_UNIT
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-02-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CONTROL_UNIT(
		input [4:0] OPCODE_HI_5,
		input [1:0] OPCODE_LOW_2,
		input INT,
		input C_FLAG,
		input Z_FLAG,
		input RESET,
		input CLK,
		input I_SET,
		input I_CLR,
		
		output I_SET,
		output I_CLR,
		output PC_LD,
		output PC_INC,
		output [1:0] PC_MUX_SEL,



		output PC_CTRL,
		output [2:0] STACK_CTRL,
		output [2:0] REG_FILE_CTRL,
		output [4:0] ALU_CTRL,
		output [3:0] SCR_CTRL,
		output [5:0] FLAG_CTRL,
		output RST
	
	);
	

	logic [6:0] opcode;
	assign opcode = {OPCODE_HI_5, OPCODE_LOW_2};
	
	typedef enum{ST_INIT, ST_FETCH, ST_EXEC}
	STATE;
	
	STATE NS, PS = ST_INIT;
	
	 
	



	
	//state register	
	always_ff @(posedge CLK)
	begin
		if(RESET == 1)	
			PS <= ST_INIT;
		else
			PS <= NS;
			
	end

	
	//- model the next-state and output decoders
    always_comb
    begin
       
       
       I_SET = 0;
       I_CLR = 0;
       PC_LD = 0;
       PC_INC = 0;
       PC_MUX_SEL = 0;
       PC_CTRL = 0;
       STACK_CTRL = 0;
       REG_FILE_CTRL = 0;
       ALU_CTRL = 0;
       SCR_CTRL = 0;
       FLAG_CTRL = 0;
       RST = 0;
       case(PS)
          ST_INIT:
          begin
          RST = 1;
          NS = ST_FETCH;
            
      end
        	
      ST_FETCH: 
      begin
      PC_INC = 1;
      NS = ST_EXEC;
      end
      ST_EXEC: 
      begin
      case(opcode)
      //IN
      7'b1100100, 7'b1100101, 7'b1100110, 7'b1100111:
      begin
      RF_WR_SEL = 3;
      RF_WR = 1;
      end
      //MOV
      
      
      default :
      RST = 1; //never gets here
      
     endcase  
endmodule
