----------------------------------------------------------------------------
-- Entity:        Mux_4to1_tb
-- Written By:    Michael Stumpf and Ryan kelley
-- Date Created:  9/04/2015
-- Description:   Determines weather or not to subtract based of the input of the subtraction
-- 					signal. If the signal is high than the circuit will invert B(0...3)
--
-- Revision History (date, initials, description):
-- 
-- Dependencies:
--		MUX_4to1_nbit
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX_tb IS
END MUX_tb;
 
ARCHITECTURE behavior OF MUX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux4to1_4bit
    PORT(
         X0 : IN  std_logic_vector(3 downto 0);
         X1 : IN  std_logic_vector(3 downto 0);
         X2 : IN  std_logic_vector(3 downto 0);
         X3 : IN  std_logic_vector(3 downto 0);
         SEL : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X0 : std_logic_vector(3 downto 0) := (others => '0');
   signal X1 : std_logic_vector(3 downto 0) := (others => '0');
   signal X2 : std_logic_vector(3 downto 0) := (others => '0');
   signal X3 : std_logic_vector(3 downto 0) := (others => '0');
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux4to1_4bit PORT MAP (
          X0 => X0,
          X1 => X1,
          X2 => X2,
          X3 => X3,
          SEL => SEL,
          Y => Y
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
     wait for 100 ns;
		
		--random test cases 
		
		-- SEL 00
		X3 <= "0000"; X2 <= "0101"; X1 <= "0110"; X0 <= "1010"; SEL <= "00";
		wait for 100 ns;
		assert (Y = "1010") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		-- SEL 01
		X3 <= "0000"; X2 <= "0101"; X1 <= "0110"; X0 <= "1010"; SEL <= "01";
		wait for 100 ns;
		assert (Y = "0110") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		-- SEL 10
		X3 <= "0000"; X2 <= "0101"; X1 <= "0110"; X0 <= "1010"; SEL <= "10";
		wait for 100 ns;
		assert (Y = "0101") 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
		-- SEL 11
		X3 <= "0000"; X2 <= "0101"; X1 <= "0110"; X0 <= "1010"; SEL <= "11";
		wait for 100 ns;
		assert (Y = "0000"); 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;

      wait;
   end process;

END;