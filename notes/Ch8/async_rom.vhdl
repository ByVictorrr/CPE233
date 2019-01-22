entity gen_async_rom is
 Port ( ADDR : in STD_LOGIC_VECTOR(4 downto 0);
 DATA : out STD_LOGIC_VECTOR(3 downto 0));
end gen_async_rom;
architecture gen_async_rom of gen_async_rom is
 -----------------------------------------------------------------------(1)
 TYPE vector_array is ARRAY(0 to 31) of STD_LOGIC_VECTOR(3 downto 0);

 -----------------------------------------------------------------------(2)
 CONSTANT my_memory: vector_array := ( X"0", X"1", X"2", X"3",
 X"4", X"5", X"6", X"7",
 X"8", X"9", X"A", X"B",
 X"C", X"D", X"E", X"F",
 X"F", X"E", X"D", X"C",
 X"B", X"A", X"9", X"8",
 X"7", X"6", X"5", X"4",
 X"3", X"2", X"1", X"F");
begin
 -----------------------------------------------------------------------(3)
 DATA <= my_memory(CONV_INTEGER(ADDR));
end gen_async_rom;
