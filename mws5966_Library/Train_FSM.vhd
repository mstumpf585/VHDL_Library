
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Train_FSM is
	PORT (CLK			:	in STD_LOGIC;
			CLR			:	in STD_LOGIC; 
			EN        	:	in STD_LOGIC; 
			control_out :	out STD_LOGIC_VECTOR(15 downto 0));
end Train_FSM;

architecture Behavioral of Train_FSM is

	type STATE_TYPE is (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18,
							   T19, T20, T21, T22, T23, T24);
	
	signal presentState : STATE_TYPE; 
	signal nextState	  : STATE_TYPE;

begin

process (CLK,CLR,EN)
	begin 
		if (CLR = '1') then 
			presentState <= T0;
		elsif (CLK'event and CLK = '1' and EN = '1') then 
			presentState <= nextState;
		end if; 
	end process; 
	
	---------------upper fsm----------------
	process(presentState)
	begin 
		case presentState is 
			
			when T0 => 
				control_out <= "1000000000000000";
				nextState   <= T1;
				
			when T1 => 
				control_out <= "1100000000000000";
				nextState   <= T2;
				
			when T2 => 
				control_out <= "1110000000000000";
				nextState   <= T3;
			
			when T3 => 
				control_out <= "1111000000000000";
				nextState   <= T4;
			
			when T4 => 
				control_out <= "1111100000000000";
				nextState   <= T5;
			
			when T5 => 
				control_out <= "1111110000000000";
				nextState   <= T6;
			
			when T6 => 
				control_out <= "1111111000000000";
				nextState   <= T7;
			
			when T7 => 
				control_out <= "1111111100000000";
				nextState   <= T8;
			
			when T8 => 
				control_out <= "1111111110000000";
				nextState   <= T9;
				
			when T9 => 
				control_out <= "1111111111000000";
				nextState   <= T10;
				
			when T10 => 
				control_out <= "0111111111100000";
				nextState   <= T11;
				
			when T11 => 
				control_out <= "0011111111110000";
				nextState   <= T12;
				
			when T12 => 
				control_out <= "0001111111111000";
				nextState   <= T13;
				
			when T13 => 
				control_out <= "0000111111111100";
				nextState   <= T14;
				
			when T14 => 
				control_out <= "0000011111111110";
				nextState   <= T15;
				
			when T15 => 
				control_out <= "0000001111111111";
				nextState   <= T16;
				
			when T16 => 
				control_out <= "0000000011111111";
				nextState   <= T17;
				
			when T17 => 
				control_out <= "0000000001111111";
				nextState   <= T18;
				
			when T18 => 
				control_out <= "0000000000111111";
				nextState   <= T19;
				
			when T19 => 
				control_out <= "0000000000011111";
				nextState   <= T20;
				
			when T20 => 
				control_out <= "0000000000001111";
				nextState   <= T21;
				
			when T21 => 
				control_out <= "0000000000000111";
				nextState   <= T22;
				
			when T22 => 
				control_out <= "0000000000000011";
				nextState   <= T23;
				
			when T23 => 
				control_out <= "0000000000000001";
				nextState   <= T24;
				
			when T24 => 
				control_out <= "0000000000000000";
				nextState   <= T0;
				
			end case; 
	end process;
end Behavioral;

