
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
				Q    : out STD_LOGIC_VECTOR(n-1 downto 0) := (OTHERS => '0'));

end Reg_nbit;

architecture Behavioral of Reg_nbit is
-- no components to declare 
begin
	
	genDFF: for i in 0 to n-1 generate 
		begin
		
			DFFx: DFF_CE_CR port map(
					D    => D(i),
					CE => LOAD,
					CLK  => CLK,
					CLR  => CLR,
					Q    => Q(i));
					
		end generate genDFF;
end Behavioral;

