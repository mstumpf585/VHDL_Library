----------------------------------------------------------------------------
-- Entity:        oneShot
-- Written By:    Michael Stumpf
-- Date Created:  11 Sep 15
-- Description:   makes it so when you push the button its high for one clock cycle 
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		CompareGTR
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_library;
use mws5966_library.mws5966_Components.ALL;
-----------------------------------------------------------------------------
entity oneShot is
	port (D   : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Q   : out STD_LOGIC);
end OneShot;


architecture Structural of oneShot is

signal Q_int: STD_LOGIC;

begin
-- need to bring in the debounce 
DFF: D_flip_flop port map

	(D   => D,
	 CLK => CLK,
	 Q   => Q_int);
Q <= ((Not Q_int) and D); 

end Structural;

