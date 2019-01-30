`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 02:51:47 PM
// Design Name: 
// Module Name: ProgRom_tb
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

 logic PROG_CLK;
 logic [9:0] PROG_ADDR;
 logic [17:0] PROG_IR;
 
  ProgRom UUT (
      .PROG_CLK(PROG_CLK),
      .PROG_ADDR(PROG_ADDR),
      .PROG_IR(PROG_IR)
      );
  
 initial begin
  PROG_CLK = 1;
  forever #5 PROG_CLK = ~PROG_CLK; //every 5ns clock changes period of 10ns
  end 
  
  initial begin
  // Initialize Inputs
  PROG_ADDR = 'h040;
  // Wait 100 ns for global reset to finish
   #10;
   PROG_ADDR = 'h041;
   #10
   PROG_ADDR = 'h042;
   #10
   PROG_ADDR = 'h043;
   #10
   PROG_ADDR = 'h044;
   #10
   PROG_ADDR = 'h045;
   #10
   PROG_ADDR = 'h046;
   #10
   PROG_ADDR = 'h047;
   
  
  end

endmodule