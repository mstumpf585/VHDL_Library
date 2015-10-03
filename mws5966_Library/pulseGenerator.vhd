
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
signal count     : integer := 0;

begin
	
	
	process (CLK) is 
	begin 
	
		if (CLK'event and CLK='1') then 
			if(CLR_int = '1') then 
				count <= 0;
			elsif (EN = '1') then
				count <= count+1; 
			end if;
		end if;
		
	end process;
		
	PULSE_int <= '1'	when (count = maxCount) else 
					 '0';	
	CLR_int   <= (pulse_int) or (CLR);
	
	PULSE_out <= pulse_int; 
	
end Behavioral;

