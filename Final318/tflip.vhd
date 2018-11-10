--Yu Chang Ou
--Spring2017

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tflip is
 port (clr, T, clk: in std_logic;
 Qn, Qn_not: buffer std_logic);
end tflip;

architecture example of tflip is
signal prev, prev_not: std_logic;
begin

process (clr, clk) is
begin
 if clr = '0' then
	prev <= '0';
	prev_not <= '1';
 
 elsif (clk'event and clk='1') then
	if T = '1' then
		prev <= prev_not;
		prev_not <= prev;
	end if;
else
	prev <= prev;
	prev_not <= prev_not;
end if;
end process;

	Qn <= Prev;
	Qn_not <= Prev_not;
	
end example;





