library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Score IS
	PORT
		(matchLetter, reset	: IN	STD_LOGIC;
		score: out std_logic_vector(7 downto 0));
		
END Score;