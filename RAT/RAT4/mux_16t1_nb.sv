
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   VANC
// Engineer:  Victor Delaplaine and Crystal PrimaLang
// 
// Create Date: 01/18/2019 02:46:31 PM
// Design Name: 
// Module Name: mux_4t_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A generic n-bit 4 to 1 mux. 
//  
//
// Dependencies:  n/a
// 
// Revision:
// Revision 1.00 - File Created (01-18-2019)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


   
 module mux_4t1_nb(
	 	input [3:0] SEL ,
		input [n-1:0] D0, 
		input [n-1:0] D1 , 
		input [n-1:0] D2 , 
		input [n-1:0] D3 , 
		output reg [n-1:0] D_OUT); 
       
       parameter n = 8; 
        
       always @(SEL, D0, D1, D2, D3)
       begin 
          if      (SEL == 0)  D_OUT = D0;
          else if (SEL == 1)  D_OUT = D1; 
          else if (SEL == 2)  D_OUT = D2; 
          else if (SEL == 3)  D_OUT = D3; 
          else                D_OUT = 0; 
       end
                
endmodule
   
