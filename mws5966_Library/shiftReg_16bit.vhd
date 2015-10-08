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

signal pulse_int: STD_LOGIC;
signal OS_int   : STD_LOGIC; 
signal DB_int   : STD_LOGIC;
signal Q_int    : STD_LOGIC_VECTOR(31 downto 0):=(others =>'0'); 

begin 

pulse: PulseGenerator
	generic map (n         => 4,
				 maxCount  => 10000 );	
	
	DFF15: DFF_CE_CR
		port map( D  => Q_int(16),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(15));
					
	DFF14: DFF_CE_CR
		port map( D  => Q_int(15),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(14));
					
	DFF13: DFF_CE_CR
		port map( D  => Q_int(14),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(13));
					
	DFF12: DFF_CE_CR
		port map( D  => Q_int(13),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(12));
					
	DFF11: DFF_CE_CR
		port map( D  => Q_int(12),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(11));
					
	DFF10: DFF_CE_CR
		port map( D  => Q_int(11),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(10));
					
	DFF9: DFF_CE_CR
		port map( D  => Q_int(10),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(9));
					
	DFF8: DFF_CE_CR
		port map( D  => Q_int(9),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(8));
					
	DFF7: DFF_CE_CR
		port map( D  => Q_int(8),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(7));
					
	DFF6: DFF_CE_CR
		port map( D  => Q_int(7),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(6));
					
	DFF5: DFF_CE_CR
		port map( D  => Q_int(6),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(5));
					
	DFF4: DFF_CE_CR
		port map( D  => Q_int(5),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(4));
					
	DFF3: DFF_CE_CR
		port map( D  => Q_int(4),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(3));
					
	DFF2: DFF_CE_CR
		port map( D  => Q_int(3),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(2));
					
	DFF1: DFF_CE_CR
		port map( D  => Q_int(2),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(1));
					
	DFF0: DFF_CE_CR
		port map(D   => Q_int(1),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(0));
				
	Q(15 downto 0) <= Q_int(31 downto 16); 
end Structural;
		
			

