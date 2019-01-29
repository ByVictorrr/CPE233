entity  logic_unit  is Port  (  A, B   :  in std_logic_vector(7  downto  0);  S1   :  in std_logic;  F   :  out std_logic_vector(7  downto  0));  end  logic_unit;  architecture  lu  of  logic_unit  is begin with  S1  select F   <=   ( not  A)  when  “11”, (A  XOR  B)  when  “10”, (A  OR  B)  when  “01”, (A  AND  B)  when  “00”, X”00”  when others;   --   hex   notation  end  lu; 
