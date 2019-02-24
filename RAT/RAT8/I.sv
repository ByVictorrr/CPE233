/*
 * I
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/03/2019 16:56
// Design Name: 
// Module Name: I
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-03-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module I(
	input CLK,
	input I_CLR,
	input I_SET,
	output reg I_OUT
	);

always_ff @(posedge CLK)
begin
	if (I_CLR == 1)
		I_OUT <= 0;
	else if (I_SET == 1)
		I_OUT <= 1;
	
end	
endmodule

