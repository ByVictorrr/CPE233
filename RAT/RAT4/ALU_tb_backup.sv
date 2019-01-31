module ALU_tb();

	logic[3:0] SEL;
	logic[7:0] A;
	logic[7:0] B;
	logic CIN;
	logic [7:0] RESULT;
	logic C;
	logic Z;

//values for A
logic [7:0] X [31:0] = {
'hAA,
'h0A,
'hFF,
'hC8,
'hC8,
'hC8,
'hC8,
'h64,
'hC8,
'hC8,
'h64,
'h64,
'hAA,
'hFF,
'hAA,
'h03,
'hAA,
'h03,
'hAA,
'h03,
'hAA,
'h55,
'h01,
'h80,
'h80,
'h01,
'hAA,
'h80,
'h80,
'h80,
'h40,
'h00,
'h43
};

//Array for B values
logic [7:0] Y [31:0] = {
'hAA,
'hA0,
'h01,
'h36,
'h64,
'h64,
'h64,
'hC8,
'h64,
'h64,
'hC8,
'hC8,
'hFF,
'hAA,
'hAA,
'hAA,
'hAA,
'hAA,
'hAA,
'hAA,
'hAA,
'hAA,
'h12,
'h33,
'h43,
'hAB,
'hF2,
'h3C,
'h98,
'h81,
'hB2,
'h30,
'h00
};
//For Cin
logic W [31:0]={
0,
1,
0,
1,
1,
0,
1,
0,
0,
1,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
1,
0,
0,
1,
0,
0,
0,
1};



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
		//RESULT = 0;
		//C = 0;
		//Z = 0;
	#10 //delay for 10ns after initalizing test vectors
	
//================Test 1: ADD================================\\
SEL = 0;

		for(int i =0; i <  ; i++)
		begin
			; //0(ADD),....15(NOTHING)
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

