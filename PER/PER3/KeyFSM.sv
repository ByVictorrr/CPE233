/*
 * KeyFSM
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/19/2019 21:18
// Design Name: 
// Module Name: KeyFSM
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-19-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KeyFSM(
	input CLK,
	input B,
	input G,
	input F,
	input D,
	output logic C,
	output logic A,
	output logic E,
	output logic PRESS,
	output logic [3:0] DATA
);


     	//Moore outputs : B,G,F,D
	//Mealy output : press, and data	
     
	
	typedef enum{ST_C,ST_A,ST_E} STATE;
	
	STATE NS, PS = ST_C; //initalizing
	

    //- model the state registers
    always @ (posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output logic decoders
    always_comb 
    begin
	 PRESS = 0;
	 DATA = 0;
	 C=0;
	 A=0;
	 E=0;
     	  case(PS)

          ST_C:
          begin
	  C=1;	
             	if (B == 1)
		begin
		DATA = 1;
		PRESS = 1;
		end

		else if (G==1)
		begin
		DATA = 4;
		PRESS = 1;
		end

		else if(F == 1)			
		begin
		DATA = 7;
		PRESS = 1;
		end
		
		else if(D == 1)			
		begin
		DATA = 10;
		PRESS = 1;
		end
			
		else
		begin
		DATA = 13; //not sure about
		PRESS = 0;
		end

	  NS = ST_A;
	  end 
		  
	ST_A:
        begin
	A=1;	
             	if (B == 1)
		begin
		DATA = 2;
		PRESS = 1;
		end

		else if (G==1)
		begin
		DATA = 5;
		PRESS = 1;
		end

		else if(F == 1)			
		begin
		DATA = 8;
		PRESS = 1;
		end
		
		else if(D == 1)			
		begin
		DATA = 0;
		PRESS = 1;
		end
			
		else
		begin
		DATA = 13; //not sure about
		PRESS = 0;
		end

	  NS = ST_E;
	  end 

	ST_E:
        begin
	E=1;	
             	if (B == 1)
		begin
		DATA = 3;
		PRESS = 1;
		end

		else if (G==1)
		begin
		DATA = 6;
		PRESS = 1;
		end

		else if(F == 1)			
		begin
		DATA = 9;
		PRESS = 1;
		end
		
		else if(D == 1)			
		begin
		DATA = 11;
		PRESS = 1;
		end
			
		else
		begin
		DATA = 13; //not sure about
		PRESS = 0;
		end

	  NS = ST_C;
	  end 


	  default: NS=ST_C;
          endcase
      end              
endmodule



