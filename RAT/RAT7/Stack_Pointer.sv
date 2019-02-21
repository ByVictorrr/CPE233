/*                                                                         
 * Stack_Pointer                                                                  
 * Copyright (C) 2019 vdelaplainess <vdelaplainess@arch>                                    
 *                                                                         
 * Distributed under terms of the MIT license.                       
 */                                                                        
                                                                           
//////////////////////////////////////////////////////////////////////////////////                                                                    
// Engineer: Victor Delaplaine                                             
//                                                                         
// Create Date: 02/20/2019 18:25                                
// Design Name:                                                            
// Module Name: Stack_Pointer                                                     
// Project Name:                                                           
// Target Devices: Basy3                                                   
// Tool Versions:                                                          
// Description:                                                            
//                                                                         
// Dependencies:                                                           
//                                                                         
// Revision:                                                               
// Revision 1.00 - File Created (02-20-2019)                     
// Additional Comments:                                                    
//                                                                         
//////////////////////////////////////////////////////////////////////////////////                                                                    
                                                                           
                                                                           
module Stack_Pointer(
		input [7:0] D_IN,
		input RST,
		input LD,
		input INCR,
		input DECR,
		input CLK,
		output [7:0] D_D_OUT,
);                                                     
                                                                           
always_ff @(CLK)
begin	
	if(RST == 1)
		D_OUT <=0;
	else if(LD == 1)
		D_OUT <= D_IN;
	else if(INCR == 1)
		D_OUT <= D_OUT+1;
	else if(DECR == 1)
		D_OUT <= D_OUT-1;
end
endmodule                                                                 
                
