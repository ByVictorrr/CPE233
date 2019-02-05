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

<<<<<<< HEAD:PER/PER1/main.sv
SW_DCDR_SCLK mapper(// maps switches to output clk
    .SW(SW), 
    .maxcount(maxcount)
    ); 
    
||||||| merged common ancestors:PER/PER2/main.sv
 
=======
<<<<<<< Updated upstream
 
>>>>>>> aded:PER/PER2/main.sv

<<<<<<< HEAD:PER/PER1/main.sv
ClockDivider CLK_DIV(
||||||| merged common ancestors:PER/PER2/main.sv
Duty_Cycle_Divider ins(
=======
Duty_Cycle_Divider ins(
||||||| merged common ancestors
SW_DCDR_SCLK mapper(// maps switches to output clk
    .SW(SW), 
    .maxcount(maxcount)
    ); 
    

ClockDivider CLK_DIV(
=======
    
// Slow down the clock to 392.157 kHz
ClockDivider CLK_SLOW(
>>>>>>> Stashed changes
>>>>>>> aded:PER/PER2/main.sv
    .clk(CLK), 
<<<<<<< HEAD:PER/PER1/main.sv
    .maxcount(maxcount),
    .sclk(SCLK)  
||||||| merged common ancestors:PER/PER2/main.sv
    .SW(SW),
    .oCLK(oCLK)  
=======
<<<<<<< Updated upstream
    .SW(SW),
    .oCLK(oCLK)  
||||||| merged common ancestors
    .maxcount(maxcount),
    .sclk(SCLK)  
=======
    .maxcount(127.50),
    .sclk(SCLK)  
>>>>>>> Stashed changes
>>>>>>> aded:PER/PER2/main.sv
    );
  
Duty_duty_cycle(
    .SW(SW), 
    .maxcount(maxcount)
    ); 
 

endmodule


