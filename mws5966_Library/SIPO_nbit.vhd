
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO_nbit is
	port   (D      : in STD_LOGIC;
			  CLK    : in STD_LOGIC;
			  CLR    : in STD_LOGIC;
			  Rshift : in STD_LOGIC;
			  Lshift : in STD_LOGIC; 
			  Q      : out STD_LOGIC_VECTOR(n-1 downto 0));
end SIPO_nbit;

architecture Behavioral of SIPO_nbit is

signal Q_int : STD_LOGIC_VECTOR(n-1 downto 0); 

begin
 -- registers 
	-- shift reg 
	process (CLK) is 
		begin
			if (CLK'event and CLK='1') then 
				if (RSHIFT = '1') then
					 Q_int <= D & Q_int(n-1 downto 1);
					 
				elsif (LSHIFT = '1') then
					  Q_int <= Q_int(n-1 downto 1) & D;
				 end if;
			end if;
		end process;
end Behavioral;

