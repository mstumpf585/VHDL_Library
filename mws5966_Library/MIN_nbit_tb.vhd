----------------------------------------------------------------------------
-- Entity:        MIN_nbit_tb
-- Written By:    Michael Stumpf
-- Date Created:  13 Sep 15
-- Description:   VHDL test bench MIN_nbit
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--		MAX_nbit, CompareLES
----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------------------------- 
ENTITY MIN_nbit_tb IS
END MIN_nbit_tb;
 
ARCHITECTURE Structural OF MIN_nbit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIN_nbit
	 generic (n : integer:=4);
    PORT(
         A_top : IN  std_logic_vector(3 downto 0);
         B_top : IN  std_logic_vector(3 downto 0);
         C_top : IN  std_logic_vector(3 downto 0);
         D_top : IN  std_logic_vector(3 downto 0);
         MIN_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_int : std_logic_vector(3 downto 0) := (others => '0');
   signal B_int : std_logic_vector(3 downto 0) := (others => '0');
   signal C_int : std_logic_vector(3 downto 0) := (others => '0');
   signal D_int : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal MIN_int : std_logic_vector(3 downto 0);
 

  
 
-- Test vector includes input stimuli and expected outputs
	-- inputs:
   -- A_top    in : bits 19..16
   -- B_top    in : bits 15..12
	-- C_top    in : bits 11..8
	-- D_top    in : bits 7..4
	-- outputs:
	-- MIN_out  out: bits 5..2
	--
	-- test vector is HEX & SEGMENT
   type test_vector_type is array (0 to 15) of STD_LOGIC_VECTOR (19 downto 0);
   constant test_vector : test_vector_type := (
     -- A_top  B_top    C_top    D_top     MIN_out
	  --19  -------------------------------->  0 	 
      "0000" & "0000" & "0000" & "0000"  & "0000",
      "0001" & "1001" & "1010" & "0110" &  "0001", -- 
      "0010" & "1100" & "1110" & "0010" &  "0010", -- 
		"0010" & "0011" & "0101" & "0011" &  "0010", -- 
      "1110" & "1110" & "1100" & "1111" &  "1100", -- 
      "0110" & "1011" & "0001" & "0100" &  "0001", -- 
      "1100" & "1100" & "1000" & "0111" &  "0111", -- 
      "1000" & "1000" & "0000" & "1010" &  "0000", --  
      "0000" & "0000" & "0000" & "1110" &  "0000", -- 
      "0101" & "0100" & "0001" & "0100" &  "0001", -- 
      "0110" & "0111" & "1111" & "1111" &  "0110", -- 
      "0111" & "0111" & "0000" & "0000" &  "0000", -- 
      "1111" & "1011" & "0100" & "1011" &  "0100", -- 
      "1101" & "1001" & "0000" & "0111" &  "0000", -- 
      "1110" & "1101" & "0001" & "0011" &  "0001", -- 
      "0101" & "0011" & "0010" & "1000" &  "0010"  --  
		);
 
begin

	-- Instantiate the Unit Under Test (UUT)
	--temp must delete 
	MIN: MIN_nbit 
			  generic map(N => 4) 
			  port map	 ( A_top 	   => A_int,
								B_top		   =>	B_int, 
								C_top       => C_int,  
								D_top 		=> D_int,
								MIN_out     => MIN_int);

   -- Stimulus process
   stim_proc: process
   begin

      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		-- run through all test vectors
      for i in test_vector'Range loop
      
         -- Assign test inputs
         A_int <= test_vector(i)(19 downto 16);
         B_int <= test_vector(i)(15 downto 12);
			C_int <= test_vector(i)(11 downto  8);
			D_int <= test_vector(i)(7  downto  4);  
			
         -- Compare outputs to expected values
         wait for 2ns;
         assert (MIN_int = test_vector(i)(3 downto 0))
            report "***** Test failed. *****"
            severity failure;
				
      end loop;
      
      -- All tests are successful if we get this far
      report "***** All tests completed successfully. *****";
      wait;
   end process;

end Structural;
