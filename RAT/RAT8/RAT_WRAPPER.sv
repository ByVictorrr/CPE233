`include "./RAT_MCU.sv"
`include "/home/victor/CPE233/Modules/mux_2t1_nb.v"
`include "/home/victor/CPE233/Modules/univ_sseg.v"
`include "./debounce_one_shot.sv"

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
    input BRNL,
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
    logic IO_STRB;
    logic s_interrupt;
    logic s_reset;
    logic s_clk_50 = 1'b0;     // 50 MHz clock
    logic [7:0] SEV_SEG; 
    // Register definitions for output devices ///////////////////////////////
    logic [7:0]   s_input_port;
    logic [7:0]   r_leds = 8'h00;
    logic [7:0]   r_seg = 8'h00;
    
    // Declare RAT_CPU ///////////////////////////////////////////////////////
    RAT_MCU MCU (.IN_PORT(s_input_port), 
	    	.OUT_PORT(s_output_port),
            	.PORT_ID(s_port_id), 
	   	.IO_STRB(IO_STRB), 
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

    always_ff @ (posedge CLK) begin
        if (IO_STRB == 1'b1) begin
            if (s_port_id == LEDS_ID)
                r_leds <= s_output_port;
	    if (s_port_id == SEG_ID)
		r_seg <= s_output_port;
            end
        end
    
   //MODE == 1 (prcoess the valuies as a sev segment in as decimal)
univ_sseg Univ( 	
	.cnt1(SEV_SEG),                                                                                    
   	.cnt2(0),                                                                                     
    	.valid(1), 
    	.dp_en(0),                                                                                          
    	.dp_sel(0),                                                                                   
     	.mod_sel(0),                                                                                  
     	.sign(0),                                                                                           
     	.clk(CLK),                                                                                            
    	.ssegs(CATHODES),                                                                               
    	.disp_en(ANODES) 
);

debounce_one_shot ONESHOT(
		.CLK(s_clk_50),
    		.BTN(BTNL),
    		.DB_BTN(s_interrupt)
    );
 

);
    
    // Connect Signals ///////////////////////////////////////////////////////
    assign s_reset = BTNR;
    assign s_interrupt = 1'b0;  // no interrupt used yet
     
    // Output Assignments ////////////////////////////////////////////////////
    assign LEDS = r_leds;
    assign SEV_SEG =r_seg;  
    endmodule
