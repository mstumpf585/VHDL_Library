----------------------------------------------------------------------------
-- Entity:        DFF_CE_CR
-- Written By:    Michael Stumpf
-- Date Created:  16 Sep 15
-- Description:   DFF with clock, En, and clear  
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
-----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DFF_CE_CR is

	port ( D   : in STD_LOGIC;
			 CE  : in STD_LOGIC;
          CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
          Q   : out STD_LOGIC:= '0');
			 
end DFF_CE_CR;

architecture Behavioral of DFF_CE_CR is

begin

	process(CLK,CLR) is 
	begin 
		if (CLR = '1') then 
			Q <= '0';
		elsif(CLK'event and CLK='1') then 
			if(CE = '1') then
				Q <= D;
			end if;
		end if;
	end process; 

end Behavioral;

