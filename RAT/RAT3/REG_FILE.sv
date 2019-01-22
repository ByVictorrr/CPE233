module REG_FILE(
	input [7:0] DIN,
	input [4:0] ADRX,
	input [4:0] ADRY,
	input RF_WR,
	input CLK,
	output [7:0] DX_OUT,
	output [7:0] DY_OUT,
		);



if(RF_WR == 0) //asynch read
begin
	DX_OUT = DIN;
	DY_OUT = DIN;
end
always(CLK)

endmodule
