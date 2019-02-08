`include "./RAT_MCU.sv"
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/07/2019 20:38
// Design Name: 
// Module Name: RAT_MCU_tb
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-07-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAT_MCU_tb();

	
	logic [7:0] IN_PORT;
	logic RESET;
	logic INT_CU;
	logic CLK;
	logic [7:0] OUT_PORT;
	//logic [7:0] PORT_ID;
	logic IO_STRB;



	RAT_MCU UUT(

	.IN_PORT(IN_PORT),
	.RESET(RESET),
	.INT_CU(INT_CU),
	.CLK(CLK),
	.OUT_PORT(OUT_PORT),
	.PORT_ID(PORT_ID),
	.IO_STRB(IO_STRB)
	);

initial begin
	CLK = 1;
	forever #5 CLK = ~CLK; //every 5ns so T=10ns	
	end
initial begin 
	
	//INITALIZE
	INT_CU = 0;
	RESET = 0;
	IN_PORT = 0;	
	//DONE
	
	#10 IN_PORT='h20; 
	#10 RESET = 1;
end

	
endmodule

