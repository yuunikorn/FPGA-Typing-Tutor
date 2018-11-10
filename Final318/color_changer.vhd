LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY color_changer IS

	PORT( color_mux, letter_correct,clock : in std_logic; 
		red, blue, green, right_light: out std_logic);

End color_changer;

ARCHITECTURE logic OF color_changer IS

Signal red_s, blue_s,green_s,right_lit: std_logic;

BEGIN

process (clock) 
begin
if(clock'event and clock='1') then
If (color_mux='0') then 
	red_s<='1';
	blue_s<='1';
	green_s<='1';

elsif(color_mux='1') then
		red_s<='0';
		blue_s<='0';
		green_s<='0'; 
		end if;
Else 
	red_s<=red_s;
	blue_s<=blue_s;
	green_s<=green_s;
End if; 

End process;

process (letter_correct)
begin 
if (letter_correct='1') then 
	right_lit<='1';


elsif(letter_correct='0') then
	right_lit <='0';

else
	right_lit<=right_lit;
	
end if;
end process;


right_light<=right_lit; 

red<=red_s;
blue<=blue_s;
green<=green_s;


End logic;		