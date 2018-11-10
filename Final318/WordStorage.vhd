library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY WordStorage IS
	PORT
		(changeword,clock,reset	: IN	STD_LOGIC;
		Char_one, char_two, char_three, char_four, char_five, char_six, char_seven,char_eight, char_nine, char_ten: out	STD_LOGIC_VECTOR(5 DOWNTO 0));

END WordStorage;

architecture logic of WordStorage is 
signal wordcount : std_logic_vector(3 downto 0);
signal Char_one_s, char_two_s, char_three_s, char_four_s, char_five_s, char_six_s, char_seven_s,char_eight_s, char_nine_s, char_ten_s: STD_LOGIC_VECTOR(5 DOWNTO 0);
begin 


Process(changeword,reset) 
begin  
	if (reset='0')then 
		wordcount<="0000"; 
	
	elsif (changeword'event and changeword='1') then 
		wordcount <=wordcount + '1'; 
	end if;

end process; 

process(clock) 
begin 
		
	if (clock'event and clock= '1') then 
		if (wordcount="0000") then 
			Char_one_s<="010000";--P
			char_two_s<="001100";--L
			char_three_s<="000001";--A
			char_four_s<="011001";--Y
			char_five_s<="100000";--" "
			char_six_s<="011001";--Y
			char_seven_s<="101111";--/
			char_eight_s<="001110";--N
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0001") then 
			Char_one_s<="000010";--B
			char_two_s<="000101";--E
			char_three_s<="000000";
			char_four_s<="000000";
			char_five_s<="000000";
			char_six_s<="000000";
			char_seven_s<="000000";
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0010") then 
			Char_one_s<="001000";--H
			char_two_s<="001111";--O
			char_three_s<="010100";--T
			char_four_s<="000000";
			char_five_s<="000000";
			char_six_s<="000000";
			char_seven_s<="000000";
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0011") then 
			Char_one_s<="000110";--F
			char_two_s<="001111";--O
			char_three_s<="010101";--U
			char_four_s<="010010";--R
			char_five_s<="000000";
			char_six_s<="000000";
			char_seven_s<="000000";
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0100") then 
			Char_one_s<="000100";--D
			char_two_s<="010010";--R
			char_three_s<="000101";--E
			char_four_s<="000001";--A
			char_five_s<="001101";--M
			char_six_s<="000000";
			char_seven_s<="000000";
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0101") then 
			Char_one_s<="010011";--S
			char_two_s<="001001";--I
			char_three_s<="001110";--N
			char_four_s<="000111";--G
			char_five_s<="001100";--L
			char_six_s<="000101";--E
			char_seven_s<="000000";
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0110") then 
			Char_one_s<="000011";--C
			char_two_s<="001111";--O
			char_three_s<="010101";--U
			char_four_s<="001110";--N
			char_five_s<="010100";--T
			char_six_s<="000101";--E
			char_seven_s<="010010";--R
			char_eight_s<="000000";
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="0111") then 
			Char_one_s<="001100";--L
			char_two_s<="001111";--O
			char_three_s<="000011";--C
			char_four_s<="000001";--A
			char_five_s<="010100";--T
			char_six_s<="001001";--I
			char_seven_s<="001111";--O
			char_eight_s<="001110";--N
			char_nine_s<="000000";
			char_ten_s<="000000";
		elsif (wordcount="1000") then 
			Char_one_s<="000011";--C
			char_two_s<="001000";--H
			char_three_s<="000001";--A
			char_four_s<="010010";--R
			char_five_s<="000001";--A
			char_six_s<="000011";--C
			char_seven_s<="010100";--T
			char_eight_s<="000101";--E
			char_nine_s<="010010";--R
			char_ten_s<="000000";
		elsif (wordcount>"1000") then 
			Char_one_s<="001000";--H
			char_two_s<="001001";--I
			char_three_s<="010100";--T
			char_four_s<="100000";--" "
			char_five_s<="010010";--R
			char_six_s<="000101";--E
			char_seven_s<="010011";--S
			char_eight_s<="000101";--E
			char_nine_s<="010100";--T
			char_ten_s<="000000";
		else 
			Char_one_s<=Char_one_s;
			char_two_s<=char_two_s;
			char_three_s<=char_three_s;
			char_four_s<=char_four_s;
			char_five_s<=char_five_s;
			char_six_s<=char_six_s;
			char_seven_s<=char_seven_s;
			char_eight_s<=char_eight_s;
			char_nine_s<=char_nine_s;
			char_ten_s<=char_ten_s;
		
		end if; 

	end if;
end process; 
Char_one<=Char_one_s;
char_two<=char_two_s;
char_three<=char_three_s;
char_four<=char_four_s;
char_five<=char_five_s;
char_six<=char_six_s;
char_seven<=char_seven_s;
char_eight<=char_eight_s;
char_nine<=char_nine_s;
char_ten<=char_ten_s;

end logic; 
