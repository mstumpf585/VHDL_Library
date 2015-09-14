----------------------------------------------------------------------------
-- Entity:        CompareLES
-- Written By:    Michael Stumpf
-- Date Created:  11 Sep 15
-- Description:   compares two n bit  unsigned numbers to see which is less
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		AdderSubtractor
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------
entity CompareLES is
	 generic( N : integer:=4); 
    Port   ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
				 B : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  LES : OUT  STD_LOGIC);
end CompareLES;

architecture Behavioral of CompareLES is

begin

LES <= '1' when (A<B)
			  else '0';

end Behavioral;

