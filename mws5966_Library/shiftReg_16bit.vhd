----------------------------------------------------------------------------
-- Entity:        shiftReg_16bit
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
entity shiftReg_16bit is
		port   (D      : in STD_LOGIC;
				  CLK    : in STD_LOGIC;
				  CLR    : in STD_LOGIC;
				  EN     : in STD_LOGIC;
				  Q      : out STD_LOGIC_VECTOR(15 downto 0));
end shiftReg_16bit;


architecture Behavioral of shiftReg_16bit is

signal Q_int : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0'); 

begin 
	
	process (CLK) is 
		begin
		
			if (CLK'event and CLK='1') then 
				if (EN = '1') then
					Q_int(15)  <= D;
					Q_int(14)  <= Q_int(15);
					Q_int(13)  <= Q_int(14);
					Q_int(12)  <= Q_int(13);
					Q_int(11)  <= Q_int(12);
					Q_int(10)  <= Q_int(11);
					Q_int(9)   <= Q_int(10);
					Q_int(8)   <= Q_int(9);
					Q_int(7)   <= Q_int(8);
					Q_int(6)   <= Q_int(7);
					Q_int(5)   <= Q_int(6);
					Q_int(4)   <= Q_int(5);
					Q_int(3)   <= Q_int(4);
					Q_int(2)   <= Q_int(3);
					Q_int(1)   <= Q_int(2);
					Q_int(0)   <= Q_int(1);
				 elsif(CLR = '1') then 
					Q_int <= (others => '0');
				 end if;
			end if;
		end process;
		Q <= Q_int; 
end Behavioral;
