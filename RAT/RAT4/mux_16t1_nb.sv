
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


   
 module mux_16t1_nb(
	 	 input [3:0] SEL,
		 input [n-1:0] D0, 
		 input [n-1:0] D1, 
		 input [n-1:0] D2, 
		 input [n-1:0] D3,
	 	 input [n-1:0] D4,
	 	 input [n-1:0] D5,
	 	 input [n-1:0] D6,
	         input [n-1:0] D7,
	 	 input [n-1:0] D8,
	 	 input [n-1:0] D9,
	 	 input [n-1:0] D10,
	 	 input [n-1:0] D11,
	 	 input [n-1:0] D12,
	 	 input [n-1:0] D13,
	 	 input [n-1:0] D14,
	 	 input [n-1:0] D15,
	
		output reg [n-1:0] D_OUT); 
       
       parameter n = 8; 
        
       always @(SEL, D0, D1, D2, D3)
       begin 
        if      (SEL == 0)  D_OUT = D0;
        else if (SEL == 1)  D_OUT = D1; 
        else if (SEL == 2)  D_OUT = D2; 
        else if (SEL == 3)  D_OUT = D3;
	else if (SEL == 4)  D_OUT = D4;
	else if (SEL == 5)  D_OUT = D5;
	else if (SEL == 6)  D_OUT = D6;
	else if (SEL == 7)  D_OUT = D7;
	else if (SEL == 8)  D_OUT = D8;
	else if (SEL == 9)  D_OUT = D9;
	else if (SEL == 10)  D_OUT = D10;
	else if (SEL == 11)  D_OUT = D11;
	else if (SEL == 12)  D_OUT = D12;
	else if (SEL == 13)  D_OUT = D13;
	else if (SEL == 14)  D_OUT = D14;
	else if (SEL == 15)  D_OUT = D15;
        else                D_OUT = 0; 
       end
                
endmodule
   
