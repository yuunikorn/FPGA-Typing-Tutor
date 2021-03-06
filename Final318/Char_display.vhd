--should act as large char 
--partitions the screen intto 10 spaces and adds the characters

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Char_display IS
	PORT
		(pix_row, pix_col	: IN	STD_LOGIC_VECTOR(9 DOWNTO 0);

		Char_one, char_two, char_three, char_four, char_five, char_six, char_seven,char_eight, char_nine, char_ten: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);

		char_add		: OUT	STD_LOGIC_VECTOR(5 DOWNTO 0);
		fr, fc			: OUT	STD_LOGIC_VECTOR(2 DOWNTO 0));

END Char_display;
ARCHITECTURE logic OF char_display IS
BEGIN
	-- Process Statements
gen_logic:
PROCESS(pix_row, pix_col,Char_one, char_two, char_three, char_four, char_five, char_six, char_seven,char_eight, char_nine)
	VARIABLE pc : STD_LOGIC_VECTOR(9 DOWNTO 0);
	VARIABLE pr : STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN

-- Generate the address of the character in the RAM
if (pix_row<190) then 
	char_add<="100000";
elsif(pix_row>295) then
	char_add<="100000";
else
IF (pix_col < 64) THEN
	if(char_one="000000")then 
		char_add <="100000";
	else	
	char_add <= char_one; 
	end if;
ELSIF (pix_col >= 64) and (pix_col < 128) THEN
	if(char_two="000000")then 
		char_add <="100000";
	else	
	char_add <= char_two; 
	end if;
ELSIF (pix_col >= 128) and (pix_col < 192) THEN
	if(char_three="000000")then 
		char_add <="100000";
	else	
	char_add <= char_three; 
	end if; 
ELSIF (pix_col >= 192) and (pix_col < 256) THEN
	if(char_four="000000")then 
		char_add <="100000";
	else	
	char_add <= char_four; 
	end if;
ELSIF (pix_col >= 256) and (pix_col < 320) THEN
	if(char_five="000000")then 
		char_add <="100000";
	else	
	char_add <= char_five; 
	end if;
ELSIF (pix_col >= 320) and (pix_col < 384) THEN
	if(char_six="000000")then 
		char_add <="100000";
	else	
	char_add <= char_six; 
	end if; 
ELSIF (pix_col >= 384) and (pix_col < 448) THEN
	if(char_seven="000000")then 
		char_add <="100000";
	else	
	char_add <= char_seven; 
	end if;
ELSIF (pix_col >= 448) and (pix_col < 512) THEN
	if(char_eight="000000")then 
		char_add <="100000";
	else	
	char_add <= char_eight; 
	end if;
ELSIF (pix_col >= 512) and (pix_col < 576) THEN
	if(char_nine="000000")then 
		char_add <="100000";
	else	
	char_add <= char_nine; 
	end if;
ELSE
	char_add <= "100000"; 
END IF;
end if;

-- Want the font column to change every 30 in the range 0-240 and 480-640
IF (pix_col < 64) THEN
pc := pix_col;
ELSIF (pix_col >= 64) and (pix_col < 128) THEN
	pc := pix_col-64;
ELSIF (pix_col >= 128) and (pix_col < 192) THEN
	pc := pix_col-128;
ELSIF (pix_col >= 192) and (pix_col < 256) THEN
pc := pix_col-192;
ELSIF  (pix_col >= 256) and (pix_col < 320) THEN
pc := pix_col-256;
ELSIF (pix_col >= 320) and (pix_col < 384) THEN
pc := pix_col-320;
ELSIF (pix_col >= 384) and (pix_col < 448) THEN
pc := pix_col-384;
ELSIF (pix_col >= 448) and (pix_col < 512) THEN
pc := pix_col-448;
ELSIF (pix_col >= 512) and (pix_col < 576) THEN
pc := pix_col- 512;
ELSIF (pix_col >= 576) THEN
	pc := pix_col - 576;
ELSE
	pc := pix_col;
END IF;
	 
-- Change the font column every 30
IF (pc >= 0) and (pc < 8) THEN
	fc <= "000";
ELSIF (pc >= 8) and (pc < 16) THEN
	fc <= "001";
ELSIF (pc >= 16) and (pc < 24) THEN
	fc <= "010";
ELSIF (pc >= 24) and (pc < 32) THEN
	fc <= "011";
ELSIF (pc >= 32) and (pc < 40) THEN
	fc <= "100";
ELSIF (pc >= 40) and (pc < 48) THEN
	fc <= "101";
ELSIF (pc >= 48) and (pc < 56) THEN
	fc <= "110";
ELSIF (pc >= 56) and (pc < 64) THEN
	fc <= "111";
ELSE 
	fc <= "000";		
END IF;

pr := pix_row;  -- for convenience

-- Change the font row 
IF (pr >= 180) and (pr < 195) THEN
	fr <= "000";
ELSIF (pr >= 195) and (pr < 210) THEN
	fr <= "001";
ELSIF (pr >= 210) and (pr < 225) THEN
	fr <= "010";
ELSIF (pr >= 225) and (pr < 240) THEN
	fr <= "011";
ELSIF (pr >= 240) and (pr < 255) THEN
	fr <= "100";
ELSIF (pr >= 255) and (pr < 270) THEN
	fr <= "101";
ELSIF (pr >= 270) and (pr < 285) THEN
	fr <= "110";
ELSIF (pr >= 285) and (pr < 300) THEN
	fr <= "111";
ELSE 
	fr <= "000";		
END IF;

END PROCESS gen_logic;

END logic;
