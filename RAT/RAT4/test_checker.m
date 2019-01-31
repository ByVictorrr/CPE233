SEL = input("input SEL operation");

    if      (SEL == 0)  D_OUT =  A + B; //ADD
  else if (SEL == 1)  D_OUT = A + B + CIN; //ADDC
  else if (SEL == 2)  D_OUT = A-1, B; //SUB
  else if (SEL == 3)  D_OUT =  A-1, B-8000_0000,CIN; //SUBC
	else if (SEL == 4)  D_OUT =  A- B; //CMP
	else if (SEL == 5)  D_OUT =  bitand(A, B); // AND
	else if (SEL == 6)  D_OUT =  A| B; // OR
	else if (SEL == 7)  D_OUT =  A^ B; // XOR
	else if (SEL == 8)  D_OUT =  A& B; // TEST
	else if (SEL == 9)  D_OUT = A[7] A[6:0] CIN; //LSL
	else if (SEL == 10)  D_OUT = A[0],CIN, A[7:1]; //LSR C = A[0] 
	else if (SEL == 11)  D_OUT = A[7],A[6:0],CIN; //ROL
	else if (SEL == 12)  D_OUT = A[0],CIN, A[7:0]; // ROR
	else if (SEL == 13)  D_OUT = A[0], CIN, CIN, A[7:2]; //ASR
	else if (SEL == 14)  D_OUT = CIN, A; //MOV
    else                D_OUT = 0; 
   
   endif

   
   
