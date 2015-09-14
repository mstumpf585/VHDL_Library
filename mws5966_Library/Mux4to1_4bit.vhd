----------------------------------------------------------------------------
-- Entity:        Mux4to1_4bit
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  9/3/2015
-- Description:   Determines which of 4 vectors to output based off the 2 bit
--						select input
-- Revision History (date, initials, description):
-- 
-- Dependencies: none
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1_4bit is

Port ( X0 	: in  STD_LOGIC_VECTOR (3 downto 0);
       X1	: in  STD_LOGIC_VECTOR (3 downto 0);
       X2   : in  STD_LOGIC_VECTOR (3 downto 0);
		 X3   : in  STD_LOGIC_VECTOR (3 downto 0);
		 SEL  : in  STD_LOGIC_VECTOR (1 downto 0);
		 Y		: out STD_LOGIC_VECTOR (3 downto 0));  

end Mux4to1_4bit;


architecture Structural of Mux4to1_4bit is

begin

--SELECT STATEMENT X0 ENOCODED TO 00
	with SEL select
	Y <= X0   when "00",
		  X1   when "01",
		  X2   when "10",
		  X3 	 when "11",
		  X3 when OTHERS;

end Structural;

