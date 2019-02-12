`include "/home/victor/CPE233/Modules/mux_4t1_nb.v"
`include "/home/victor/CPE233/Modules/mux_2t1_nb.v"	
`include "/home/victor/CPE233/RAT5/ALU.sv"
`include "/home/victor/CPE233/RAT5/CONTROL_UNIT.sv"
`include "/home/victor/CPE233/RAT5/FLAGS.sv"
`include "/home/victor/CPE233/RAT5/ProgCounter.sv"
`include "/home/victor/CPE233/RAT5/ProgRom.sv"
`include "/home/victor/CPE233/RAT5/RAT_MCU.sv"
`include "/home/victor/CPE233/RAT5/REG_FILE.sv"
`include "/home/victor/CPE233/RAT5/SCRATCH_RAM.sv"

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine and Conrad Chan
// 
// Create Date: 02/03/2019 00:24
// Design Name: 
// Module Name: RAT_MCU
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

module RAT_MCU(
	input [7:0] IN_PORT,
	input RESET,
	input INT_CU,
	input CLK,
	output logic [7:0] OUT_PORT,
	output logic [7:0] PORT_ID,
	output logic IO_STRB
	); 


logic [17:0] PROG_IR;
logic C_FLAG, Z_FLAG;
logic PC_LD, PC_INC;
logic [1:0] PC_MUX_SEL;
logic ALU_OPY_SEL;
logic [3:0] ALU_SEL;
logic RF_WR;
logic [1:0] RF_WR_SEL;
logic FLG_C_SET;
logic FLG_C_CLR;
logic FLG_C_LD;
logic FLG_Z_LD;
logic RST;
logic C,Z;
logic [9:0] DIN_PC;
logic [9:0] PC_COUNT;
logic [7:0] DY_OUT, DX_OUT;
logic [7:0] B;
logic [7:0] DIN_RF, RESULT;
logic  FLG_LD_SEL;
logic [4:0] ADRX;
logic [4:0] ADRY;
logic [9:0] DATA_OUT;


//========INFORMATION ABOUT NON USED PORTS TIED TO 0======\\
//====Control unit======\\
	CONTROL_UNIT CU(
		.OPCODE_HI_5(PROG_IR[17:13]),
		.OPCODE_LOW_2(PROG_IR[1:0]),
		.INT_CU(INT_CU),
		.C_FLAG(C_FLAG),
		.Z_FLAG(Z_FLAG),
		.RESET(RESET),
		.CLK(CLK),		
		//.I_SET(), //unused
		//.I_CLR(), //unused
		.PC_LD(PC_LD),
		.PC_INC(PC_INC),
		.PC_MUX_SEL(PC_MUX_SEL),
		.ALU_OPY_SEL(ALU_OPY_SEL),
		.ALU_SEL(ALU_SEL),
		.RF_WR(RF_WR),
		.RF_WR_SEL(RF_WR_SEL),
		//.SP_LD(), //unused
		//.SP_INCR(), //unused
		//.SP_DECR(), //unused
		//.SCR_WE(), //unused
		//.SCR_ADDR_SEL(), //unused
		.FLG_C_SET(FLG_C_SET),
		.FLG_C_CLR(FLG_C_CLR),
		.FLG_C_LD(FLG_C_LD),
		.FLG_Z_LD(FLG_Z_LD),
		//.FLG_LD_SEL(FLG_LD_SEL),
	    //.FLG_SHAD_LD(), //unused
		.RST(RST),
		.IO_STRB(IO_STRB) //unsure
);

//================left side===============
	mux_4t1_nb #(.n(10)) PC_DIN_INPUT(
		.SEL(PC_MUX_SEL), 
      	.D0(PROG_IR[12:3]), 
		.D1(DATA_OUT), //come back to
		.D2('h3FF), 
		.D3('h000), //dont care
       	.D_OUT(DIN_PC) 
  
	);

	ProgCounter #(.n(10)) PC(
		.DIN(DIN_PC),
		.PC_LD(PC_LD),
		.PC_INC(PC_INC),
		.RST(RST),
		.CLK(CLK),
	 	.PC_COUNT(PC_COUNT)
	);

		ProgRom PROM(
		.PROG_CLK(CLK), 
		.PROG_ADDR(PC_COUNT), 
		.PROG_IR(PROG_IR)
	);
//================end of left side ==========	

//===============start of  POWR house
	FLAGS flag(
		.CLK(CLK),
		.FLG_C_SET(FLG_C_SET),
		.FLG_C_LD(FLG_C_LD),
		.C(C),
		.FLG_C_CLR(FLG_C_CLR),
		.FLG_Z_LD(FLG_Z_LD),
		.Z(Z),
		.C_FLAG(C_FLAG),
		.Z_FLAG(Z_FLAG)
	);



	mux_4t1_nb #(.n(8)) RF_DIN_INPUT(
		.SEL(RF_WR_SEL), 
      	.D0(RESULT), 
		.D1(DATA_OUT[7:0]), //unsure
		.D2(0), 
		.D3(IN_PORT),
       	.D_OUT(DIN_RF) 
  
	);
	REG_FILE RF(
		.DIN(DIN_RF),
		.ADRX(PROG_IR [12:8]),
		.ADRY(PROG_IR [7:3]),
		.RF_WR(RF_WR),
		.CLK(CLK),
		.DX_OUT(DX_OUT),
		.DY_OUT(DY_OUT)
	);

	mux_2t1_nb #(.n(8)) ALU_B_INPUT(			
		.SEL(ALU_OPY_SEL), 
      		.D0(DY_OUT), 
		.D1(PROG_IR[7:0]), 
		.D_OUT(B)
	);
	
	
	ALU alu(
		.SEL(ALU_SEL),
		.A(DX_OUT),
		.B(B),
		.CIN(C_FLAG),
		.RESULT(RESULT),
		.C(C),
		.Z(Z)
	);
	
assign PORT_ID = PROG_IR [7:0];
assign OUT_PORT = DX_OUT;
//=================end POWER house=============	

endmodule
