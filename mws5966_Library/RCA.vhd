----------------------------------------------------------------------------
-- Entity:        RCA
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  8/26/2015
-- Description:   Determines weather or not to subtract based of the input of the subtraction
-- 					signal. If the signal is high than the circuit will invert B(0...3)
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		FullAdder
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
    Port ( C_in : in  STD_LOGIC;
           A3 		: in  STD_LOGIC;
           A2 		: in  STD_LOGIC;
           A1 		: in  STD_LOGIC;
           A0 		: in  STD_LOGIC;
           B3 		: in  STD_LOGIC;
           B2 		: in  STD_LOGIC;
           B1 		: in  STD_LOGIC;
           B0 		: in  STD_LOGIC;
           SUM3 	: out  STD_LOGIC;
           SUM2 	: out  STD_LOGIC;
           SUM1 	: out  STD_LOGIC;
           SUM0 	: out  STD_LOGIC;
           C_out  : out  STD_LOGIC);
end RCA;


architecture Structural of RCA is
		
		component FullAdder
		port(A 		: in  STD_LOGIC;
           B 		: in  STD_LOGIC;
           C_in 	: in  STD_LOGIC;
           C_out 	: out  STD_LOGIC;
           SUM 	: out  STD_LOGIC);
end component;

		-- Internal signals (wires)
		signal carry0 : STD_LOGIC;
		signal carry1 : STD_LOGIC;
		signal carry2 : STD_LOGIC;
begin
		--4 FUllAdders
		FA0: FullAdder port map(
				A=>A0,
				B=>B0,
				C_in=>C_in,
				C_out=>carry0,
				SUM=>SUM0
				);
				
		FA1: FullAdder port map(
				A=>A1,
				B=>B1,
				C_in=> carry0,
				C_out=>carry1,
				SUM=>SUM1
				);
				
				
		FA2: FullAdder port map(
				A=>A2,
				B=>B2,
				C_in=>carry1,
				C_out=>carry2,
				SUM=>SUM2
				);
				
				
		FA3: FullAdder port map(
				A=>A3,
				B=>B3,
				C_in=>carry2,
				C_out=>C_out,
				SUM=>SUM3
				);
				
end Structural;

