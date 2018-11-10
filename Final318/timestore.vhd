--Yu Chang Ou
--Spring2017

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity timestore is
 port (enable, reset, resetenable,clock: in std_logic;
 d0, d1,d2, d3: in std_logic_vector(3 downto 0);
 v0, v1,v2, v3: out std_logic_vector(3 downto 0));
end timestore;

architecture example of timestore is
signal num0, num1, num2, num3: std_logic_vector(3 downto 0);
signal concat_d, concat_num: std_logic_vector(15 downto 0);
begin

process (reset, clock) is
begin

if (clock'event and clock='1') then
 
 if (reset = '0') and (resetenable = '0') then
	num0 <= "0000";
	num1 <= "0000";
	num2 <= "0000";
	num3 <= "0000";

elsif (enable='0') then
concat_d <= d3 & d2 & d1 & d0;
concat_num <= num3 & num2 & num1 & num0; 

	if (concat_d < concat_num) or (concat_num = "0000000000000000") then
			num0 <= d0;
			num1 <= d1;
			num2 <= d2;
			num3 <= d3;

	end if;

else
			num0 <= num0;
			num1 <= num1;
			num2 <= num2;
			num3 <= num3;
			
end if;
end if;
end process;

v0 <= num0;
v1 <= num1;
v2 <= num2;
v3 <= num3;
end example;

