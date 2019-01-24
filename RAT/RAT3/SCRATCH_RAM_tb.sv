module SCRATCH_RAM_tb;

	logic [9:0] DATA_IN;
	logic [7:0] SCR_ADDR;
	logic SCR_WE;
	logic CLK;
	logic [9:0] DATA_OUT;
		

SCRATCH_RAM UUT(.*);


initial begin
  CLK = 1;
  forever #5 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

initial begin
//test 1 - check if each reg stores a zero
//==============================================
//CLK = 0

	SCR_ADDR = 0'h64; //arbitary
	SCR_WE = 0; // aysnc read
	SCR_WE=0;
	DATA_IN = 0;

//==============================================



//test 2 - check if the synch write works
//==============================================
#10	//CLK = 1

	SCR_ADDR = 3;
	SCR_ADDR = 5;
	DATA_IN = 0'hFF;
	SCR_WE = 1; // test write control signal
	
#5 //CLK = 0

//check if SCR_ADDR was written to
	SCR_ADDR = 3;
	SCR_WE = 0;
//=================================================


//test 3 - write to all the memory address
//===============================================
#5 //CLK = 1

	for(int i = 0; i<1023; i++) begin
		DATA_IN = i;
		SCR_WE = 1;
		SCR_ADDR = i;
		#10; //write to next spot i
	end
	
// make sure each reg[i] = i	
#5 //CLK = 0
	for(int i = 0; i<1023; i++) begin
        SCR_WE = 0;
        SCR_ADDR = i;
        #5; //read at times of 5ns
        end
//=================================================    
end

endmodule
