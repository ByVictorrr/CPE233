module RAT_MCU_tb(

    );
            logic [7:0] IN_PORT;
            logic RESET;
            logic INT_CU;
            logic CLK;
            logic [7:0] OUT_PORT;
            logic [7:0] PORT_ID;
            logic IO_STRB;
            
           RAT_MCU RAT_MCU_tb (.*);
           
              always 
              begin
               CLK = 0; #5;
               CLK = 1; #5;
               end
              
          
                 initial
                 begin
                 
    
                     INT_CU = 0; RESET = 0; IN_PORT = 8'hFF;
                     #120;
                 end 
                 
               
               
                 
   
         
         
          endmodule