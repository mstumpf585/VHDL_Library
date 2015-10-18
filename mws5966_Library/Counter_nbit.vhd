----------------------------------------------------------------------------
-- Entity:        Counter_nbit
-- Written By:    Michael Stumpf
-- Date Created:  22 Sep 15
-- Description:   counts up when EN = 1 
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-----------------------------------------------------------------------------
entity Counter_nbit is
generic (n   : integer := 8);

	port (EN  : in STD_LOGIC;
			CLK : in STD_LOGIC;
			CLR : in STD_LOGIC;
			Q   : out STD_LOGIC_VECTOR (n-1 downto 0));
			
end Counter_nbit;

architecture Behavioral of Counter_nbit is

signal   count : STD_LOGIC_VECTOR (n-1 downto 0):= (others => '0') ;
--signal   count : integer := 0 ;
														
begin

	process (CLK) is 
	begin 
	
		if (CLK'event and CLK='1') then 
			if(CLR = '1') then 
				count <= (others => '0');
	
			elsif (EN = '1') then
				count <= STD_LOGIC_VECTOR(unsigned(count)+1); 
				
			end if;
		end if;
		
	end process;
	--Q <= STD_LOGIC_VECTOR(to_unsigned((count),Q'length)); 
	Q <= count; 
end Behavioral;

