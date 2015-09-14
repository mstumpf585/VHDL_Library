----------------------------------------------------------------------------
-- Entity:        MAX_nbit
-- Written By:    Michael Stumpf
-- Date Created:  11 Sep 15
-- Description:   compares four nbit unsigned numbers to see which is bigger
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		CompareGTR
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library mws5966_library;
use mws5966_library.mws5966_Components.AlL;
----------------------------------------------------------------------------
entity MAX_nbit is
	 generic(n: integer :=4);
    Port   ( A_top 	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 B_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 C_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 D_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
			    MAX_OUT	: out STD_LOGIC_VECTOR(n-1 downto 0));
end MAX_nbit;


architecture Structural of MAX_nbit is
		
	signal SEL2: STD_LOGIC;
	signal SEL1: STD_LOGIC;
	signal SEL0: STD_LOGIC;
	signal mux_out2: STD_LOGIC_VECTOR (n-1 downto 0);
	signal mux_out1: STD_LOGIC_VECTOR (n-1 downto 0);
	signal mux_out0: STD_LOGIC_VECTOR (n-1 downto 0);
	
	
begin
		-- signal assignments 
		
		
	GTR2: CompareGRT
		generic map(N => N) 
		port map	  (A	   => A_top,	
					   B	   => B_top,	
					   GRT  => SEL2);
					  
	mux_out2 <= A_top when SEL2 = '1'
							else B_top;
	GTR1: CompareGRT
		generic map (N => N) 
		port map	   (A	    => C_top,	
					    B	    => mux_out2,	
					    GRT   => SEL1);
					  
	mux_out1 <= C_top when SEL1 = '1'
							else mux_out2;				  
					  
	GTR0: CompareGRT
		generic map(N => N) 
		port map	  (A	   => D_top,	
					   B	   => mux_out1,	
					   GRT   => SEL0);
						
	mux_out0 <= D_top when SEL0 = '1'
							else mux_out1;	
							
	MAX_OUT <= mux_out0;
end Structural;



