----------------------------------------------------------------------------
-- ENtity:        shiftReg_32bit
-- WrittEN By:    Michael Stumpf
-- Date Created:  23 Sep 15
-- Description:   syncs the input with clk
--
-- Revision History (date, initials, description):
-- 	(none)
-- DepENdENcies:
--		None
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_library;
use  mws5966_library.mws5966_Components.ALL;
--------------------------------------------------------------------
entity shiftReg_32bit is
		port   (D      : in STD_LOGIC;
				  CLK    : in STD_LOGIC;
				  CLR    : in STD_LOGIC;
				  EN     : in STD_LOGIC;
				  Q      : out STD_LOGIC_VECTOR(15 downto 0));
end shiftReg_32bit;


architecture Structural of shiftReg_32bit is

signal pulse_int: STD_LOGIC;
signal OS_int   : STD_LOGIC; 
signal DB_int   : STD_LOGIC;
signal Q_int    : STD_LOGIC_VECTOR(31 downto 0):=(others =>'0'); 

begin 
	
pulse: PulseGenerator
	generic map (n         => 4,
				    maxCount  => 10000 )
	port map    (EN  =>  '1',      
				    CLK =>	CLK,	 
				    CLR =>	CLR,	 
				    PULSE_OUT => pulse_int);
	
	DB: Debounce 
		port map (D      => EN,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_int);
				
	OS: oneShot 
	port map (D   => DB_int,
			    CLK => CLK ,
			    Q   => OS_int);
	
	DFF31: DFF_CE_CR
		port map(D   => D,
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(31));
				 
	DFF30: DFF_CE_CR
		port map( D  =>  Q_int(31),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(30));
				 
	DFF29: DFF_CE_CR
		port map( D  => Q_int(30),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(29));
					
	DFF28: DFF_CE_CR
		port map( D  => Q_int(29),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(28));
					
					
	DFF27: DFF_CE_CR
		port map( D  => Q_int(28),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(27));
					
	DFF26: DFF_CE_CR
		port map( D  => Q_int(27),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(26));
		
	DFF25: DFF_CE_CR
		port map( D  => Q_int(26),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(25));
					
	DFF24: DFF_CE_CR
		port map( D  => Q_int(25),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(24));
					
	DFF23: DFF_CE_CR
		port map( D  => Q_int(24),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(23));
					
	DFF22: DFF_CE_CR
		port map( D  => Q_int(23),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(22));
					
					
	DFF21: DFF_CE_CR
		port map( D  => Q_int(22),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(21));
					
					
	DFF20: DFF_CE_CR
		port map( D  => Q_int(21),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(20));
					
					
	DFF19: DFF_CE_CR
		port map(D   => Q_int(20),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(19));
					
					
	DFF18: DFF_CE_CR
		port map( D  => Q_int(19),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(18));

	DFF17: DFF_CE_CR
		port map( D  => Q_int(18),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(17));
					
	DFF16: DFF_CE_CR
		port map( D  => Q_int(17),
					CE  => OS_int,
					CLK => CLK, 
					CLR => CLR,
					Q   => Q_int(16));
					
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
