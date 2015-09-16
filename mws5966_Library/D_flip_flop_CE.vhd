----------------------------------------------------------------------------
-- Entity:        D_flip_flop_CE
-- Written By:    Michael Stumpf
-- Date Created:  16 Sep 15
-- Description:   DFF with clock in 
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_flip_flop_CE is

	port ( D   : in STD_LOGIC;
		    CE  : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 Q   : out STD_LOGIC:= '0');
end D_flip_flop_CE;

-- no components to declare 

architecture Behavioral of D_flip_flop_CE is

begin

	process (CLK)
	begin 
		if (CLK'event and CLK = '1') then 
			if (CE = '1') then 
				Q <= D;
			end if; 
		end if; 
	 end process; 
	 
end Behavioral;

