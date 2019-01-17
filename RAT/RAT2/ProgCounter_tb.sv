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
always
    begin
       #5
       CLK = 0;
       #5 
       CLK = 1 
     end
    
     
  
 initial begin
  for (int i = 0; i< 1024; i++)
    begin
        if(PC_MUX_SEL == 3)
            begin
            end
            else
            begin
            end
            
        	logic PC_LD;
	logic PC_INC;
	logic RST;
	logic [1:0] PC_MUX_SEL;
	logic [9:0] FROM_IMMED; 
	logic [9:0] FROM_STACK;
  end 
 
   
  
  end

endmodule
