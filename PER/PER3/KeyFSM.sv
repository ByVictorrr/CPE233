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
	input C,
	input A,
	input E,
	output logic PRESS,
	output logic [3:0] DATA,
	output logic B,
	output logic G,
	output logic F,
	output logic D
);


     	//Moore outputs : B,G,F,D
	//Mealy output : press, and data	
     
	
	typedef enum{ST_B,ST_G,ST_F,ST_D} STATE;
	
	STATE NS, PS = ST_B; //initalizing
	

    //- model the state registers
    always @ (negedge reset_n, posedge clk)
          PS <= NS; 
    
    
    //- model the next-state and output logic decoders
    always_comb 
    begin
	 PRESS = 0;
	 DATA = 0;
	 B = 0;
	 G = 0;
	 F = 0;
	 D = 0;

       case(PS)
          ST_B:
          begin
		B = 1;
             	if (C == 1)
		begin
		DATA = 1;
		PRESS = 1;
		end

		else
		begin
			if(A==1) //if C == 0
			begin
			DATA = 2;
			PRESS = 1;
			end

			else //if C == 0 and A == 0
			begin

				if(E == 1)
				begin
				DATA = 3;
				PRESS = 1;
				end

				else
				begin
				DATA = 13; //not sure about
		  		PRESS = 0;
				end
			end
		end
	  NS = ST_G;
	  end 
	ST_G:
	begin
		G=1;
             	if (C == 1)
		begin
		DATA = 4;
		PRESS = 1;
		end

		else
		begin
			if(A==1) //if C == 0
			begin
			DATA = 5;
			PRESS = 1;
			end

			else //if C == 0 and A == 0
			begin

				if(E == 1)
				begin
				DATA = 6;
				PRESS = 1;
				end

				else
				begin
				DATA = 13;
		  		PRESS = 0;
				end
			end
		end
	  NS = ST_F;
	  end 

	ST_F:
	begin
		F=1;
             	if (C == 1)
		begin
		DATA = 7;
		PRESS = 1;
		end

		else
		begin
			if(A==1) //if C == 0
			begin
			DATA = 8;
			PRESS = 1;
			end

			else //if C == 0 and A == 0
			begin

				if(E == 1)
				begin
				DATA = 7;
				PRESS = 1;
				end

				else
				begin
				DATA = 13;
		  		PRESS = 0;
				end
			end
		end
	  NS = ST_D;
	  end 

	ST_D:
	begin
		D=1;
             	if (C == 1)
		begin
		DATA = 10;
		PRESS = 1;
		end

		else
		begin
			if(A==1) //if C == 0
			begin
			DATA = 0;
			PRESS = 1;
			end

			else //if C == 0 and A == 0
			begin

				if(E == 1)
				begin
				DATA = 11;
				PRESS = 1;
				end

				else
				begin
				DATA = 13;
		  		PRESS = 0;
				end
			end
		end
	  NS = ST_B;
	  end 
	       default: NS=ST_B;
          endcase
      end              
endmodule



