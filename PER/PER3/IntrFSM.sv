/*
 * IntrFSM
 * Copyright (C) 2019 victor <victor@TheShell>
 *
 * Distributed under terms of the MIT license.
 */

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Victor Delaplaine
// 
// Create Date: 02/21/2019 10:11
// Design Name: 
// Module Name: IntrFSM
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: 
// 		
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (02-21-2019) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IntrFSM(
	input PRESS,
	input CLK,
	output logic INTR
);

	typedef enum{

	ST_START,
	ST_T1,
	ST_T2,
	ST_T3,
	ST_T4,
	ST_T5,
	ST_T6,
	ST_DONE

	} STATE;



	STATE NS, PS = ST_START; //initalizing
	

    //- model the state registers
    always_ff @ (posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output logic decoders
    always_comb 
    begin
	INTR = 0;

       case(PS)

          ST_START:
          begin
		INTR=0;
		if(PRESS == 1)
			NS = ST_T1;
		else
			NS = PS;
	  end

          ST_T1:
          begin
		INTR=1;
		 NS = ST_T2;
	  end

	  ST_T2:
          begin
		INTR=1;
		NS = ST_T3;
	  end

	  ST_T3:
          begin
		INTR=1;
		NS = ST_T4;
	  end
	  ST_T4:
          begin
		INTR=1;
		NS = ST_T5;
	  end
	  ST_T5:
          begin
		INTR=1;
		NS = ST_T6;
	  end

	  ST_T6:
          begin
		INTR=1;
		NS = ST_DONE;
	  end

	  ST_DONE:
          begin
		INTR=0;
		if (PRESS == 0)
			NS = ST_START;
		else
			NS=PS;
	  end
	       default: NS=ST_START;
          endcase
      end              
endmodule



