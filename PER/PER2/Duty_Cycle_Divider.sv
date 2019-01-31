`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Edited by Victor and Crystal
// 
// Create Date: 10/01/2018 10:22:13 AM
// Description: Generic Clock Divider.  Divides the input clock by MAXCOUNT*2
// 
//////////////////////////////////////////////////////////////////////////////////


module Duty_Cycle_Divider (
    input clk, 
    input [7:0] SW,
    output logic oCLK = 0
    
    );     
   
    logic [7:0] count = 0;    
    


    always_ff @ (posedge clk)
    begin
        count = count + 1;
        
	//Test 1 - See if SW = 0 has been inputed -> if so oclk is zero
    if (SW == 0) oCLK <= 0; 
	//TEST 3 - when count is less than SW we turn oCLK high
	else if (SW > count || SW == count ) oCLK <= 1;
	else if (SW < count) 
	begin	
	oCLK <=0;
		//counter =0;
     end
             
    end
    
endmodule
