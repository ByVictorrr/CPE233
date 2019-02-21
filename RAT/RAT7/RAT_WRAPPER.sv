`include "./RAT_MCU.sv"
`include "./SevSegDisp.sv"
`include "/home/victor/CPE233/Modules/mux_2t1_nb.v"

//////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Paul Hummel
// Edited by: Victor Delaplaine
// Create Date: 06/28/2018 05:21:01 AM
// Module Name: RAT_WRAPPER
// Target Devices: RAT MCU on Basys3
// Description: Basic RAT_WRAPPER
//
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////

module RAT_WRAPPER(
    input CLK,
    input BTNR,
    input [7:0] SWITCHES,
    output [7:0] LEDS,
    output [3:0] ANODES,
    output [7:0] CATHODES
    );
    
    // INPUT PORT IDS ////////////////////////////////////////////////////////
    // Right now, the only possible inputs are the switches
    // In future labs you can add more port IDs, and you'll have
    // to add constants here for the mux below
    localparam SWITCHES_ID = 8'hFF;
       
    // OUTPUT PORT IDS ///////////////////////////////////////////////////////
    // In future labs you can add more port IDs
    localparam LEDS_ID      = 8'h40;
    localparam SEG_ID       = 8'h81;
    // Signals for connecting RAT_MCU to RAT_wrapper /////////////////////////
    logic [7:0] s_output_port;
    logic [7:0] s_port_id;
    logic s_load;
    logic s_interrupt;
    logic s_reset;
    logic s_clk_50 = 1'b0;     // 50 MHz clock
    
    // Register definitions for output devices ///////////////////////////////
    logic [7:0]   s_input_port;
    logic [7:0]   r_leds = 8'h00;
    logic [7:0]   r_seg = 8'h00;
    
    // Declare RAT_CPU ///////////////////////////////////////////////////////
    RAT_MCU MCU (.IN_PORT(s_input_port), 
	    	.OUT_PORT(s_output_port),
                .PORT_ID(s_port_id), 
	   	       .IO_STRB(s_load), 
	       	.RESET(s_reset),
                .INTR(s_interrupt), 
	    	.CLK(s_clk_50));
   
	
    // Clock Divider to create 50 MHz Clock //////////////////////////////////
    always_ff @(posedge CLK) begin
        s_clk_50 <= ~s_clk_50;
    end
    

    // MUX for selecting what input to read //////////////////////////////////
    always_comb begin
        if (s_port_id == SWITCHES_ID)
            s_input_port = SWITCHES;
        else
            s_input_port = 8'h00;
    end
   
    // MUX for updating output registers /////////////////////////////////////
    // Register updates depend on rising clock edge and asserted load signal
    always_ff @ (posedge CLK) begin
        if (s_load == 1'b1) begin
            if (s_port_id == LEDS_ID)
                r_leds <= s_output_port;
	    else if (s_port_id == SEG_ID)
		      r_seg <= s_output_port;
            end
        end
    
    

////INSTANITATION of SEV Seg//////////////////////
	SevSegDisp Sev_Seg_Disp(
			.CLK(s_clk_50),    
   			.DATA_IN(r_seg),
			.CATHODES(CATHODES),
 			.ANODES(ANODES)

	);

////////////////////////////////////////////



    // Connect Signals ///////////////////////////////////////////////////////
    assign s_reset = BTNR;
    assign s_interrupt = 1'b0;  // no interrupt used yet
     
    // Output Assignments ////////////////////////////////////////////////////
    assign LEDS = r_leds;
  
    endmodule
