module ALU_tb();

	logic[3:0] SEL;
	logic[7:0] A;
	logic[7:0] B;
	logic CIN;
	logic [7:0] RESULT;
	logic C;
	logic Z;

//values for A
logic [7:0] X [33:0] = {

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
logic [7:0] Y [33:0] = {

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
logic W [33:0]={

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
1
};

            ALU UUT(
                .SEL(i),
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
	
//================Test cases - all in one loop================================\\
SEL = 0;


		for(int i =0; i < 34 ; i++)
		begin
		case(i)
			0: SEL =0; //ADD
			1: SEL =0; //ADD
			2: SEL=0;  //ADD/
			3: SEL =1; //ADDC
			4: SEL =1; //ADDC
			5: SEL=2; //SUB
			6: SEL =2; //SUB
			7: SEL =2; //SUB
			8: SEL=3; //SUBC
			9: SEL =3; //SUBC
			10: SEL =3; //SUBC
			11: SEL=3; //SUBC	
			12: SEL =4; //CMP
			13: SEL =4; //CMP
			14: SEL = 4; //CMP
			15: SEL =5; //AND
			16: SEL = 5; //AND
			17: SEL =6; //OR
			18: SEL = 6; //OR
			19: SEL= 7; //exor	
			20: SEL =7; //exor
			21: SEL =8; //TEST
			22: SEL =8; //TEST
			23: SEL =9; //LSL
			24: SEL =10; //LSR
			25: SEL = 10; //LSR 
			26: SEL = 11; //ROL 
			27: SEL = 11;  //ROL
			28: SEL = 12; //ROR
			29: SEL = 12; //ROR
			30: SEL = 13; //ASR
			31: SEL = 13; //ASR
			32: SEL = 14; //MOV
			33: SEL = 14; //MOV
            default: SEL =0; //ADD
		endcase


		//new vars
		  A = X[i];
		  B = Y[i];
		  CIN = W[i];
		
		#10; //after
		end
end


endmodule

