`include "./ClockDivider.sv"
`include "/home/victor/CPE233/Modules/mux_4t1_nb.v"
`include "./SW_DCDR_SCLK.sv"



module tones(input CLK, input [7:0]SW, output TONES);

//f_CLK_input = 100 MHz
//
// SW = {}
//
// frequency output should change if SWithes change

//USE MUX that selects for differnt values of SW's to choose the frequency wanted.
// Coming out of p-mod of basys3 board will go into breadboard

wire SCLK;

SW_DCDR_SCLK decoder(); // maps switches to output clk

ClockDivider CLK_DIV(
    .clk(CLK), 
    .maxcount(),
    .sclk(SCLK)  
    );





endmodule

