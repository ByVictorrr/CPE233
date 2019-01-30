module ALU_tb();

	logic[3:0] SEL;
	logic[7:0] A;
	logic[7:0] B;
	logic CIN;
	logic [7:0] RESULT;
	logic C;
	logic Z;


	ALU UUT(
		.SEL(SEL),
		.A(A),
		.B(B),
		.CIN(CIN),
		.RESULT(RESULT),
		.C(C),
		.Z(Z)
	);

	initial 
	begin
	//Initalize test vectors
		SEL = 0;
		A = 0;
		B = 0;
		CIN = 0;
		RESULT = 0;
		C = 0;
		Z = 0;
	#10 //delay for 10ns after initalizing test vectors
	
	//Test 1:  ALL SEL values for A = 0x09
		A = 9;
		B = 10;
		CIN = 0;

		for(int i =0; i < 16 ; i++)
		begin
			SEL = i; //0(ADD),....15(NOTHING)
			#10; //after
		end

	//Test 2:  ALL SEL values for A = 0x09
		A = 0'h9A;
		B = 0'h02;
		CIN = 1;

		for(int i =0; i < 16 ; i++)
		begin
			SEL = i; //0(ADD),....15(NOTHING)
			#10; //after
		end


	end


endmodule

