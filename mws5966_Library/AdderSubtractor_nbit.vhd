----------------------------------------------------------------------------
-- Entity:        AdderSubtractor
-- Written By:    Michael Stumpf 
-- Date Created:  9/10/2015
-- Description:   if A is greater than B ENQ == 1 
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		RCA_nbit, FullAdder
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_Library;
use mws5966_Library.mws5966_Components.ALL;

entity AdderSubtractor_nbit is
	 generic(N: integer :=4);
    Port   (A 			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
            B			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
            SUBTRACT   : in  STD_LOGIC;
            SUM  		  : out STD_LOGIC_VECTOR(n-1 downto 0);
            OVERFLOW   : out  STD_LOGIC);
end AdderSubtractor_nbit;

architecture Structural of AdderSubtractor_nbit is

		
		--Components 
		 -- used mws5966_library
		-- Internal signals (wires) for Invert or Pass
		signal BXOR : STD_LOGIC_VECTOR (n-1 downto 0);
		
		-- Internal signals (wires) for Invert or Pass
		signal SUM_int : STD_LOGIC_Vector(n-1 downto 0);
		
		
begin


		--Logic for Invert or Pass (0...3)
		BXOR(3) <= B(3) xor SUBTRACT;
		BXOR(2) <= B(2) xor SUBTRACT;
		BXOR(1) <= B(1) xor SUBTRACT;
		BXOR(0) <= B(0) xor SUBTRACT;
		
		RCA: RCA_nbit 
			  generic map(N => N) 
			  port map	 (A	  => A,	
							  B	  => BXOR,	
							  c_in  => SUBTRACT,
							  c_out => open, 
							  SUM	  => SUM_int);

		
		
		--Logic for OVERFLOW
		OVERFLOW <= (SUBTRACT and ((A(3) and (not B(3)) and (not SUM_int(3))) or ((not A(3)) and B(3) and SUM_int(3)))) or ((not SUBTRACT) and (((not A(3)) and (not B(3)) and SUM_int(3)) or (A(3) and B(3) and not(SUM_int(3)))));
		
		--set SUM(3..0) == SUM_int (3..0) to output
		SUM<=SUM_int;
		
end Structural;

