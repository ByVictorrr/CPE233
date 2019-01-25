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
//test 1 - check if each reg stores a zero
//==============================================
//CLK = 1
    DIN=0;
    RF_WR=0;
	ADRX = 2; //arbitary
	ADRY = 10; // aysnc read

//==============================================



//test 2 - check if the synch write works
//==============================================
#10	//CLK = 1

	ADRX = 0'hFF;
	DIN = 0'hFF;
	RF_WR = 1; // test write control signal
	
#5 //CLK = 0

//check if SCR_ADDR was written to
	ADRX = 0'hFF;
	ADRY = 0'hFF;
	RF_WR = 0;
//=================================================


//test 3 - write to all the memory address
//===============================================
#5 //CLK = 1

	for(int i = 0; i<32; i++) begin
		DIN = i;
		RF_WR = 1;
		ADRX = i;
		#10; //write to next spot i
	end
	
// make sure each reg[i] = i	
#5 //CLK = 0
	for(int i = 0; i<32; i++) begin
        RF_WR = 0;
        ADRX = i;
        ADRY = 32-i;
        #5; //read at times of 5ns
        end
//=================================================    

end







endmodule
