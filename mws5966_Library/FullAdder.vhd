----------------------------------------------------------------------------
-- Entity:        FullAdder
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  8/26/2015
-- Description:   basic adder
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:	none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( A 		: in  STD_LOGIC;
           B 		: in  STD_LOGIC;
           C_in 	: in  STD_LOGIC;
           C_out 	: out  STD_LOGIC;
           SUM 	: out  STD_LOGIC);
end FullAdder;

architecture Structural of FullAdder is

		-- Internal signals (wires)
		signal wire1 : STD_LOGIC;
		signal wire2 : STD_LOGIC;
		signal wire3 : STD_LOGIC;
		
begin

		--Logic for internal signals (wires)
		wire1 <= A and B;
		wire2 <= A xor B;
		wire3 <= (A xor B) and C_in;
		
		--Logic for SUM 
		SUM <= wire2 xor C_in;
		C_out <= wire1 or wire3; 

end Structural;

