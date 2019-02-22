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
	   4'b0000: 
	    		seg = 8'b00000011; //output a zero
            4'b0001 :           
	                seg = 8'b10011111; 
            4'b0010 :  
	                seg = 8'b00100101;
            4'b0011 :       
	                seg = 8'b00001101;
            4'b0100 :        // Hexadecimal 4
	                seg = 8'b10011001;
            4'b0101 :        // Hexadecimal 5
	                seg = 8'b01001001;
            4'b0110 :        // Hexadecimal 6
	                seg = 8'b01000001;
            4'b0111 :        // Hexadecimal 7
	                seg = 8'b00011111;
            4'b1000 :              //Hexadecimal 8
	                seg =  8'b00000001;
            4'b1001 :           
	                seg = 8'b00001001; //Hexadeciaml 9
	    4'b1010 : //ten
			seg = 8'b00010001;
	    4'b1011 : //Hex eleven
			seg = 8'b11000001;
            4'b1100 : //hex 12
			seg = 8'b01100011;
	    4'b1101 : //hex 13
			seg =  8'b1000010;
            4'b1110 : //hex 14      
			seg = 8'b01100001;
	    4'b1111:	        
			seg = 8'b01110001;
           
      
	default: 
	                seg = 8'b11111111;
        endcase
     end
	 
	 assign an = 4'b1110;

        
endmodule
