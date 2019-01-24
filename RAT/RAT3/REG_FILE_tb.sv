module REG_FILE_tb;

	logic [7:0] DIN;
	logic [4:0] ADRX;
	logic [4:0] ADRY;
	logic RF_WR;
	logic CLK;
	logic [7:0] DX_OUT;
	logic [7:0] DY_OUT;
		

REG_FILE UUT(.*);


initial begin
  CLK = 1;
  forever #5 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

initial begin

//test 1 - check if the aysnc read work - should read zero for ADRX, ADRY
#5 //CLK = 0

	ADRY = 255; //arbitrary
	ADRX = 100; //arbitary
	RF_WR = 0; // aysnc read

///////////DX_OUT and DY_OUT should equal zero //////////////////////////

#5 

// CLK=1

//test 2 - check if the synch write works
#10	//CLK = 1

	ADRX = 3;
	ADRX = 5;
	DIN = 255;
	RF_WR = 1; // test write control signal
	
#5 //CLK = 0

//check if ADRX was written to
	
	RF_WR = 0;

///////////DX_OUT shoudl equal 255 and DY_OUT should equal zero //////////////////////////

//test 3 - write to all the memory address

#5 //CLK = 1


	for(int i = 0; i<256; i++) begin
		DIN = i;
		RF_WR = 1;
		ADRX = i;

	end


//print out written values	
#5  //CLK = 0
    
for(int i = 0; i<256; i++) begin
		ADRX = i;
		ADRY = i;
		RF_WR = 0;
	end


end




endmodule
