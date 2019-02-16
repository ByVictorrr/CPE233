
module RAT_MCU_tb();

       logic CLK;
       logic BTNC;
       logic [7:0] SWITCHES;
       logic [7:0] LEDS;
            
           RAT_WRAPPER RAT_MCU_tb (.*);
           
              always 
              begin
               CLK = 0; #5;
               CLK = 1; #5;
               end
              
          
                 initial
                 begin
                 
    
                     INTR = 0; BTNC = 0; SWITCHES = 8'hFF;
                     #120;
                 end 
                 
               
               
                 
   
         
         
          endmodule
