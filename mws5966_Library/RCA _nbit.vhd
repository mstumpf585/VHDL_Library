----------------------------------------------------------------------------
-- Entity:        RCA_nbit
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  8/26/2015
-- Description:   Determines weather or not to subtract based of the input of the subtraction
-- 					signal. If the signal is high than the circuit will invert B(0...3)
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		FullAdder
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_nbit is
	 generic(n: integer :=8);
    Port   ( A		: in STD_LOGIC_VECTOR(n-1 downto 0);
				 B		: in STD_LOGIC_VECTOR(n-1 downto 0);
			    c_in	: in STD_LOGIC;
			    c_out	: out STD_LOGIC;
			    SUM		: out STD_LOGIC_VECTOR(n-1 downto 0));
end RCA_nbit;


architecture Structural of RCA_nbit is
		
		component FullAdder
		port(A 		: in  STD_LOGIC;
           B 		: in  STD_LOGIC;
           C_in 	: in  STD_LOGIC;
           C_out 	: out  STD_LOGIC;
           SUM 	: out  STD_LOGIC);
		end component;

		signal Carry: STD_LOGIC_VECTOR(n downto 0);
		
begin
		-- signal assignments 
		Carry(0)  <= C_in;
		C_out 	 <= carry(n);
		
		genFullAdder: for i in 0 to n-1 generate 
			begin	
				FAX: FullAdder port map(
					  A 	  => A(i),
					  B 	  => B(i),
					  C_in  => carry(i),
					  C_out => carry(i+1),
					  SUM   => SUM(i));
					  
			end generate genFullAdder;
end Structural;

