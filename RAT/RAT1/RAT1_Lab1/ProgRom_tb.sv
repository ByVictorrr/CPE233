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
  
 initial 
 begin
 CLK = 0; 
 ADDR = 'h000;
 IR = 'h00000;
 #10;
 
 CLK = 1;   
 ADDR = 'h000;
 #10;
 
 
 end
 
endmodule