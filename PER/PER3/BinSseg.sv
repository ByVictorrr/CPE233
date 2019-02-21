`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 09/24/2018 01:53:20 PM
// Description: 4-bit binary to seven segment hex code 
//////////////////////////////////////////////////////////////////////////////////


module BinSseg(
    input [3:0] binary,    
    output logic [6:0] seg,
	output [3:0] an
    );   
    
    //always block for converting binary into 7 segment format
    always_comb
    begin
        case (binary) //case statement
            0 : seg = 7'b1000000;
            1 : seg = 7'b1111001;
            2 : seg = 7'b0100100;
            3 : seg = 7'b0110000;
            4 : seg = 7'b0011001;
            5 : seg = 7'b0010010;
            6 : seg = 7'b0000010;
            7 : seg = 7'b1111000;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0010000;
            10: seg = 7'b0001000;
            11: seg = 7'b0000011;
            12: seg = 7'b1000110;
            13: seg = 7'b0100001;
            14: seg = 7'b0000110;
            15: seg = 7'b0001110;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seg = 7'b1111111; 
        endcase
     end
	 
	 assign an = 4'b1110;

        
endmodule
