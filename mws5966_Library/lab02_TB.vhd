----------------------------------------------------------------------------
-- Entity:        Lab02_tb
-- Written By:    E. George Walters
-- Date Created:  2 Sep 14
-- Description:   VHDL test bench for HexToSevenSeg
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:FullAdder, RCA, Mux4to1bit, HexToSevenSeg, Top_Level_Add_Sub
--		
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Lab02_top_tb IS
END Lab02_top_tb;
 
ARCHITECTURE behavior OF Lab02_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab02_mws5966_rmk5306_top
    PORT(
         A_top : IN  std_logic_vector(3 downto 0);
         B_top : IN  std_logic_vector(3 downto 0);
         BTNU : IN  std_logic;
         BTNC : IN  std_logic;
         BTND : IN  std_logic;
         SUM_TOP : OUT  std_logic_vector(3 downto 0);
         SEGMENT_top : OUT  std_logic_vector(0 to 6);
         ANODE : OUT  std_logic_vector(7 downto 0);
         OVERFLOW_top : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_top : std_logic_vector(3 downto 0) := (others => '0');
   signal B_top : std_logic_vector(3 downto 0) := (others => '0');
   signal BTNU : std_logic := '0';
   signal BTNC : std_logic := '0';
   signal BTND : std_logic := '0';

 	--Outputs
   signal SUM_TOP : std_logic_vector(3 downto 0);
   signal SEGMENT_top : std_logic_vector(0 to 6);
   signal ANODE : std_logic_vector(7 downto 0);
   signal OVERFLOW_top : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab02_mws5966_rmk5306_top PORT MAP (
          A_top => A_top,
          B_top => B_top,
          BTNU => BTNU,
          BTNC => BTNC,
          BTND => BTND,
          SUM_TOP => SUM_TOP,
          SEGMENT_top => SEGMENT_top,
          ANODE => ANODE,
          OVERFLOW_top => OVERFLOW_top
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
	-- Switches of -7 + 1	
		-- -7 + 1 add
		A_top <= "1001"; B_top <= "0001"; BTNU <= '0'; BTNC <= '0'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1010" and SEGMENT_top = "0001000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: --7+1 add" 
			severity failure;
			
		-- -7 + 1 show a
		A_top <= "1001"; B_top <= "0001"; BTNU <= '1'; BTNC <= '0'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1010" and SEGMENT_top = "0000100" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: -7+1 show a" 
			severity failure;
		
		-- -7 + 1 show b
		A_top <= "1001"; B_top <= "0001"; BTNU <= '0'; BTNC <= '1'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1010" and SEGMENT_top = "1001111" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 9+1 show b" 
			severity failure;
			
		-- -7 + 1 subtract
		A_top <= "1001"; B_top <= "0001"; BTNU <= '0'; BTNC <= '0'; BTND <= '1';
		wait for 100 ns;
		assert (SUM_TOP = "1000" and SEGMENT_top = "0000000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 9 + 1 subtract" 
			severity failure;
			
			
	-- Switches of -3 + 2
		-- -3 + 2 add
		A_top <= "1101"; B_top <= "0010"; BTNU <= '0'; BTNC <= '0'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1111" and SEGMENT_top = "0111000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 13+2 add" 
			severity failure;
			
		-- -3 + 2 show a
		A_top <= "1101"; B_top <= "0010"; BTNU <= '1'; BTNC <= '0'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1111" and SEGMENT_top = "1000010" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 13+2 show a" 
			severity failure;
		
		-- -3 + 2 show b
		A_top <= "1101"; B_top <= "0010"; BTNU <= '0'; BTNC <= '1'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "1111" and SEGMENT_top = "0010010" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 13+2 show b" 
			severity failure;
					
		-- -3 + 2 subtract
		A_top <= "1101"; B_top <= "0010"; BTNU <= '0'; BTNC <= '0'; BTND <= '1';
		wait for 100 ns;
		assert (SUM_TOP = "1011" and SEGMENT_top = "1100000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 13+2 subtract" 
			severity failure;
			
	--Other switches		
		-- 4 + 6 subtract
		A_top <= "0100"; B_top <= "0110"; BTNU <= '0'; BTNC <= '0'; BTND <= '1';
		wait for 100 ns;
		assert (SUM_TOP = "1110" and SEGMENT_top = "0110000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 4 + 6 subtract" 
			severity failure;
			
		-- 5 + 6 subtract
		A_top <= "0101"; B_top <= "0110"; BTNU <= '0'; BTNC <= '0'; BTND <= '1';
		wait for 100 ns;
		assert (SUM_TOP = "1111" and SEGMENT_top = "0111000" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 5 + 6 subtract" 
			severity failure;
		
		-- -2 + 2 show b
		A_top <= "1110"; B_top <= "0010"; BTNU <= '0'; BTNC <= '1'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "0000" and SEGMENT_top = "0010010" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: -2 + 2 show b" 
			severity failure;
			
		-- 1 + 2 add
		A_top <= "0001"; B_top <= "0010"; BTNU <= '0'; BTNC <= '0'; BTND <= '0';
		wait for 100 ns;
		assert (SUM_TOP = "0011" and SEGMENT_top = "0000110" and ANODE = "11111110" and OVERFLOW_top = '0') 
			report "FAILURE: 1 + 2 subtract" 
			severity failure;
		
      wait;
		
   end process;

END;
