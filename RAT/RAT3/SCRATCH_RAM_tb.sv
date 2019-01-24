module SCTRACH_RAM_tb;

	logic [7:0] DATA_IN;
	logic [4:0] SCR_ADDR;
	logic SCR_WE;
	logic CLK;
	logic [7:0] DATA_OUT;
		

REG_FILE UUT(.*);


initial begin
  CLK = 1;
  forever #5 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

initial begin

#5 //CLK = 0

	SCR_ADDR = 100; //arbitary
	SCR_WE = 0; // aysnc read


#5 

// CLK=1

//test 2 - check if the synch write works
#10	//CLK = 1

	SCR_ADDR = 3;
	SCR_ADDR = 5;
	DATA_IN = 255;
	SCR_WE = 1; // test write control signal
	
#5 //CLK = 0

//check if SCR_ADDR was written to
	
	SCR_WE = 0;


//test 3 - write to all the memory address

#5 //CLK = 1


	for(int i = 0; i<256; i++) begin
		DATA_IN = i;
		SCR_WE = 1;
		SCR_ADDR = i;

	end



end




endmodule
