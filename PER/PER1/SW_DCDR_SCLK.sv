module SW_DCDR_SCLK(input [7:0] SW, output real[15:0] maxcount); //real means 64-bit floating number


 always @(x)

    begin
    //cases for x

        case(SW)
            //if no inputs
	8'b00000000:
		maxcount = 
	8'b00000001:
		maxcount =
	8'b00000010:
		maxcount =
	8'b00000011:
		maxcount = 
	8'b00000100:
		maxcount =
	8'b00000101:
		maxcount =
	8'b00000110:
	8'b00000111:
	8'b00001000:
	8'b00001001:
	8'b00001010:
	8'b00001011:
	8'b00001100:
	8'b00001101:
	8'b00001110:
	8'b00001111:
	8'b00010000:
	8'b00010001:
	8'b00010010:
	8'b00010011:
	8'b00010100:
	8'b00010101:
	8'b00010110:
	8'b00010111:
	8'b00011000:
	8'b00011001:
	8'b00011010:
	8'b00011011:
	8'b00011100:
	8'b00011101:
	8'b00011110:
	8'b00011111:
	8'b00100000:
	8'b00100001:
	8'b00100010:
	8'b00100011:
	8'b00100100:
	    
	    endcase
     end

endmodule
