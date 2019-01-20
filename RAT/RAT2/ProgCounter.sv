`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   VANC
// Engineer:  Victor Delaplaine and Crystal PrimaLang
// 
// Create Date: 01/18/2019 02:46:31 PM
// Design Name: 
// Module Name: ProgCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic n-bit up Program counter with synchronous reset. 
//  
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (01-08-2019)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ProgCounter (DIN,PC_LD,PC_INC,RST,CLK,PC_COUNT);
    
    //- default data-width 
    parameter n = 8; 
    
    input  CLK, RST, PC_INC, PC_LD; 
    input  [n-1:0] DIN; 
    output  reg [n-1:0] PC_COUNT; 

    
    
    always @(posedge CLK)
    begin 
        if (RST == 1)       // sync reset
           PC_COUNT <= 0;
        else if (PC_LD == 1)   // load new value
           PC_COUNT <= DIN; 
        else if (PC_INC == 1)   // count up (increment)
           PC_COUNT <= PC_COUNT + 1; 
    end 
       

endmodule
