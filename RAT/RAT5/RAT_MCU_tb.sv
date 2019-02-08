`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 11:00:32 PM
// Design Name: 
// Module Name: RAT_MCU_tb
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


module RAT_MCU_tb();
            logic [7:0] IN_PORT;
            logic RESET;
            logic INT_CU;
            logic CLK;
            logic [7:0 ]OUT_PORT;
            logic [7:0] PORT_ID;
            logic IO_STRB;
            
           RAT_MCU UU (.*);
           
            
              always 
              begin
               CLK = 0; #5;
               CLK = 1; #5;
               end
              
              
              initial 
              begin
             
             
             IN_PORT = 10;
             #20;
             
             RESET = 1;
             
             /* PORT_ID = 18'h32A20;               //IN    r10,SWITCH_PORT   ;SWITCH_PORT = 0xFF
              #20;
              
            PORT_ID = 18'h36BFF;              // MOV   r11,0xFF 
              #20;
              
              PORT_ID = 18'h11011;              // EXOR  r10,r11               
              #20;
              
              PORT_ID = 18'h00000;              // OUT   r10,LED_PORT 
              #20;
              
              PORT_ID = 18'h11010;              // BRN   main 
              #20;
             */ 
             
              end 
          endmodule