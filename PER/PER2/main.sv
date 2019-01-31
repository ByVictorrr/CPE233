`include "./ClockDivider.sv"
`include "./SW_DCDR_SCLK.sv"

//////////////////////////////////////////////////////////////////////////////////
//// Company: VAC
//// Engineer: Victor Delaplaine, Crystal PrimaLang
//// 
//// Create Date: 1/14/2019 12:31:47 PM
//// Design Name: 
//// Module Name: main
//// Project Name: PER 1
//// Target Devices: Basy3
//// Tool Versions: 
/// Description: Takes an input that are 8 switches and ouputs the corresponding clock frequencies need to produce a given note. 
//               This slower clock frequency is then set to a PMOD connection inputed to a speaker on a breadboard shown.
//// Dependencies:  ClockDivider.sv, SW_DCDR_SCLK.sv
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//



module main(input CLK, input [7:0]SW, output SCLK);


wire [16:0] maxcount;

SW_DCDR_SCLK mapper(// maps switches to output clk
    .SW(), 
    .maxcount(maxcount)
    ); 
    

ClockDivider CLK_DIV(
    .clk(CLK), 
    .maxcount(maxcount),
    .sclk(SCLK)  
    );
   


endmodule

