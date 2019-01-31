
module ALU(
	input [3:0] SEL,
	input [7:0] A,
	input [7:0] B,
	input CIN,
	output logic [7:0] RESULT,
	output logic C,
	output logic Z
	
);

logic [8:0] D_OUT; //for {CIN, RESULT}

//Mux 1
       always_comb
       begin 
        if      (SEL == 0)  D_OUT = {1'b0, A}+{1'b0, B}; //ADD
        else if (SEL == 1)  D_OUT = {1'b0, A}+{1'b0, B}+{8'b0000_0000,CIN}; //ADDC
        else if (SEL == 2)  D_OUT = {1'b0, A}-{1'b0, B}; //SUB
        else if (SEL == 3)  D_OUT = {1'b0, A}-{1'b0, B}-{8'b0000_0000,CIN}; //SUBC
	else if (SEL == 4)  D_OUT = {1'b0, A}-{1'b0, B}; //CMP
	else if (SEL == 5)  D_OUT = {1'b0, A}&{1'b0, B}; // AND
	else if (SEL == 6)  D_OUT = {1'b0, A}|{1'b0, B}; // OR
	else if (SEL == 7)  D_OUT = {1'b0, A}^{1'b0, B}; // XOR
	else if (SEL == 8)  D_OUT = {1'b0, A}&{1'b0, B}; // TEST
	else if (SEL == 9)  D_OUT = {A[7], A[6:0], CIN}; //LSL
	else if (SEL == 10)  D_OUT = {A[0],CIN, A[7:1]}; //LSR C = A[0] 
	else if (SEL == 11)  D_OUT = {A[7],A[6:0],CIN}; //ROL
	else if (SEL == 12)  D_OUT = {A[0],CIN, A[7:0]}; // ROR
	else if (SEL == 13)  D_OUT = {A[0], CIN, CIN, A[7:2]}; //ASR
	else if (SEL == 14)  D_OUT = {CIN, A}; //MOV
	else if (SEL == 15)  D_OUT = 0; //unused
    else                D_OUT = 0; 
	end

	
	//Mux 2
    always_comb
    begin
     C = D_OUT[8];
     RESULT = D_OUT[7:0]; // lower 7 bits
	if(D_OUT[7:0] == 8'b0000_0000) Z = 1;
	else Z=0;
	end

endmodule
