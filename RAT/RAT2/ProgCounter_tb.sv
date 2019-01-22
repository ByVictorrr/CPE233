`timescale 1ns / 1ps
`include "./main.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 02:51:47 PM
// Design Name: 
// Module Name: ProgCounter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC_W_MUX_Sim(    );

logic [9:0] FROM_IMMED, FROM_STACK,PC_COUNT;
logic [1:0] SEL;
logic  RST, LD, INC, CLK;
int i;

PC_W_MUX PC_W_MUX_init(.*);

always
begin
 CLK = 0; #5;
 CLK = 1; #5;
end

initial 
begin
    FROM_IMMED = 0; FROM_STACK = 0;  SEL = 0;  RST = 0; LD = 0;  INC = 1;
//Test if LD = 0 it increments
    #10
//Test if LD = 0 and inc = 0 it holds

    INC = 0;
    #10
 //Test if LD = 1 it loads selector values
    FROM_IMMED = 4; FROM_STACK = 5;  LD = 1;
    
    SEL = 0; 
        #10
    SEL = 1; 
        #10
    SEL = 2;
        #10
    SEL = 3;
        #10
    SEL = 2;
        #10
 //test the reset and make sure it takes president 
    RST = 1;
    end

endmodule
