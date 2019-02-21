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
//	10.)output FLG_SHAD_LD
//	output FLG_LD_SEL

module CONTROL_UNIT(
		input [4:0] OPCODE_HI_5,
		input [1:0] OPCODE_LOW_2,
		input INTR,
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
		output logic IO_STRB,
		output logic SP_LD,
		output logic SP_INCR,
		output logic SP_DECR,
		output logic SCR_WE,
		output logic [1:0] SCR_ADDR_SEL,
		output logic SCR_DATA_SEL
	
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
		 SP_LD=0;
		 SP_INCR=0;
		 SP_DECR=0;
		 SCR_WE=0;
		 SCR_ADDR_SEL=0;
		 SCR_DATA_SEL=0;
	

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
					
					5'b000_00: //BOOLEAN Operations (REG - REG )_
					begin	
					FLG_C_CLR = 1;
                    			FLG_Z_LD = 1;
                    
					case (OPCODE_LOW_2)	

						2'b00: //AND 
						begin
						RF_WR = 1;
						ALU_SEL = 5;
						end
						
						2'b01: //OR
						begin
						RF_WR = 1;							
						ALU_SEL = 6;
						end
						
						2'b10: //EXOR
						begin
						RF_WR = 1;	
						ALU_SEL = 7; 
						end
						
						2'b11: //TEST
						begin
						ALU_SEL = 8;
						end

						default:  ALU_SEL = 00; //dont know
						endcase	
						
					end

					5'b000_01: //Arithmetic Operations (REG - REG)
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
                    			RF_WR = 1;
					case (OPCODE_LOW_2)	

						2'b00: //ADD
						begin
						ALU_SEL = 0;
						end
						
						2'b01: //ADDC
						begin
						ALU_SEL = 1;
						end
						
						2'b10: //SUB
						begin
						ALU_SEL = 2; 
						end
						
						2'b11: //SUBC
						begin
						ALU_SEL = 3;
						end

						default:  ALU_SEL = 00; //dont know
						endcase	
	
					end

					5'b000_10: //CMP, and Moving Operations (REG - REG)
					begin
					case (OPCODE_LOW_2)
					
						2'b00: //CMP
						begin
						ALU_SEL = 4;
						FLG_C_LD = 1;
						FLG_Z_LD = 1;
						end
						
						2'b01: //MOV
						begin
						ALU_SEL = 14;
						RF_WR = 1;
						end
						
						2'b10: //LD
						begin
						RF_WR = 1;
						RF_WR_SEL = 1;
						end
						
						2'b11: //ST
						begin
					        SCR_WE = 1;	
                       				end 
                        
						default:  ALU_SEL = 00; //dont know
						endcase	
	
					end


/////////////////////////////////////////////////////////imediate//////////////////////////////////////////////////////////
					5'b100_00: //AND (REG - immediate )
					begin
					FLG_C_CLR = 1;
					FLG_Z_LD = 1;
					ALU_OPY_SEL = 1;
					RF_WR = 1;
					ALU_SEL = 5;
					end
						
					5'b100_01: //OR
					begin
					FLG_C_CLR = 1;
					FLG_Z_LD = 1;
					ALU_OPY_SEL = 1;
					RF_WR = 1;							
					ALU_SEL = 6;
					end
						
					5'b100_10: //EXOR
					begin
					FLG_C_CLR = 1;
					FLG_Z_LD = 1;
					ALU_OPY_SEL = 1;
					RF_WR = 1;	
					ALU_SEL = 7; 
					end
						
					5'b100_11: //TEST
					begin
					FLG_C_CLR = 1;
					FLG_Z_LD = 1;
					ALU_OPY_SEL = 1;	
					ALU_SEL = 8;
					end

								
					
					5'b101_00: //ADD
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					RF_WR = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 0;
					end
					
					5'b101_01: //ADDC
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					RF_WR = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 1;
					end
					
					5'b101_10: //SUB
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					RF_WR = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 2; 
					end
					
					5'b101_11: //SUBC
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					RF_WR = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 3;
					end
					
					5'b110_00: //CMP
					begin
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 4;
					end

					5'b110_01: //IN 
					begin
					RF_WR_SEL = 3; //write what ever is in IN_PORT to REG file
					RF_WR = 1; //write
					end
				
					5'b110_10: //OUT
					begin 
					IO_STRB = 1;
					end		
				
					5'b110_11: //MOV
					begin	
					RF_WR = 1;
					ALU_OPY_SEL = 1;
					ALU_SEL = 14;
					end
					
					5'b111_00: //LD
					begin	
					RF_WR = 1;
					RF_WR_SEL = 1;
					SCR_ADDR_SEL = 1;
					end
					
					
					5'b111_01: //ST
					begin	
					SCR_WE = 1;
					SCR_ADDR_SEL = 1;
					end
				
						

					5'b001_00: //BRANCH type operations
					begin	
					case(OPCODE_LOW_2)
						
						2'b00: //BRN
						begin
						PC_LD = 1;	
						end
						
						2'b01: //CALL (like a BRN and PUSH)
						begin
						PC_LD = 1;
						SCR_ADDR_SEL = 3;
						SCR_DATA_SEL = 1;
						SP_DECR = 1;
						end
						
						2'b10: //BREQ
						begin
							if(Z_FLAG == 1)
							begin	
							PC_LD = 1;
							end
							else PC_LD = 0;

						end
						
						2'b11: //BRNE
						begin
							if(Z_FLAG == 0)
						       begin	
							PC_LD = 1;
							end
							else PC_LD = 0;
	
						end

						default: ; //dont know
						endcase	
	
					end

					5'b001_01: //BRANCH type operations (CONTINUATION)
					begin	
					case(OPCODE_LOW_2)
					
						2'b00: //BRCS
						begin
							if(C_FLAG == 1)
						       	begin	
							PC_LD = 1;
							end
							else PC_LD = 0;
						end
						
						2'b01: //BRCC
						begin
						//insert 
							if(C_FLAG == 0)
						       	begin	
							PC_LD = 1;
							end
							else PC_LD = 0;
						end
						
						default: ; //dont know
						endcase	
	
					end
					

					5'b010_00: //Shift operations
					begin	
					RF_WR = 1;
					FLG_C_LD = 1;
					FLG_Z_LD = 1;
					case(OPCODE_LOW_2)
					
						2'b00: //LSL
						begin
						ALU_SEL = 9;
						end
						
						2'b01: //LSR
						begin
						ALU_SEL = 10;
						end
						
						2'b10: //ROL
						begin
						ALU_SEL = 11;
						end
						
						2'b11: //ROR
						begin
						ALU_SEL = 12;
						end

						default: ; //dont know
						endcase	
	
					end

					5'b010_01: //Shift operations (Continued) and PUSH and POP
					begin	
					case(OPCODE_LOW_2)
					
						2'b00: //ASR
						begin
						RF_WR = 1;
						FLG_C_LD = 1;
						FLG_Z_LD = 1;
						ALU_SEL = 13;
						end
						
						2'b01: //PUSH
						begin
						SCR_WE = 1;
						SCR_ADDR_SEL = 3;
						SP_DECR = 1;
						end
						
						2'b10: //POP
						begin
						RF_WR = 1;
						RF_WR_SEL = 1;
						SCR_ADDR_SEL = 2;
						SP_INCR =1;
						end
						
						default: ; //dont know
						endcase	
	
					end

					5'b010_10: //WSP and RSP
					begin	
					case(OPCODE_LOW_2)
					
						2'b00: //WSP
						begin
						SP_LD = 1;
						end
						
						2'b01: //RSP
						begin
						//insert here
						end
						
						default: ; //dont know
						endcase	
	
					end


					5'b011_00: // Manipulating Carry flag
					begin	
					case(OPCODE_LOW_2)
					
						2'b00: //CLC
						begin
						FLG_C_CLR = 1;
						end
						
						2'b01: //SEC
						begin
						FLG_C_SET = 1;
						end
						
						2'b10: //RET
						begin	
						PC_LD = 1;
						PC_MUX_SEL = 1;
						SP_INCR = 1;
						end	
						default: ; //dont know
						endcase	
	
					end

					5'b011_01: // SEI,CLI,RETID,RETIE
					begin	
					case(OPCODE_LOW_2)
					
						2'b00: //SEI
						begin
						//inser here	
						end
						
						2'b01: //CLI
						begin
						//insert here
						end
						
						2'b10: //RETID
						begin	
						//inser herej
						end	
						2'b11:
						begin	
						//insert here
						end
						default: ; //dont know
						endcase	
	
					end
					
				default: RST = 1; //nvr should get herej
				endcase //end of OPCOD_HI_5 case statment
				NS=ST_FETCH;
				end
				default: 
				NS = ST_INIT; //nvr get here
		
		endcase //end case of PS
		end
endmodule 
	
