module SW_DCDR_SCLK(input [7:0] SW, output real[15:0] maxcount); //real means 64-bit floating number


 always @(x)

    begin
    //cases for x

        case(SW)
            //if no inputs
	8'b00000000:
		maxcount = 
	8'b00000001:
		maxcount = 'hBAA2;
	8'b00000010:
		maxcount = 'hB029;
	8'b00000011:
		maxcount = 'hA646;
	8'b00000100: 
		maxcount = 'h9CF1;
	8'b00000101:
		maxcount = 'h9422;
	8'b00000110:
		maxcount = 'h8BD1;
	8'b00000111:
		maxcount = 'h83F8;
	8'b00001000:
		maxcount = 'h7C90;
	8'b00001001:
		maxcount = 'h7592;
	8'b00001010:
		maxcount = 'h6EF9;
	8'b00001011:
		maxcount = 'h68BF;
	8'b00001100:
		maxcount = 'h62DE;
	8'b00001101:
		maxcount = 'h5D51;
	8'b00001110:
		maxcount = 'h5814;
	8'b00001111:
		maxcount = 'h5323;
	8'b00010000:
		maxcount = 'h4E78;
	8'b00010001:
		maxcount = 'h4A11;
	8'b00010010:
		maxcount = 'h45E9;
	8'b00010011:
		maxcount = 'h41FC;
	8'b00010100:
		maxcount = 'h3E48;
	8'b00010101:
		maxcount = 'h3AC9;
	8'b00010110:
		maxcount = 'h377D;
	8'b00010111:
		maxcount = 'h345F;
	8'b00011000:
		maxcount = 'h316F;
	8'b00011001:
		maxcount = 'h2EA9;
	8'b00011010:
		maxcount = 'h2C0A;
	8'b00011011:
		maxcount = 'h2991;
	8'b00011100:
		maxcount = 'h273C;
	8'b00011101:
		maxcount = 'h2508;
	8'b00011110:
		maxcount = 'h22F4;
	8'b00011111:
		maxcount = 'h20FE;
	8'b00100000:
		maxcount = 'h1F24;
	8'b00100001:
		maxcount = 'h1D65;
	8'b00100010:
		maxcount = 'h1BBE;
	8'b00100011:
		maxcount = 'h1A30;
	8'b00100100:
		maxcount = 'h18B7;  
	
	default maxcount = 'h0000;	
	   endcase
     end

endmodule
