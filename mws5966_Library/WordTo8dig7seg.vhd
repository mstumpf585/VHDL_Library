----------------------------------------------------------------------------
-- Entity:        WordTo8dig7seg
-- Written By:    Michael Stumpf 
-- Date Created:  10 OCT 15
-- Description:   calculates the average of 4 numbers 
--
-- Revision History (10/14/15):
-- 
-- Dependencies:
--		Counter_nbit, HexToSevenSeg
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library mws5966_library;
use mws5966_library.mws5966_components.ALL;
---------------------------------------------------------------------------------------------
entity WordTo8dig7seg is
 Port (STROBE   : in STD_LOGIC;
		 CLK      : in STD_LOGIC;
		 CLR      : in STD_LOGIC;
		 WORD     : in STD_LOGIC_VECTOR  (31 downto 0);
		 DIGIT_EN : in STD_LOGIC_VECTOR  (7  downto 0);
		 ANODE    : out STD_LOGIC_VECTOR (7  downto 0);
		 SEGMENT  : out STD_LOGIC_VECTOR ( 0 to 6));
end WordTo8dig7seg;

architecture Behavioral of WordTo8dig7seg is

-- constants 
	-- anode 7..0
		constant anode7  : STD_LOGIC_VECTOR(7 downto 0) := "01111111"; 
		constant anode6  : STD_LOGIC_VECTOR(7 downto 0) := "10111111"; 	
		constant anode5  : STD_LOGIC_VECTOR(7 downto 0) := "11011111"; 
		constant anode4  : STD_LOGIC_VECTOR(7 downto 0) := "11101111"; 
		constant anode3  : STD_LOGIC_VECTOR(7 downto 0) := "11110111"; 
		constant anode2  : STD_LOGIC_VECTOR(7 downto 0) := "11111011"; 
		constant anode1  : STD_LOGIC_VECTOR(7 downto 0) := "11111101"; 
		constant anode0  : STD_LOGIC_VECTOR(7 downto 0) := "11111110"; 
		constant anodeOFF: STD_LOGIC_VECTOR(7 downto 0) := "11111111"; 
		
	-- this is for any generic components 
		constant n:        integer :=3;

	-- maxCount constant to clear counter 
		constant maxCount: integer := 8;
		
-- internal signals 
		signal CLR_int     : STD_LOGIC;
		signal comp_eq_out : STD_LOGIC;
		signal count_int   : STD_LOGIC_VECTOR (2  downto 0);
		signal mux_out1    : STD_LOGIC_VECTOR (7  downto 0); 
		signal mux_out2    : STD_LOGIC_VECTOR (3  downto 0); 
		signal SEGMENT_int : STD_LOGIC_VECTOR (55 downto 0);

	

begin

	--mux 8:1 anode 
	ANODE    <= anode7 when (count_int = "111") and DIGIT_EN(7) = '1' else 
				   anode6 when (count_int = "110") and DIGIT_EN(6) = '1' else 
				   anode5 when (count_int = "101") and DIGIT_EN(5) = '1' else 
				   anode4 when (count_int = "100") and DIGIT_EN(4) = '1' else 
				   anode3 when (count_int = "011") and DIGIT_EN(3) = '1' else 
				   anode2 when (count_int = "010") and DIGIT_EN(2) = '1' else 
				   anode1 when (count_int = "001") and DIGIT_EN(1) = '1' else 
				   anode0 when (count_int = "000") and DIGIT_EN(0) = '1' else 
				   anodeOFF;

					
	-- mux 8:1 hex 		
	mux_out2 <= WORD(31 downto 28) when (count_int = "111") else 
				   WORD(27 downto 24) when (count_int = "110") else 
				   WORD(23 downto 20) when (count_int = "101") else 
				   WORD(19 downto 16) when (count_int = "100") else 
				   WORD(15 downto 12) when (count_int = "011") else 
				   WORD(11 downto  8) when (count_int = "010") else 
				   WORD(7  downto  4) when (count_int = "001") else 
				   WORD(3  downto  0) when (count_int = "000") else 
				   WORD(31 downto 28) ;  
	
	-- portmaps 
	counter: Counter_nbit
	   generic map ( n => n)
		port map
			(EN   => STROBE,
			 CLK  => CLK, 
			 CLR  => CLR_int, 
			 Q    => count_int);
			 
		HEXx: HexToSevenSeg
				port map( 
					HEX     => mux_out2,
					SEGMENT => SEGMENT);
			
			 
	--compare if equal to 7
	CLR_int   <= '1' when (to_integer(unsigned(count_int)) = maxCount) else 
					 '1' when (CLR = '1') else
					 '0'; 
end Behavioral;

