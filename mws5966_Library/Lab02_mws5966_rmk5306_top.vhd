----------------------------------------------------------------------------
-- Entity:        Lab02_mws5966_rmk5306_top
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  9/3/2015
-- Description: Takes in ouput from Top_Level_Add_Sub and displays its inputs or outputs
--					 based off of whihc push buttons the user hits. 
--
-- Revision History (date, initials, description):
-- 
-- Dependencies: FullAdder, RCA, Mux4to1bit, HexToSevenSeg, Top_Level_Add_Sub
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab02_mws5966_rmk5306_top is

	port ( A_top    			: in  STD_LOGIC_VECTOR (3 downto 0);
			 B_top       		: in  STD_LOGIC_VECTOR (3 downto 0);
			 BTNU	    			: in  STD_LOGIC; 
			 BTNC    			: in  STD_LOGIC;
			 BTND    			: in  STD_LOGIC; 
			 SUM_TOP				: out STD_LOGIC_VECTOR (3 downto 0); 
			 SEGMENT_top		: out STD_LOGIC_VECTOR (0 to 6);
			 ANODE				: out STD_LOGIC_VECTOR (7 downto 0); 
			 OVERFLOW_top		: out STD_LOGIC);
			 
end Lab02_mws5966_rmk5306_top;

architecture Structural of Lab02_mws5966_rmk5306_top is

	--COMPONENTs
		component Top_Level_Add_Sub
		
			port(A 			: in  STD_LOGIC_VECTOR(3 downto 0);
				  B			: in  STD_LOGIC_VECTOR(3 downto 0);
				  SUBTRACT  : in  STD_LOGIC;
              SUM  		: out STD_LOGIC_VECTOR(3 downto 0);
              OVERFLOW  : out  STD_LOGIC);
			  
		end component;
		
		component Mux4to1_4bit
		
			port (X0 	: in  STD_LOGIC_VECTOR (3 downto 0);
					X1		: in  STD_LOGIC_VECTOR (3 downto 0);
					X2   	: in  STD_LOGIC_VECTOR (3 downto 0);
					X3   	: in  STD_LOGIC_VECTOR (3 downto 0);
					SEL  	: in  STD_LOGIC_VECTOR (1 downto 0);
					Y		: out STD_LOGIC_VECTOR (3 downto 0));
			
		end component;
		
		component HexToSevenSeg
			
			port(HEX 		: in   STD_LOGIC_VECTOR (3 downto 0);
				  SEGMENT   : out  STD_LOGIC_VECTOR (0 TO 6));
			
		end component; 
		
		-- Internal signals (wires)
		signal SEL_TOP : STD_LOGIC_VECTOR(1 downto 0);
		signal sum_wire: STD_LOGIC_VECTOR(3 downto 0);
		signal output  : STD_LOGIC_VECTOR(3 downto 0);
				
begin
	
	--Wire assignments 
	--Turns on far left anode 
	ANODE <= "11111110";
	
	--select input for 4:1 mux 
	SEL_TOP <= "00"		when (BTNU = '1') else 
				  "01"		when (BTNC = '1') else 
			     "10" 		when (BTND = '1') else 
			     "11";
	--Output to top level 			  
	SUM_TOP <= sum_wire;	    
				
	
   --Port Maps 
	TAS: Top_Level_Add_Sub port map(
			A => A_top,
			B => B_top,
			SUBTRACT => BTND,
			SUM => sum_wire,
			OVERFLOW => OVERFLOW_top);
			
	MUX: Mux4to1_4bit port map(
			X0  => A_top,
			X1  => B_top,
			X2  => sum_wire,
			X3  => sum_wire,
			SEL => SEL_TOP,
			Y   => OUTPUT);
			
	HEX: HexToSevenSeg port map(
			HEX => OUTPUT,
			SEGMENT => SEGMENT_top
			);
			
end Structural;

