LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY control IS
	PORT(	scan_ready, reset, clk		: IN	STD_LOGIC;
			reads, MC_LE, BC_LE		    : OUT	STD_LOGIC);
END control;

Architecture a of control is
signal state: std_logic_vector(2 downto 0);
begin

controll: process (reset,clk)
begin

if reset = '0' then
state <= "000";

elsif (clk' event and clk = '1') then

if ((state = "000") and (scan_ready = '0')) then
state <= "000";

reads <= '0';

elsif (state = "000" and scan_ready = '1') then
state <= "001";

reads <= '1';

elsif (state = "001") then
state <= "010";

reads <= '0';

elsif (state = "010" and scan_ready = '1') then
state <= "010";

reads <= '0';

elsif (state = "010" and scan_ready = '0') then
state <= "011";

reads <= '0';

elsif (state = "011" and scan_ready = '0') then
state <= "011";

reads <= '0';

elsif (state = "011" and scan_ready = '1') then
state <= "100";

reads <= '1';

elsif (state = "100" and scan_ready = '1') then
state <= "100";

reads <= '0';

elsif (state = "100" and scan_ready = '0') then
state <= "101";

reads <= '0';

elsif (state = "101" and scan_ready = '0') then
state <= "101";

reads <= '0';

elsif (state = "101" and scan_ready = '1') then
state <= "110";

reads <= '1';

elsif (state = "110") then
state <= "111";

reads <= '0';

elsif (state = "111" and scan_ready = '1') then
state <= "111";

reads <= '0';

elsif (state = "111" and scan_ready = '0') then
state <= "000";

reads <= '0';

end if;
end if;
end process;

enable: process(state, scan_ready)
begin 
if (state = "101" and scan_ready = '1') then
BC_LE <= '1';

elsif (state = "000" and scan_ready = '1') then
MC_LE <= '1';
end if;
end process;
end a;