----------------------------------------------------------------------------
-- Entity:        Reg_nbit
-- Written By:    Michael Stumpf
-- Date Created:  21 Sep 15
-- Description:   stores n bits 
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_library;
use mws5966_library.mws5966_Components.ALL;
------------------------------------------------------------
entity Reg_nbit is

	generic (n    : integer := 8);
		port (D    : in STD_LOGIC_VECTOR(n-1 downto 0);
				LOAD : in STD_LOGIC;
				CLK  : in STD_LOGIC;
				CLR  : in STD_LOGIC;
				Q    : out STD_LOGIC_VECTOR(n-1 downto 0));

end Reg_nbit;

architecture Behavioral of Reg_nbit is
-- no components to declare 
begin
	
	process (CLK) is 
	begin 
		if (CLK'event and CLK='1') then 
			if(CLR = '1') then 
				Q <= (others => '0');
			elsif (LOAD = '1') then
				Q <= D;
			end if;
		end if;
	end process;
	
end Behavioral;

