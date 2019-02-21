`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ByVictorrr
// Engineer: Victor Delaplaine
// 
// Create Date: 10/23/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_2t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantiation)
//
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 10-23-2018
//          1.01 - fixed default width error (10-28-2018)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module mux_flipped_2t1_nb(SEL, D_IN, D0, D1); 
       input  SEL;
       input [n-1:0]  D_IN;
       output reg [n-1:0] D0, D1; 
       
       parameter n = 8; 
        
       always @(SEL, D_IN)
       begin 
	  if (SEL == 0)
	  begin
		D0 = D_IN;
		D1 = 0;
	  end
          else if (SEL == 1)  
	  begin
		  D1 = D_IN;
		  D0 = 0;
	  end
          else
	  begin
		  D0=0;
		  D1=0;
	  end
       end
                
endmodule
   
