library ieee;
use ieee.std_logic_1164.all;

entity reg8 is
port (MR, clk, LE : in std_logic;
	D : in std_logic_vector(7 downto 0);
	Q : out std_logic_vector(7 downto 0));
end reg8;

architecture scanning of reg8 is
signal Q_int : std_logic_vector(7 downto 0);
begin
	process(clk, MR) is
	begin
		if (MR = '0') then 
			Q_int<= "00000000";
		elsif rising_edge(clk) then 
			if (LE = '0') then
				Q_int<=Q_int;
			else Q_int <= D;
			end if;
		else Q_int <=Q_int;
		end if;
	end process;
	Q<=Q_int;
end scanning;
	