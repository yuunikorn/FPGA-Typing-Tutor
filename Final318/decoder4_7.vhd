library ieee;
use ieee.std_logic_1164.all;

entity decoder4_7 is  
port(SW: in std_logic_vector(3 downto 0);
 LED: out std_logic_vector(6 downto 0));
end decoder4_7;

architecture dataflow of decoder4_7 is 
begin
  with SW select 
  LED <= "1000000" after 1 ns when  "0000",
  "1111001" after 1 ns when "0001",
  "0100100" after 1 ns when "0010",
  "0110000" after 1 ns when "0011",
  "0011001" after 1 ns when "0100",
  "0010010" after 1 ns when "0101",
  "0000010" after 1 ns when "0110",
  "1111000" after 1 ns when "0111",
  "0000000" after 1 ns when "1000",
  "0010000" after 1 ns when "1001",
  "0001000" after 1 ns when "1010",
  "0000011" after 1 ns when "1011",
  "1000110" after 1 ns when "1100",
  "0100001" after 1 ns when "1101",
  "0000110" after 1 ns when "1110",
  "0001110" after 1 ns when "1111",
  "1111111" after 1 ns when others;
end architecture dataflow;