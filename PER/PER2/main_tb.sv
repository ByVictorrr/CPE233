module main_tb;

	logic [7:0] SW;	
	logic CLK;
	logic oCLK;

main UUT(.*);


initial begin
  CLK = 1;
  forever #1 CLK = ~CLK; //every 5ns clock changes period of 10ns
  end 

initial begin
//test 1 - check if each reg stores a zero
//==============================================
//CLK = 0
	SW = 10;
	
#200;

//=================================================    
end

endmodule
