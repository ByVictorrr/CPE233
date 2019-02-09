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
		input INT_CU,
		input C_FLAG,
		input Z_FLAG,
		input RESET,
		input CLK,
		
		
		output logic I_SET,
		output logic I_CLR,
		output logic PC_LD,
		output logic PC_INC,
		output logic [1:0] PC_MUX_SEL,
		output logic ALU_OPY_SEL,
		output logic [3:0] ALU_SEL ,
		output logic RF_WR,
		output logic [1:0] RF_WR_SEL,
		output logic SP_LD,
		output logic SP_INCR,
		output logic SP_DECR,
		output logic SCR_WE,
		output logic [1:0] SCR_ADDR_SEL,
		output logic SCR_DATA_SEL,
        	output logic FLG_C_SET,
        	output logic FLG_C_CLR,
        	output logic FLG_C_LD,
        	output logic FLG_Z_LD,
        	output logic FLG_LD_SEL,
        	output logic FLG_SHAD_LD,
		output logic RST,
		output logic IO_STRB
		
	
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
      PC_MUX_SEL = 0;
      ALU_OPY_SEL = 0;
      ALU_SEL = 0;
      RF_WR = 0;
      SP_LD = 0;
      SP_INCR = 0;
      SP_DECR = 0;
      SCR_WE = 0;
      PC_LD = 0;    
      RF_WR_SEL = 0; 
      FLG_C_SET = 0;
      FLG_C_CLR = 0;
      FLG_C_LD = 0;
      FLG_Z_LD = 0;
      FLG_LD_SEL = 0;
      FLG_SHAD_LD = 0;
      RST = 0;
    PC_INC = 0;
    IO_STRB = 0;
    
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
      RST = 0;
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
      7'b1101100, 7'b1101101, 7'b1101110, 7'b1101111:
      begin
      RF_WR = 1;
      ALU_OPY_SEL = 1;
      ALU_SEL = 14;
      end
      //EXOR
      7'b0000010:
      begin
      RF_WR = 1;
      ALU_OPY_SEL = 1;
      ALU_SEL = 7;
      FLG_Z_LD = 1;
      FLG_C_CLR = 1;
      end
      //OUT
      7'b1101000, 7'b1101001, 7'b1101010, 7'b1101011, 7'b0001001:
      begin
      IO_STRB = 1;
      end
      //BRN
      7'b0010000:
      begin
      PC_LD = 1;
      PC_MUX_SEL = 0;
      end
      
      default : RST = 0; //never gets here
      
       
     endcase
     
     NS = ST_FETCH; 
     end //end of ST_EXEC
     default : NS = ST_INIT; 
     endcase
     end 
     
   endmodule
