----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library mws5966_library;
use mws5966_library.mws5966_components.ALL;
 
entity FSM is
	PORT (CLK			:	in STD_LOGIC;
			CLR			:	in STD_LOGIC;
			STATUS_in   :  in STD_LOGIC_VECTOR (4 downto 0); 
			CONTROL_out :	out STD_LOGIC_VECTOR(4 downto 0)); 
end FSM;

architecture Behavioral of FSM is

	type STATE_TYPE is (OFF,L,LU,LC,LUR,LCL,LCR,LCRC,LCRCL,C1,C2,C3,C4,C5,badInput);
	
	signal presentState : STATE_TYPE; 
	signal nextState	  : STATE_TYPE;

begin
	
	process (CLK,CLR)
	begin 
		if (CLR = '1') then 
			presentState <= Off;
		elsif (CLK'event and CLK = '1') then 
			presentState <= nextState;
		end if; 
	end process; 
	
	---------------upper fsm----------------
	process(presentState, STATUS_in, CLR)
	begin 
		case presentState is 
			
			when badInput => 
				control_out <= "00000";
				
				if(STATUS_in= "10000") then 
					nextState <= L;
					
				elsif(STATUS_in = "00100") then
					nextState <= C1;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
				
				else 
					nextState <= badInput;
			
				end if; 
				
			when OFF => 
				control_out <= "10000";
				
				if(STATUS_in= "10000") then 
					nextState <= L;
					
				elsif(STATUS_in = "00100") then
					nextState <= C1;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
				
				else 
					nextState <= badInput;
			
				end if; 
		 --------------------------			
				when L => 
				control_out <= "00000";
				
				if(STATUS_in = "00010") then 
					nextState <= LU;
					
				elsif(STATUS_in = "00100") then
					nextState <= LC;
				
				elsif(STATUS_in = "00000") then
					nextState <= L;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --------------------------					
				when LU => 
				control_out <= "00000";
				
				if(STATUS_in = "01000") then 
					nextState <= LUR;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				elsif(STATUS_in = "00000") then
					nextState <= LU;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --Train------------------------			
				when LUR => 
				control_out <= "11010";
				
				if(STATUS_in = "10000") then 
					nextState <= L;
					
				elsif(STATUS_in = "00100") then
					nextState <= C1;
					
				elsif(STATUS_in = "00000") then
					nextState <= LUR;	
					
				elsif (CLR = '1') then 
					nextState <= Off;
					
				else 
					nextState <= LUR;
			
				end if; 
		 --------------------------			
			when LC => 
				control_out <= "00000";
				
				if(STATUS_in = "10000")   then 
					nextState <= LCL;
					
				elsif(STATUS_in = "01000") then
					nextState <= LCR;
				
				elsif(STATUS_in = "00000") then
					nextState <= LC;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
				
		--Wall------------------------	
				when LCL => 
				control_out <= "11101";
				
				if(STATUS_in = "10000") then 
					nextState <= L;
					
				elsif(STATUS_in = "00100") then
					nextState <= C1;
					
				elsif(STATUS_in = "00000") then
					nextState <= LCL;
					
				elsif (CLR = '1') then 
					nextState <= Off;
					
				else 
					nextState <= LCL;
			
				end if; 
		 --------------------------			
			when C1 => 
				control_out <= "00000";
				
				if(STATUS_in = "00100") then 
					nextState <= C2;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
				
				elsif(STATUS_in = "00000") then
					nextState <= C1;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --------------------------		
			when C2 => 
				control_out <= "00000";
				
				if(STATUS_in = "00100") then 
					nextState <= C3;
					
				elsif(STATUS_in = "00000") then
					nextState <= C2;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --------------------------		
			when C3 => 
				control_out <= "00000";
				
				if(STATUS_in = "00100") then 
					nextState <= C4;
				
				elsif(STATUS_in = "00000") then
					nextState <= C3;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --------------------------		
			when C4 => 
				control_out <= "00000";
				
				if(STATUS_in = "00100") then 
					nextState <= C5;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				elsif(STATUS_in = "00000") then
					nextState <= C4;
					
				else 
					nextState <= badInput;
			
				end if; 
		 --Physics------------------------		
			when C5 => 
				control_out <= "11100";
				
				if(STATUS_in = "10000") then 
					nextState <= L;
					
				elsif(STATUS_in = "00100") then 
					nextState <= C1;
				
				elsif(STATUS_in = "00000") then
					nextState <= C5;
					
				elsif (CLR = '1') then 
					nextState <= Off;
					
				else 
					nextState <= C5;
			
				end if; 
		 --------------------------		
			when LCR => 
				control_out <= "00000";
				
				if(STATUS_in = "00100") then 
					nextState <= LCRC;
					
				elsif(STATUS_in = "00000") then 
					nextState <= LCR;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
				
		 --------------------------		
			when LCRC => 
				control_out <= "00000";
				
				if(STATUS_in = "10000") then 
					nextState <= LCRCL;
					
				elsif(STATUS_in = "00000") then 
					nextState <= LCRC;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				else 
					nextState <= badInput;
			
				end if; 
				
		 --Ping Pong --------------------------		
			when LCRCL => 
				control_out <= "11011";
				
				if(STATUS_in = "10000") then 
					nextState <= L;
				
				elsif(STATUS_in = "00100") then 
					nextState <= C1;
					
				elsif(STATUS_in = "00000") then 
					nextState <= LCRCL;
					
				elsif(STATUS_in = "11001") then
					nextState <= OFF;
					
				elsif (CLR = '1') then 
					nextState <= Off;
					
				else 
					nextState <= LCRCL;
					
				end if; 
				
			when others =>
				control_out <= "11011";
				
				nextState <= OFF; 
				
			end case; 
	end process; 		
			
end Behavioral;

