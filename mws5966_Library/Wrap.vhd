
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library mws5966_library;
use mws5966_library.mws5966_components.ALL;


entity Lab05_mws5966_TopLVL is
	PORT (CLK			:	in STD_LOGIC;
			BTNS        :  in STD_LOGIC_VECTOR (4 downto 0); 
			SWITCHES    :  in STD_LOGIC_VECTOR(0 to 15); 
			LED         :	out STD_LOGIC_VECTOR(15 downto 0); 
			ANODE       :	out STD_LOGIC_VECTOR(7 downto 0);
			SEGMENT     :	out STD_LOGIC_VECTOR(0 to 6));
end Lab05_mws5966_TopLVL;

architecture Behavioral of Lab05_mws5966_TopLVL is
	
	
	------btn input handlers-------
	-- Debouncer signals 
	signal DB_BTNR				: STD_LOGIC;
	signal DB_BTNL				: STD_LOGIC;
	signal DB_BTNC				: STD_LOGIC;
	signal DB_BTNU				: STD_LOGIC;
	signal DB_BTND				: STD_LOGIC;
	
	-- One shot signals 
	signal OS_BTNR				: STD_LOGIC;
	signal OS_BTNL				: STD_LOGIC;
	signal OS_BTNC				: STD_LOGIC;
	signal OS_BTNU		      : STD_LOGIC;
	signal OS_BTND		      : STD_LOGIC;
	
	-- Pulse generator signals 
	signal Pulse_int        : STD_LOGIC; 
	signal PulseFast_int    : STD_LOGIC; 
	signal PulseTrain_int   : STD_LOGIC; 
	signal PulsePingPong_int: STD_LOGIC; 
	signal PulsePhysics_int : STD_LOGIC; 
	signal PulseWall_int : STD_LOGIC; 
	
	--signals for FSMs
	signal STATUS_in_int1       :STD_LOGIC_VECTOR(4 downto 0); 
	signal CONTROL_out_int1     :STD_LOGIC_VECTOR(4 downto 0); 
	signal CONTROL_out_train    :STD_LOGIC_VECTOR(15 downto 0);
	signal CONTROL_out_PingPong :STD_LOGIC_VECTOR(15 downto 0);
	signal CONTROL_out_Physics  :STD_LOGIC_VECTOR(15 downto 0);
	signal CONTROL_out_Wall     :STD_LOGIC_VECTOR(15 downto 0);
	
	--signals for hexToSeven
	signal Hex2Seven            : STD_LOGIC_VECTOR(31 downto 0); 
	
	--signals for ClR
	signal threeFinger 		    :STD_LOGIC;
	
	-- clr 
	signal CLR : STD_LOGIC:= '0';
	
	
	alias BTNL  is BTNS(0); 
	alias BTNR  is BTNS(1); 
	alias BTNC  is BTNS(2); 
	alias BTNU  is BTNS(3); 
	alias BTND  is BTNS(4); 
	
	
begin
		
	STATUS_in_int1(4) <= OS_BTNL;
	STATUS_in_int1(3) <= OS_BTNR;
	STATUS_in_int1(2) <= OS_BTNC;
	STATUS_in_int1(1) <= OS_BTNU;
	STATUS_in_int1(0) <= OS_BTND;
	
	-- getting value for three finger salute 
	threeFinger <= (BTNR and BTNL and BTND); 
	
	-- Debouncers--------------------------------------------- 
	DBL: Debounce 
		port map (D      => BTNL,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_BTNL);
					 
	DBR: Debounce 
		port map (D      => BTNR,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_BTNR);
	
	DBC: Debounce 
		port map (D      => BTNC,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_BTNC);
					 
	DBU: Debounce 
		port map (D      => BTNU,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_BTNU);
					 
	DBD: Debounce 
		port map (D      => BTND,
				    SAMPLE => pulse_int,
				    CLK    => CLK,
				    Q      => DB_BTND);
					 
	-- one shots---------------------------------------- 			 
	OSL: oneShot 
	port map (D   => DB_BTNL,
			    CLK => CLK ,
			    Q   => OS_BTNL);
				 

	OSR: oneShot 
	port map (D   => DB_BTNR,
			    CLK => CLK ,
			    Q   => OS_BTNR);
				 
			 
	OSC: oneShot 
	port map (D   => DB_BTNC,
			    CLK => CLK ,
			    Q   => OS_BTNC);
				 
	 			 
	OSU: oneShot 
	port map (D   => DB_BTNU,
			    CLK => CLK ,
			    Q   => OS_BTNU);
				 
			 
	OSD: oneShot 
	port map (D   => DB_BTND,
			    CLK => CLK ,
			    Q   => OS_BTND);
				 
	-- pulse Generator---------------------------------------
	pulse: PulseGenerator
	generic map (n         => 16,
				    maxCount  => 10000 )
	port map    (EN  =>  '1',      
				    CLK =>	CLK,	 
				    CLR =>	CLR,	 
				    PULSE_OUT => pulse_int);
					 
	-- seven seg driver 				 
	HEX: WordTo8dig7seg
	port map(STROBE  	=> Strobe, 
				CLK     	=> CLK,
				CLR     	=> CLR,
				WORD    	=> Hex2Seven,
				DIGIT_EN => "00000001",
				ANODE    => ANODE,
				SEGMENT  => SEGMENT);
				
	LEDS <= SWITCHES;
					 
end Behavioral;