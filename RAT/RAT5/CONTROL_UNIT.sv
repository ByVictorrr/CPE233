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

//======================SIGNALS NOT USED =====================\\

//========INPUT:
//
//======OUTPUTS:
//	1.)output I_SET;
//	2.)output I_CLR;
//	3.)output SP_LD 
//	4.)output SP_INCR;
//	5.)output SP_DECR;
//	6.)output SCR_WE;
//	7.)output [1:0] SCR_ADDR_SEL;
//	8.)output SCR_DATA_SEL;
//	9.)output FLG_LD_SEL;
//	10.)output FLG_SHAD_LD
module CONTROL_UNIT(
		input [4:0] OPCODE_HI_5,
		input [1:0] OPCODE_LOW_2,
		input INT_CU,
		input C_FLAG,
		input Z_FLAG,
		input RESET,
		input CLK,	
		output logic PC_LD,
		output logic PC_INC,
		output logic [1:0] PC_MUX_SEL,
		output logic ALU_OPY_SEL,
		output logic [3:0] ALU_SEL,
		output logic RF_WR,
		output logic [1:0] RF_WR_SEL,
        	output logic FLG_C_SET,
        	output logic FLG_C_CLR,
        	output logic FLG_C_LD,
        	output logic FLG_Z_LD,
		output logic RST,
		output logic IO_STRB
);


	typedef enum {ST_INIT, ST_FETCH, ST_EXEC} STATE; //creating a new data set
	
	STATE NS, PS = ST_INIT; //initalizing states

	//modeling state register
	always_ff @ (posedge CLK)
	begin 
		if(RESET == 1)
		begin
			PS <= ST_INIT;
		end
		else
			PS <= NS;

	end
		
	//OUTPUT and NS DECODER
	always_comb
	begin
	//initalize all outputs to zero	
		 PC_LD=0;
		 PC_INC=0;
		 PC_MUX_SEL=0;
		 ALU_OPY_SEL=0;
		 ALU_SEL =0;
		 RF_WR=0;
		 RF_WR_SEL=0;
        	 FLG_C_SET=0;
        	 FLG_C_CLR=0;
        	 FLG_C_LD=0;
        	 FLG_Z_LD=0;
		 RST=0;
		 IO_STRB=0;

		case(PS)
			ST_INIT: //if PS = ST_INIT
			begin
				RST = 1;
				NS = ST_FETCH;
			end

			ST_FETCH: // if PS = ST_FETCH
			begin
				PC_INC = 1;
				NS = ST_EXEC;
			end

			ST_EXEC: //if PS = ST_EXEC
			begin
				case(OPCODE_HI_5) //just looking at the highest bits
					5'b110_01: //IN 
					begin
						RF_WR_SEL = 3; //write what ever is in IN_PORT to REG file
						RF_WR = 1; //write
					end
					5'b000_10: //MOV
					begin
					ALU_SEL = 14;	
						case (OPCODE_LOW_2)
						2'b01: //REG to REG
						begin
							ALU_OPY_SEL = 0; //get reg value
						end

						default:	//REG - imediate form
						begin	
							ALU_OPY_SEL = 1; //get immediate value
						end
						endcase
					end
					5'b000_00: //EXOR
					begin	
					ALU_SEL = 7;
					RF_WR = 1;
					RF_WR_SEL = 0;
						case (OPCODE_LOW_2)
						2'b01: //REG to REG
						begin
							ALU_OPY_SEL = 0; //get reg value
						end

						default:	//REG - imediate form
						begin	
							ALU_OPY_SEL = 1; //get immediate value
						end
						endcase	
					end
					5'b110_10: //OUT
					begin
						RF_WR = 0; //read value from reg 
					end		
					5'b001_00: //BRN
					begin
					PC_LD = 1; //load PC with immediate value 
					PC_MUX_SEL = 0; //select immediate value to be loaded 
					end

					default:
						RST = 1; //nvr should get herej
				endcase //end of OPCOD_HI_5 case statment
				NS=ST_FETCH;
			end
			default: 
				NS = ST_INIT; //nvr get here
		
	endcase //end case of PS
		end
endmodule 
					
