----------------------------------------------------------------------------
-- Entity:        AdderSubtractor_tb
-- Written By:    Michael Stumpf
-- Date Created:  9 Sep 14
-- Description:   VHDL test bench AdderSubtractor
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		AdderSubtractor
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL; 

library mws5966_Library;
use mws5966_Library.mws5966_Components.ALL;
--------------------------------------------------------------------------------
entity AdderSubtractor_tb is
end    AdderSubtractor_tb;
--------------------------------------------------------------------------------
 
architecture Behavioral of AdderSubtractor_tb is 
 
	-- Unit Under Test (UUT)
   component AdderSubtractor_nbit is
		generic(n: integer := 4);
		port 	 ( A 			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
					B			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
					SUBTRACT   : in  STD_LOGIC;
					SUM  		  : out STD_LOGIC_VECTOR(n-1 downto 0);
					OVERFLOW   : out  STD_LOGIC);
   end component;
    
   --Inputs
   signal A_int 		  : STD_LOGIC_VECTOR (3 downto 0);
	signal B_int 		  : STD_LOGIC_VECTOR (3 downto 0);
	signal SUBTRACT_int : STD_LOGIC;

 	--Outputs
	signal OVERFLOW_int  : STD_LOGIC;
   signal SUM_int     	: STD_LOGIC_VECTOR (3 downto 0);
	
   -- Test vector includes input stimuli and expected outputs
	-- inputs:
   -- A        in : bits 13..10
   -- B        in : bits 9..6
	
	-- outputs:
	-- SUM  out: bits 5..2
	--
	-- test vector is HEX & SEGMENT
   type test_vector_type is array (0 to 15) of STD_LOGIC_VECTOR (13 downto 0);
   constant test_vector : test_vector_type := (
     -- A        B       SUM		  overflow -> subtract
	  --13 ---------------------->  0 	 
      "0000" & "0000" & "0000" & "00", -- add  0 +  0
      "0001" & "1001" & "1010" & "00", -- add  1 + -7
      "0010" & "1100" & "1110" & "00", -- add  2 + -4
		"0010" & "0011" & "0101" & "00", -- add  2 +  3
      "1110" & "1110" & "1100" & "00", -- add -2 + -2
      "0110" & "1011" & "0001" & "00", -- add  6 + -5
      "1100" & "1100" & "1000" & "00", -- add -4 + -4
      "1000" & "1000" & "0000" & "10", -- add -8 + -8 overflow 
      "0000" & "0000" & "0000" & "01", -- sub  0 -  0
      "0101" & "0100" & "0001" & "01", -- sub  5 -  4 
      "0110" & "0111" & "1111" & "01", -- sub  6 -  7 
      "0111" & "0111" & "0000" & "01", -- sub  7 -  7
      "1111" & "1011" & "0100" & "01", -- sub -1 - -5
      "1101" & "1101" & "0000" & "01", -- sub -3 - -3 
      "1110" & "1101" & "0001" & "01", -- sub -2 -  3
      "0101" & "0011" & "0010" & "01" --  sub  5 -  3 
		);
 
begin

	-- Instantiate the Unit Under Test (UUT)
	--temp must delete 
	ASX: AdderSubtractor_nbit 
			  generic map(N => 4) 
			  port map	 ( A 		   => A_int,
								B		   =>	B_int, 
								SUBTRACT => SUBTRACT_int,  
								SUM  		=> SUM_int,
								OVERFLOW => OVERFLOW_int);

   -- Stimulus process
   stim_proc: process
   begin

      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		-- run through all test vectors
      for i in test_vector'Range loop
      
         -- Assign test inputs
         A_int <= test_vector(i)(13 downto 10);
         B_int <= test_vector(i)(9 downto 6);
			SUBTRACT_int <= test_vector(i)(0); 
			
         -- Compare outputs to expected values
         wait for 2ns;
         assert (SUM_int = test_vector(i)(5 downto 2) and OVERFLOW_int = test_vector(i)(1))
            report "***** Test failed. *****"
            severity failure;
				
      end loop;
      
      -- All tests are successful if we get this far
      report "***** All tests completed successfully. *****";
      wait;
   end process;

end Behavioral;
