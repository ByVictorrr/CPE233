`include "./FLAGS.sv"
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/11/2019 00:11
// Design Name: 
// Module Name: FLAGS_tb
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


module FLAGS_tb();


	logic CLK;
	logic FLG_C_SET;
	logic FLG_C_LD;
	logic C;
	logic FLG_C_CLR;
	logic FLG_Z_LD;
	logic Z;
	logic C_FLAG;
	logic Z_FLAG;

	FLAGS UUT(.*);
//============PRECEDENCY================
//		1.)CLR
// 		2.)LD
// 		3.)SET

initial begin
  CLK = 1;
  forever #5 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

	initial begin
	//initalize all inputs make sure this thing works
	FLG_C_SET = 0;
	FLG_C_LD = 0;
	C = 0;
	FLG_C_CLR = 0;
	FLG_Z_LD = 0;
	Z = 0;
#10 // TEST # 1 - TEST C_SET = 1
	//For C ff
	FLG_C_SET = 1;
	FLG_C_LD = 0;
	C = 1;
	FLG_C_CLR = 0;
	//For Z ff 
	FLG_Z_LD = 1;
	Z = 1;



#10 //TEST # 2 - TEST TEST LD
	//For C ff
	FLG_C_SET = 0;
	FLG_C_LD = 1;
	C = 1;
	FLG_C_CLR = 0;
	//For Z ff 
	FLG_Z_LD = 1;
	Z = 1;

#10 //TEST # 3 - TEST TEST CLR
	//For C ff
	FLG_C_SET = 1;
	FLG_C_LD = 1;
	C = 1;
	FLG_C_CLR = 1;
	//For Z ff 
	FLG_Z_LD = 1;
	Z = 1;
 end
endmodule

