`timescale 1ns / 1ps
`include "./main.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 02:51:47 PM
// Design Name: 
// Module Name: ProgCounter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProgRom_tb();

 	logic CLK;
	logic PC_LD;
	logic PC_INC;
	logic RST;
	logic [1:0] PC_MUX_SEL;
	logic [9:0] FROM_IMMED; 
	logic [9:0] FROM_STACK;
	logic [9:0] PC_COUNT;
	
	
main UUT (
   	.CLK(CLK),
	.PC_LD(PC_LD),
	.PC_INC(PC_INC),
	.RST(RST),
	.PC_MUX_SEL(PC_MUX_SEL),
	.FROM_IMMED(FROM_IMMED),
	.FROM_STACK(FROM_STACK),
	.PC_COUNT(PC_COUNT)
);
  
//emulate a clock pulse

    initial begin
       forever #5 CLK = ~CLK;
     end
    
     
  
 initial begin
 
 PC_LD = 0;
 CLK = 0;
 RST = 1;
 PC_MUX_SEL = 0;
 PC_INC = 0;
 FROM_IMMED = 1; //input 
 FROM_STACK = 2; //input
#10



 
 //test 1 - test increment (# 10 PC_INC =1, #10 PC_INC = 0)
 PC_INC = 1; 
 #10 
 PC_INC = 0;   
 #10 
    
    
 //test 2 - load = 1 (changing MUX_SEL)
 PC_LD = 1;
 
 
 
 PC_MUX_SEL = PC_MUX_SEL + 1; //SEL = 1
 #10
  PC_MUX_SEL = PC_MUX_SEL + 1; // SEL = 2
 #10
  PC_MUX_SEL = PC_MUX_SEL + 1; // SEL = 3
 #10
 

 
 
 //test 3 - RST = 1 (PC_LD = 1, PC_INC = 1)
    PC_LD = 1;
    PC_INC = 1;
    RST = 1;
    
    
  
  end

endmodule
