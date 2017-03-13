----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vason Maitree 58011130
-- 
-- Create Date:    03:53:42 03/13/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( CONF : in  STD_LOGIC;
           UP : in  STD_LOGIC;
			  STA : out STD_LOGIC_VECTOR (2 downto 0);
           PG1 : out  STD_LOGIC;
           PG2 : out  STD_LOGIC;
           PG3 : out  STD_LOGIC;
           PG4 : out  STD_LOGIC;
           SEG : out  STD_LOGIC_VECTOR (6 downto 0);
           DIG : out  STD_LOGIC_VECTOR (3 downto 0);
			  CLK : in STD_LOGIC);
end main;

architecture Behavioral of main is
	component COMPARATOR_main
		  Port ( A3, A2, A1, A0 : in  STD_LOGIC_VECTOR (3 downto 0);
					B3, B2, B1, B0 : in  STD_LOGIC_VECTOR (3 downto 0);
					EQU : out  STD_LOGIC);
	end component;
	component DISPLAY_main
		  Port ( CLK25 : in std_logic;
					B3,B2,B1,B0 : in STD_LOGIC_VECTOR (3 downto 0);
					VST,VFN,ST,EQU : in std_logic;
					Digit : out std_logic_vector (3 downto 0);
					Segment : out  STD_LOGIC_VECTOR (6 downto 0)); -- a -> 0, g-> 6
	end component;
	component MEMORY_MAIN is
			Port ( B3, B2, B1, B0 : in  STD_LOGIC_VECTOR (3 downto 0);
					 A3, A2, A1, A0 : out  STD_LOGIC_VECTOR (3 downto 0);
					 VST, VFN, ST : in  STD_LOGIC);
	end component;
	component NUMBERCTRL_MAIN is
	Port ( UP, VST, END_S : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           B0, B1, B2, B3 : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component SERVODRIVER_MAIN is
    Port ( CLK, STATE : in  STD_LOGIC;
           SERVO_PULSE : out  STD_LOGIC);
	end component;
	component STATECTRL_MAIN is
    Port ( CONF : in  STD_LOGIC;
			  VST, VFN, PG1, PG2, PG3, PG4, END_S : out  STD_LOGIC;
           SEL : out  integer);
	end component;
	component VAULTLCK_main is
	 Port( EQU,ST,VFN:in STD_LOGIC;
 			 SW: in STD_LOGIC_VECTOR(2 downto 0);
			 STA: out STD_LOGIC_VECTOR(2 downto 0));
	end component;
	component ADDRESS_main is
	 Port( VST : in  STD_LOGIC;
			 clk : in STD_LOGIC;
			 STA : inout STD_LOGIC_VECTOR(2 downto 0);
          B : in  STD_LOGIC_VECTOR (1 downto 0);
          SW : out  STD_LOGIC_VECTOR (3 downto 0);
          ST : out  STD_LOGIC);
	end component;
	
	signal VST_Temp : STD_LOGIC;
	signal VFN_Temp : STD_LOGIC;
	signal ST_Temp : STD_LOGIC;
	signal EQU_Temp : STD_LOGIC;
	signal END_Temp : STD_LOGIC;
	signal SEL_Temp : STD_LOGIC_VECTOR(1 downto 0);
	signal SW_Temp3 : STD_LOGIC_VECTOR(2 downto 0);
	signal SW_Temp4 : STD_LOGIC_VECTOR(3 downto 0);
	signal B0_Address_Temp : STD_LOGIC_VECTOR(1 downto 0);
	signal B0_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal B1_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal B2_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal B3_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal A0_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal A1_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal A2_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal A3_Temp : STD_LOGIC_VECTOR(3 downto 0);
	signal STA_Temp : STD_LOGIC_VECTOR(2 downto 0);

begin
	B0_Address_Temp <= B0_Temp(0) & B0_Temp(1);
	SW_Temp3 <= SW_Temp4(0) & SW_Temp4(1) & SW_Temp4(2);
	
	Vault_Locker : VAULTLCK_main port map (EQU => EQU_Temp,
														SW => SW_Temp3,
														ST => ST_Temp,
														VFN => VFN_Temp,
														STA => STA_Temp);
														
	Main_Memory : MEMORY_MAIN port map (B3 => B3_Temp,
													B2 => B2_Temp,
													B1 => B1_Temp,
													B0 => B0_Temp,
													A3 => A3_Temp,
													A2 => A2_Temp,
													A1 => A1_Temp,
													A0 => A0_Temp,
													VST => VST_Temp,
													VFN => VFN_Temp,
													ST => ST_Temp);
	
	Displayer : DISPLAY_MAIN port map (CLK25 => CLK,
												  B3 => B3_Temp,
												  B2 => B2_Temp,
												  B1 => B1_Temp,
												  B0 => B0_Temp,
												  VST => VST_Temp,
												  VFN => VFN_Temp,
												  ST => ST_Temp,
												  EQU => EQU_Temp,
												  Digit => DIG,
												  Segment => SEG);
														
	Address_Selector : ADDRESS_main port map (VST => VST_Temp,
															clk => '1',
															STA => STA_Temp,
															B => B0_Address_Temp,
															SW => SW_Temp4,
															ST => ST_Temp);
															
	Memory_Comparator : COMPARATOR_main port map (B3 => B3_Temp,
																 B2 => B2_Temp,
																 B1 => B1_Temp,
																 B0 => B0_Temp,
																 A3 => A3_Temp,
															 	 A2 => A2_Temp,
																 A1 => A1_Temp,
																 A0 => A0_Temp,
																 EQU => EQU_Temp);
																 
	Number_Controller : NUMBERCTRL_main port map (UP => UP,
																 VST => VST_Temp,
																 SEL => SEL_Temp,
																 B3 => B3_Temp,
																 B2 => B2_Temp,
																 B1 => B1_Temp,
																 B0 => B0_Temp,
																 END_S => END_Temp);
															
	Phase_Controller : STATECTRL_main port map (CONF => CONF,
															  VST => VST_Temp,
															  VFN => VFN_Temp,
															  PG1 => PG1,
															  PG2 => PG2,
															  PG3 => PG3,
															  PG4 => PG4,
															  END_S => END_Temp);
															  
	STA <= STA_Temp;
	
end Behavioral;

