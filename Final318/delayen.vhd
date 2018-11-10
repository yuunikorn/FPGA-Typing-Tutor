--Yu Chang Ou
--Spring2017

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity delayen is
 port (clr, T, clk: in std_logic;
 Qn, Qn_not: buffer std_logic);
end delayen;

architecture example of delayen is
signal prev, prev_not: std_logic;

type state_type is(s0, s1, s2);
signal state: state_type;

begin

process (clr, clk, T) is
begin
 if clr = '0' then
	prev <= '0';
	prev_not <= '1';
 
 elsif (clk'event and clk='1') then
	

case state is
when s0 => 
	if (T = '1') then 
	state <= s1;

	end if;
when s1 => 
	prev <= '1';
	prev_not <= '0';
	state <= s2;
	
when s2 =>
	if (T = '1') then
			prev <= '0';
			prev_not <= '1'; 
		state <= S2;
	else
		state <= S0;
	end if;
	
when others =>
	state <= S0;
end case;

else
	prev <= prev;
	prev_not <= prev_not;
end if;
end process;

	Qn <= Prev after 100ns;
	Qn_not <= Prev_not after 100ns;
	
end example;