module main_tb;

	logic [7:0] SW;	
	logic CLK;
	logic oCLK;

main UUT(.*);


initial begin
  CLK = 1;
  forever #5 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

initial begin
//test 1 - check if each reg stores a zero
//==============================================
//CLK = 0
	SW = 1;

//test 2 - check if
//==============================================
#10	//CLK = 1

	for(int i = 1; i< 256; i++)
	begin
		SW = i;
		#10;
	end
	


//=================================================    
end

endmodule
