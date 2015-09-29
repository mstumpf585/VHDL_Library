----------------------------------------------------------------------------
-- Entity:        Decoder 3 to 8 
-- Written By:    E. George Walters
-- Date Created:  2 Sep 14
-- Description:   VHDL test bench for HexToSevenSeg
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		HexToSevenSeg
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL; 
--------------------------------------------------------------------------------
entity Decoder3to8_tb is
end    Decoder3to8_tb;
--------------------------------------------------------------------------------
 
architecture Behavioral of Decoder3to8_tb is 
 
	-- Unit Under Test (UUT)
   component Decoder3to8 is
		port ( X  : in STD_LOGIC_VECTOR (2 downto 0);
				 EN :in STD_LOGIC;
		       Y  : out STD_LOGIC_VECTOR (7 downto 0));
   end component;
    
   --Inputs
   signal X_int  : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
	signal EN_int : STD_LOGIC;
 	--Outputs
   signal Y_int  : STD_LOGIC_VECTOR (7 downto 0);
   
   -- Test vector includes input stimuli and expected outputs
   -- HEX      : bits 10..7
   -- SEGMENT : bits 6..0
	-- test vector is HEX & SEGMENT
   type test_vector_type is array (0 to 15) of STD_LOGIC_VECTOR (11 downto 0);
   constant test_vector : test_vector_type := (
   --last three Anode 
	--  11------------------>0
      "000" & "00000001" & "1", -- anode  0
      "001" & "00000010" & "1", -- anode  1
      "010" & "00000100" & "1", -- anode  2
      "011" & "00001000" & "1", -- anode  3
      "100" & "00010000" & "1", -- anode  4
      "101" & "00100000" & "1", -- anode  5
      "110" & "01000000" & "1", -- anode  6
      "111" & "10000000" & "1", -- anode  7
		"000" & "00000000" & "0", -- all 0 from here down
      "001" & "00000000" & "0", 
      "010" & "00000000" & "0", 
      "011" & "00000000" & "0", 
      "100" & "00000000" & "0", 
      "101" & "00000000" & "0", 
      "110" & "00000000" & "0", 
      "111" & "00000000" & "0"
		);
 
begin

	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder3to8 port map (
		     X   => X_int,
			  EN  => EN_int,
			  Y   => y_int);

   -- Stimulus process
   stim_proc: process
   begin

      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		-- run through all test vectors
      for i in test_vector'Range loop
      
         -- Assign test inputs
         X_int <= test_vector(i)(11 downto 9);
			EN_int <= test_vector(i)(0);
         
         -- Compare outputs to expected values
         wait for 2ns;
         assert (Y_int = test_vector(i) (8 downto 1))
            report "***** Test failed. *****"
            severity Failure;
      end loop;
      
      -- All tests are successful if we get this far
      report "***** All tests completed successfully. *****";
      wait;
   end process;

end Behavioral;
