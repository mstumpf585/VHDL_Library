
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library mws5966_library;
use mws5966_library.mws5966_Components.ALL;

entity pulseGenerator is
	generic (n         : integer := 4;
				maxCount  : natural := 9); 
	port    (EN        :  in  STD_LOGIC;
				CLK 		 :  in  STD_LOGIC;
				CLR 		 :  in   STD_LOGIC;
				PULSE_OUT : out STD_LOGIC);
end pulseGenerator;

architecture Behavioral of pulseGenerator is
 
signal PULSE_INT : STD_LOGIC;
signal CLR_int   : STD_LOGIC;
signal count     : STD_LOGIC_VECTOR ( n -1 downto 0);

begin
	
	counter: Counter_nbit
	   generic map ( n => n)
		port map
			(EN   => EN,
			 CLK  => CLK, 
			 CLR  => CLR_int, 
			 Q    => count); 
		
	PULSE_INT <= '1'	when (to_integer (unsigned(count(n-1 downto 0))) = maxCount) else 
					 '0';
	PULSE_OUT <= PULSE_INT; 	
	CLR_int   <= (pulse_int) or (CLR);
end Behavioral;

