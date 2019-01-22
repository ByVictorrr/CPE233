entity gen_dec is
 Port ( ADDR_15_13 : in STD_LOGIC_VECTOR (2 downto 0);
 CS2 : out STD_LOGIC;
 CS4 : out STD_LOGIC;
 CS6 : out STD_LOGIC);
end gen_dec;
architecture gen_dec of gen_dec is
begin

 my_dec: process (ADDR_15_13)
 begin
 case ADDR_15_13 is
 when "010" => CS2 <= '0'; CS4 <= '1'; CS6 <= '0'; -- 2
 when "100" => CS2 <= '1'; CS4 <= '0'; CS6 <= '0'; -- 4
 when "110" => CS2 <= '1'; CS4 <= '1'; CS6 <= '0'; -- 6
 when others => CS2 <= '1'; CS4 <= '1'; CS6 <= '1'; -- catchall
 end case;
 end process my_dec;
end gen_dec;
