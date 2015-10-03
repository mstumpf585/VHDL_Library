----------------------------------------------------------------------------
-- Entity:        Debouncer
-- Written By:    Michael Stumpf
-- Date Created:  23 Sep 15
-- Description:   syncs the input with clk
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_library;
use  mws5966_library.mws5966_Components.ALL;
--------------------------------------------------------------------
entity Debounce is
		port (D      : in STD_LOGIC;
				SAMPLE : in STD_LOGIC;
				CLK    : in STD_LOGIC;
				Q      : out STD_LOGIC);
end Debounce;


architecture Behavioral of Debounce is

signal Q_int : STD_LOGIC_VECTOR(2 downto 0); 

begin

	process (CLK,Q_int) is 
		begin
		
			if (CLK'event and CLK='1') then 
				if (SAMPLE = '1') then
					Q_int(0) <= D;
					Q_int(1) <= Q_int(0);
					Q_int(2) <= Q_int(1);
				 end if;
			end if;
			
			Q <=  Q_int(1) and Q_int(2);
		end process;
		
end Behavioral;

