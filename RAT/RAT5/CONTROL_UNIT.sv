/*
 * CONTROL_UNIT
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

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
	

	parameter n = 8; 
	
	//state variables
	logic [n-1:0] PS, NS;
	//bit level state rep
	parameter [n-1:0] st_A = 00, st_B = 00;



	
	//state register	
	always_ff @(posedge CLK)
	begin
		if(RESET == 1)	
			PS <= st_A;
		else
			PS <= NS;
			
	end

	
	//- model the next-state and output decoders
    always @ (x_in,PS)
    begin
       mealy = 0; moore = 0; // assign all outputs
       case(PS)
          st_A:
          begin
             moore = 1;        
             if (x_in == 1)
            begin
                mealy = 0;   
                NS = st_A; 
             end  
             else
             begin
                mealy = 1; 
                NS = st_B; 
             end  
          end
          
          st_B:
             begin
                moore = 0;
                mealy = 1;
                NS = st_C;
             end   
             
          st_C:
             begin
                 moore = 1; 
                 if (x_in == 1)
                 begin
                    mealy = 1; 
                    NS = st_B; 
                 end  
                 else
                 begin
                    mealy = 0; 
                    NS = st_A; 
                 end  
             end
             
          default: NS = st_A; 
            
          endcase
      end  	
endmodule

