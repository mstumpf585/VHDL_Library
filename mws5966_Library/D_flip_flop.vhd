----------------------------------------------------------------------------
-- Entity:        D_flip_flop
-- Written By:    Michael Stumpf
-- Date Created:  16 Sep 15
-- Description:   DFF 
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------
entity D_flip_flop is

	port ( D   : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 Q   : out STD_LOGIC:= '0');
			 
end D_flip_flop;

architecture Behavioral of D_flip_flop is

-- no signals to declare
 
begin

	process(CLK) is 
	begin
		if (CLK'event and CLK='1') then 
			Q<= D; 
		end if;
	end process;
	
end Behavioral;

