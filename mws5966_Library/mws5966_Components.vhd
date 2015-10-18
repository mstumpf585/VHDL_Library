----------------------------------------------------------------------------
-- Entity:        mws5966_Components
-- Written By:    Michael Stumpf
-- Date Created:  9 Sep 15
-- Description:   Package definition for common components
--
-- Revision History (date, initials, description):
-- 	(none)
-- Dependencies:
--  All components declared in this definition
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

----------------------------------------------------------------------------
package mws5966_Components is

	
    component AdderSubtractor_nbit is
		generic(N           : integer);
		Port   (A 			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
				  B			  : in  STD_LOGIC_VECTOR(n-1 downto 0);
				  SUBTRACT    : in  STD_LOGIC;
              SUM  		  : out STD_LOGIC_VECTOR(n-1 downto 0);
              OVERFLOW    : out  STD_LOGIC);
   end component;
	
	component Average_nbit is
	generic(n       : integer);
	   port(A_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     B_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     C_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     D_avg   : in  STD_LOGIC_VECTOR (n-1 downto 0);
		     avg_out : out STD_LOGIC_VECTOR (n-1 downto 0));
   end component;

	component CompareGRT is
		generic ( N   : integer); 
		Port    ( A   : in  STD_LOGIC_VECTOR (n-1 downto 0);
					 B   : in  STD_LOGIC_VECTOR (n-1 downto 0);
					 GRT : out STD_LOGIC);
	end component;
	
	component CompareLES is
		generic( N 	 : integer); 
      Port   ( A 	 : in  STD_LOGIC_VECTOR (n-1 downto 0);
				   B 	 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			      LES : out  STD_LOGIC);
	end component;
	
	component Counter_nbit
		generic (n   : integer);
		port    (EN  : in STD_LOGIC;
			 	   CLK : in STD_LOGIC;
				   CLR : in STD_LOGIC;
				   Q   : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component CounterUpDown_nbit is
		generic (n : integer);
		port    (EN 	: in STD_LOGIC;
				   UP 	: in STD_LOGIC;
				   DOWN	: in STD_LOGIC;
				   CLK 	: in STD_LOGIC;
				   CLR 	: in STD_LOGIC;
				   Q 		: out STD_LOGIC_VECTOR (n-1 downto 0));
			
   end component;
	
	component Decoder3to8 is
		port(X  : in STD_LOGIC_VECTOR (3 downto 0);
			  EN : in STD_LOGIC;
		     Y  : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component Debounce is
		port (D      : in STD_LOGIC;
				SAMPLE : in STD_LOGIC;
				CLK    : in STD_LOGIC;
				Q      : out STD_LOGIC);
	end component;
	
	component D_flip_flop
		port ( D   : in STD_LOGIC;
			    CLK : in STD_LOGIC;
			    Q   : out STD_LOGIC:= '0');
	end component;
	
	component D_flip_flop_CE
		port ( D   : in STD_LOGIC;
				 CE  : in STD_LOGIC;
			    CLK : in STD_LOGIC;
			    Q   : out STD_LOGIC:= '0');
	end component;
	
	component DFF_CE_CR is
		port ( D   : in STD_LOGIC;
				 CE  : in STD_LOGIC;
				 CLK : in STD_LOGIC;
			    CLR : in STD_LOGIC;
             Q   : out STD_LOGIC:= '0');
			 
	end component;
	
	component DataPath is
		port(CLK      			: in STD_LOGIC;
			  CLR      			: in STD_LOGIC;
		     Strobe   			: in STD_LOGIC;
		     CONTROL_out     : in STD_LOGIC_VECTOR(4  downto 0);
	        Train_FSM 		: in STD_LOGIC_VECTOR(15 downto 0);
	        PingPong_FSM 	: in STD_LOGIC_VECTOR(15 downto 0);
	        Physics_FSM 	   : in STD_LOGIC_VECTOR(15 downto 0);
	        Wall_FSM 			: in STD_LOGIC_VECTOR(15 downto 0);
	        SEGMENT  			: out STD_LOGIC_VECTOR(0 to 6); 
	        ANODE    			: out STD_LOGIC_VECTOR(7 downto 0);
	        LED      			: out STD_LOGIC_VECTOR(15 downto 0));
	
   end component;
---------------------FSMs----------------------------------------
	component FSM
		PORT (CLK			:	in STD_LOGIC;
				CLR			:	in STD_LOGIC;
				STATUS_in   :  in STD_LOGIC_VECTOR (4 downto 0); 
				CONTROL_out :	out STD_LOGIC_VECTOR(4 downto 0)); 
	end component;
	
	component Train_FSM
		PORT (CLK			:	in STD_LOGIC;
				CLR			:	in STD_LOGIC;
				EN          :  in STD_LOGIC;
				CONTROL_out :	out STD_LOGIC_VECTOR(15 downto 0)); 
	end component;
	
	component PingPong_FSM is
	Port (CLK			:	in STD_LOGIC;
			CLR			:	in STD_LOGIC; 
			EN        	:	in STD_LOGIC; 
			control_out :	out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component Physics_FSM is
	Port (CLK			:	in STD_LOGIC;
			CLR			:	in STD_LOGIC; 
			EN        	:	in STD_LOGIC; 
			control_out :	out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component wall_FSM is
	Port (CLK			:	in STD_LOGIC;
			CLR			:	in STD_LOGIC; 
			EN        	:	in STD_LOGIC; 
			STATUS_in	:  in STD_LOGIC_VECTOR (15 downto 0);
			control_out :	out STD_LOGIC_VECTOR(15 downto 0));
	end component;
-------------------------------------------------------------------	
	component FullAdder is
		port (A     : in  STD_LOGIC;
				B     : in  STD_LOGIC;
				C_in  : in  STD_LOGIC;
				C_out : out STD_LOGIC;
				SUM   : out STD_LOGIC);
	end component;

	component HexToSevenSeg is
		Port (HEX 			: in  STD_LOGIC_VECTOR (3 downto 0);
				SEGMENT     : out  STD_LOGIC_VECTOR(0 to 6));
	end component;
	
	component MAX_nbit is
	 generic( N       : integer);
    Port   ( A_top 	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 B_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 C_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 D_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
			    MAX_OUT	: out STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
	
	component MIN_nbit is
	 generic( N       : integer);
    Port   ( A_top 	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 B_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 C_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 D_top	: in  STD_LOGIC_VECTOR(n-1 downto 0);
		       MIN_OUT	: out STD_LOGIC_VECTOR(n-1 downto 0));
   end component;

	component Mux4to1_4bit is
		Port (X0 	: in  STD_LOGIC_VECTOR (3 downto 0);
				X1		: in  STD_LOGIC_VECTOR (3 downto 0);
				X2   	: in  STD_LOGIC_VECTOR (3 downto 0);
				X3   	: in  STD_LOGIC_VECTOR (3 downto 0);
				SEL  	: in  STD_LOGIC_VECTOR (1 downto 0);
				Y		: out STD_LOGIC_VECTOR (3 downto 0));  
	end component;
	
	component Mux4to1_nbit is
		generic (n    : integer);
		Port	  (X0   : in  STD_LOGIC_VECTOR (n-1 downto 0);
					X1	  : in  STD_LOGIC_VECTOR (n-1 downto 0);
					X2   : in  STD_LOGIC_VECTOR (n-1 downto 0);
					X3   : in  STD_LOGIC_VECTOR (n-1 downto 0);
					SEL  : in  STD_LOGIC_VECTOR (1 downto 0);
					Y	  : out STD_LOGIC_VECTOR (n-1 downto 0));  

	end component;
	
	component oneShot is
		port (D   : in STD_LOGIC;
				CLK : in STD_LOGIC;
				Q   : out STD_LOGIC);
	end component;
	
	component pulseGenerator is
	generic (n         : integer;
				maxCount  : natural := 9); 
	port    (EN        :  in  STD_LOGIC;
				CLK 		 :  in  STD_LOGIC;
				CLR 		 :  in   STD_LOGIC;
				PULSE_OUT : out STD_LOGIC);
	end component;

	component RCA_nbit 
		generic ( N     : integer);
		port 	  ( A		 : in STD_LOGIC_VECTOR(n-1 downto 0);
					 B		 : in STD_LOGIC_VECTOR(n-1 downto 0);
					 c_in	 : in STD_LOGIC;
					 c_out : out STD_LOGIC;
					 SUM	 : out STD_LOGIC_VECTOR(n-1 downto 0));
	end component; 
		
	component RCA is
		port (C_in 		: in  STD_LOGIC;
            A3 		: in  STD_LOGIC;
            A2 		: in  STD_LOGIC;
            A1 		: in  STD_LOGIC;
            A0 		: in  STD_LOGIC;
            B3 		: in  STD_LOGIC;
            B2 		: in  STD_LOGIC;
            B1 		: in  STD_LOGIC;
            B0 		: in  STD_LOGIC;
            SUM3 		: out  STD_LOGIC;
            SUM2 		: out  STD_LOGIC;
            SUM1 		: out  STD_LOGIC;
            SUM0 		: out  STD_LOGIC;
            C_out 	: out  STD_LOGIC);
	end component;
	
	component Reg_nbit is
		generic (n    : integer);
		port 	  (D    : in STD_LOGIC_VECTOR(n-1 downto 0);
				   LOAD : in STD_LOGIC;
				   CLK  : in STD_LOGIC;
					CLR  : in STD_LOGIC;
					Q    : out STD_LOGIC_VECTOR(n-1 downto 0) := (OTHERS => '0'));
	end component;
	
	component shiftReg_16bit is
		port (D      : in STD_LOGIC;
				CLK    : in STD_LOGIC;
				CLR    : in STD_LOGIC;
				EN     : in STD_LOGIC;
				Q      : out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component shiftReg_32bit is
		port (D      : in STD_LOGIC;
				CLK    : in STD_LOGIC;
				CLR    : in STD_LOGIC;
				EN     : in STD_LOGIC;
				Q      : out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component SIPO_nbit is
	generic (n    : integer);
	port   (D      : in STD_LOGIC;
			  CLK    : in STD_LOGIC;
			  CLR    : in STD_LOGIC;
			  Rshift : in STD_LOGIC;
			  Lshift : in STD_LOGIC; 
			  Q      : out STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
	
	
	component byte_sipo is
	port   (D      : in STD_LOGIC_VECTOR(7 downto 0);
			  CLK    : in STD_LOGIC;
			  CLR    : in STD_LOGIC;
			  Rshift : in STD_LOGIC;
			  Q      : out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component WordTo8dig7seg is
		Port (STROBE   : in STD_LOGIC;
			   CLK      : in STD_LOGIC;
			   CLR      : in STD_LOGIC;
			   WORD     : in STD_LOGIC_VECTOR  (31 downto 0);
			   DIGIT_EN : in STD_LOGIC_VECTOR  (7  downto 0);
			   ANODE    : out STD_LOGIC_VECTOR (7  downto 0);
			   SEGMENT  : out STD_LOGIC_VECTOR (0  to 6));
	end component;
end mws5966_Components;
----------------------------------------------------------------------------



----------------------------------------------------------------------------
package body mws5966_Components is

end mws5966_Components;
----------------------------------------------------------------------------
