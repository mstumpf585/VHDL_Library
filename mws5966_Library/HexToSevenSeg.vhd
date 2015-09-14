----------------------------------------------------------------------------
-- Entity:        HexToSevenSeg
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  9/3/2015
-- Description:  Takes a 4bit Hex value and outputs its corresponding seven 
--					  segment drive value
--
-- Revision History (date, initials, description):
-- 
-- Dependencies: none
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HexToSevenSeg is

    Port ( HEX 		: in  STD_LOGIC_VECTOR (3 downto 0);
           SEGMENT   : out  STD_LOGIC_VECTOR(0 to 6));
			  
end HexToSevenSeg;

architecture Structural of HexToSevenSeg is

	--constants for seven seg display (0 - 15)
	--															     0123456
	constant  ZERO: 		STD_LOGIC_VECTOR(0 to 6) := "0000001";	
	constant   ONE: 		STD_LOGIC_VECTOR(0 to 6) := "1001111";
	constant   TWO: 		STD_LOGIC_VECTOR(0 to 6) := "0010010";
	constant THREE: 		STD_LOGIC_VECTOR(0 to 6) := "0000110";
	constant  FOUR: 		STD_LOGIC_VECTOR(0 to 6) := "1001100";
	constant  FIVE: 		STD_LOGIC_VECTOR(0 to 6) := "0100100";
	constant   SIX: 		STD_LOGIC_VECTOR(0 to 6) := "0100000";
	constant SEVEN:		STD_LOGIC_VECTOR(0 to 6) := "0001111";
	constant EIGHT: 		STD_LOGIC_VECTOR(0 to 6) := "0000000";
	constant  NINE: 		STD_LOGIC_VECTOR(0 to 6) := "0000100";
	constant     A: 		STD_LOGIC_VECTOR(0 to 6) := "0001000";
	constant     B: 		STD_LOGIC_VECTOR(0 to 6) := "1100000";
	constant     C: 		STD_LOGIC_VECTOR(0 to 6) := "0110001";
	constant     D: 		STD_LOGIC_VECTOR(0 to 6) := "1000010";
	constant     E: 		STD_LOGIC_VECTOR(0 to 6) := "0110000";
	constant     F: 		STD_LOGIC_VECTOR(0 to 6) := "0111000";

begin

--when else statement (0-15)
	SEGMENT <= ZERO		when (HEX = "0000") else 
				  ONE 		when (HEX = "0001") else 
			     TWO 		when (HEX = "0010") else 
			     THREE  	when (HEX = "0011") else 
			     FOUR 		when (HEX = "0100") else 
			     FIVE 		when (HEX = "0101") else 
			     SIX 		when (HEX = "0110") else 
			     SEVEN 		when (HEX = "0111") else 
			     EIGHT 		when (HEX = "1000") else 
			     NINE 		when (HEX = "1001") else 
			     A 			when (HEX = "1010") else 
              B 			when (HEX = "1011") else 
				  C 			when (HEX = "1100") else 
              D 			when (HEX = "1101") else
              E 			when (HEX = "1110") else 
              F			when (HEX = "1111") else 
				  zero; 

end Structural;

