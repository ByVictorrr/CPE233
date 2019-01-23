module SCRATCH_RAM(
	input [9:0] DATA_IN,
	input [7:0] SCR_ADDR,
	input  SCR_WE,
	input CLK,
	output [9:0] DATA_OUT
		);
//only x to write to 

logic [9:0] memory [0:255];

initial //runs one
begin
	for(int i = 0; i < 256; i++)
	begin
	memory[i] =0; //initalize all to zero
	end
end


always_ff @ (posedge CLK)
begin

	if(SCR_WE == 1)
		begin
		memory[SCR_ADDR] = DIN;
		end
end

assign DATA_OUT[SCR_ADDR] = memory[SCR_ADDR];

endmodule
