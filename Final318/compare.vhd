library ieee;
use ieee.std_logic_1164.all;

entity compare is
port (Make: in std_logic_vector(7 downto 0);
	Break: in std_logic_vector(7 downto 0);
	Eq : out std_logic);
end compare;

architecture check of compare is
begin
process(Make, Break) is
begin
if (Make = Break) then
	Eq<='0';
else Eq<='1';
end if;
end process;
end check;