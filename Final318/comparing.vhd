library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY comparing IS
	PORT
		(clk, reset	: IN	STD_LOGIC;
		keyboardData 	: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
		Char_one, char_two, char_three, char_four, char_five, char_six, char_seven,char_eight, char_nine, char_ten: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
		outputEnable: out std_logic; --prompts change of entire word
		match_Letter: out std_logic);
		
		
END comparing;

architecture check of comparing is 


signal letter: std_logic_vector(5 downto 0);
signal match_letter_s, output_en_s: std_logic;

type state_type is (s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
signal state : state_type;
signal one, two, three, four, five, six, seven, eight, nine, ten: STD_LOGIC_VECTOR(5 DOWNTO 0);


begin 





nextWord: process (clk,reset) is
		
	begin
	one <= Char_one;
two <= char_two;
three <= char_three;
four <= char_four;
five <= char_five;
six <= char_six;
seven <= char_seven;
eight <= char_eight;
nine <= char_nine;
ten <= char_ten; 
	if (reset='0') then
		state<=S1; 
		
	elsif (clk'event and clk='1') then
			
		if (letter /= keyboardData) then
			letter <= keyboardData;

				match_letter_s<='0';
				output_en_s <= '0';
			case state is
				
				when S1 =>
			
					match_letter_s<='0';
					if (one = letter) then 
						state <= S2;                          	
						match_letter_s<='1';
						
					elsif (one = "000000") then
						
						state <= S11;
						
					elsif (one = "010000") then
					
						if ("011001" = keyboardData) then 
							state <= S11;                          
							match_letter_s<='1';
							
						end if;
					else
						state <= S1;
					
					end if;
						
				when S2 =>
					match_letter_s<='0';
					if (two = letter) then 
						state <= S3;
						match_letter_s<='1';
					
						
					elsif (two = "000000") then
						state <= S11;
					else
						state <= S2;
						
					end if;

				when S3 =>
					match_letter_s<='0';
					if (three = letter) then 
						state <= S4;
						match_letter_s<='1';
						
					elsif (three = "000000") then
						state <= S11;
					else
						state <= S3;
						
					end if;
					
				when S4 =>
		
					match_letter_s<='0';
					if (four = letter) then 
						state <= S5;
						match_letter_s<='1';
					elsif (four = "000000") then
						state <= S11;
					else
						state <= S4;
						
					end if;
						
				when S5 =>
					match_letter_s<='0';
					if (five = letter) then 
						state <= S6;
						match_letter_s<='1';
						
					elsif (five = "000000") then
						state <= S11;
					else
						state <= S5;
						
					end if;

				when S6 =>
			
					match_letter_s<='0';
					if (six = letter) then 
						state <= S7;
						match_letter_s<='1';
						
					elsif (six = "000000") then
						state <= S11;
					else
						state <= S6;
					end if;
						
				when S7 =>
					match_letter_s<='0';
					if (seven = letter) then 
						state <= S8;
						match_letter_s<='1';
					
					elsif (seven = "000000") then
						state <= S11;
					else
						state <= S7;
						
					end if;

				when S8 =>
			
					match_letter_s<='0';
					if (eight = letter) then 
						state <= S9;
						match_letter_s<='1';
						
					elsif (eight = "000000") then
						state <= S11;
					else
						state <= S8;
						
					end if;
					
				when S9 =>
					match_letter_s<='0';
					if (nine = letter) then 
						state <= S10;
						match_letter_s<='1';
						
					elsif (nine = "000000") then
						state <= S11;
					else
						state <= S9;
					end if;
						
				when S10 =>
					match_letter_s<='0';
					if (ten = letter) then 
						state <= S11;
						match_letter_s<='1';
						
					elsif (ten = "000000") then
						state <= S11;
					else
						state <= S10;
						
					end if;
					
				when s11 =>
						match_letter_s<='0';
					
						output_en_s <= '1';
						state <= S1;
				end case;
				end if;
			end if;
		end process nextWord;

	match_letter <= match_letter_s;
	
	outputEnable <= output_en_s;
	end check;			