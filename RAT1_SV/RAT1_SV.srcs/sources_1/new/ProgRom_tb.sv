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

 logic CLK;
 logic [9:0] ADDR;
 logic [17:0] IR;
 
  ProgRom UUT (
      .PROG_CLK(CLK),
      .PROG_ADDR(ADDR),
      .PROG_IR(IR)
 
 );
 
 initial begin
 CLK = 0; 
 ADDR = 0;
 IR = 0; 
 #10;
 sD = 1;
 #10;
 sC = 1; sD = 0;
 #10;
 sA = 1; sB = 1;
 sC = 1; sD = 1;
 end
 
endmodule