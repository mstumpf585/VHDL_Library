----------------------------------------------------------------------------
-- Entity:        Decoder3to8
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  13 sep 15
-- Description:   Description of the entity.
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:	none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder3to8 is
	port(X  : in STD_LOGIC_VECTOR (3 downto 0);
		  EN :in STD_LOGIC;
		  Y  : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder3to8;

architecture Structural of Decoder3to8 is

begin

	Y <= "11111110" when (X(2 downto 0) = "000" and EN = '1') else
		  "11111101" when (X(2 downto 0) = "001" and EN = '1') else
		  "11111011" when (X(2 downto 0) = "010" and EN = '1') else
		  "11110111" when (X(2 downto 0) = "011" and EN = '1') else
	     "11101111" when (X(2 downto 0) = "100" and EN = '1') else
	     "11011111" when (X(2 downto 0) = "101" and EN = '1') else
	     "10111111" when (X(2 downto 0) = "110" and EN = '1') else
	     "01111111" when (X(2 downto 0) = "111" and EN = '1') else
	     "11111110";
	                              
end Structural;

