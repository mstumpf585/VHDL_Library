----------------------------------------------------------------------------
-- Entity:        Average_nbit
-- Written By:    Michael Stumpf 
-- Date Created:  13 sep 15
-- Description:   calculates the average of 4 numbers 
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		none 
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Average_nbit is
	generic(n : integer :=4);
	   port(A_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     B_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     C_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     D_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     avg_out : out STD_LOGIC_VECTOR (n-1 downto 0));
end Average_nbit;

architecture Structural of Average_nbit is
   -- constatns 
	constant divisor : STD_LOGIC_VECTOR (4 downto 0):= "00100";
	constant one     : STD_LOGIC_VECTOR (3 downto 0):= "0001";
	
	--internal signals 
	signal total    : STD_LOGIC_VECTOR (n downto 0);
	signal avg_calc : STD_LOGIC_VECTOR (n downto 0);
	signal int      : integer; 
	signal bigA  : STD_LOGIC_VECTOR (n downto 0);
	signal bigB  : STD_LOGIC_VECTOR (n downto 0);
	signal bigC  : STD_LOGIC_VECTOR (n downto 0);
	signal bigD  : STD_LOGIC_VECTOR (n downto 0);

	
begin
 
	bigA <= STD_LOGIC_VECTOR(resize(signed(A_avg),bigA'length));
	bigB <= STD_LOGIC_VECTOR(resize(signed(B_avg),bigA'length));
	bigC <= STD_LOGIC_VECTOR(resize(signed(C_avg),bigA'length));
	bigD <= STD_LOGIC_VECTOR(resize(signed(D_avg),bigA'length));
	-- fucked up 
	total      <=   STD_LOGIC_VECTOR (signed (bigA) + signed (bigB) + signed(bigC) + signed(bigD));
   avg_calc   <=   STD_LOGIC_VECTOR( signed(total) srl 2); 
	
	avg_out    <= STD_LOGIC_VECTOR(signed (avg_calc(n-1 downto 0)) + signed(one)) when total(1 downto 0) = "10" else
					  STD_LOGIC_VECTOR(signed (avg_calc(n-1 downto 0)) + signed(one)) when total(1 downto 0) = "11" else
					  avg_calc(n-1 downto 0); 
   
	
	
end Structural;

