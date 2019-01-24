module REG_FILE(
	input [7:0] DIN,
	input [4:0] ADRX,
	input [4:0] ADRY,
	input RF_WR,
	input CLK,
	output [7:0] DX_OUT,
	output [7:0] DY_OUT,
		);
//only x to write to 

logic [7:0] memory [0:255];

initial //runs one
begin
	for(int i = 0; i < 256; i++)
	begin
	memory[i] =0; //initalize all to zero
	end
end

always_ff @ (posedge CLK)
begin
	if(RF_WR==1) //write to Address given
	begin
		memory[ADRX]=DIN;
	end
end

//else if not RF_WR == 1 read file asynchronously
	assign DX_OUT[ADRX] = memory[ADRX];
	assign DY_OUT[ADRY] = memory[ADRY];

endmodule

