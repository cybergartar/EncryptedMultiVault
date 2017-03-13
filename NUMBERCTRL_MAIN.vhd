----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:55 03/11/2017 
-- Design Name: 
-- Module Name:    NUMBERCTRL_MAIN - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NUMBERCTRL_MAIN is
    Port ( UP, VST, END_S : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           B0, B1, B2, B3 : out  STD_LOGIC_VECTOR (3 downto 0);
			  SEL_SEL : out STD_LOGIC_VECTOR (1 downto 0);
			  UP_UP : out STD_LOGIC);
end NUMBERCTRL_MAIN;

architecture Behavioral of NUMBERCTRL_MAIN is
	component NUMBERCTRL_N_COUNTER_WITH_CLEAR is
		Generic (COUNT : in integer := 3);
		Port ( CLK, CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component NUMBERCTRL_DMUX_1TO4_BIT is
		Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : in  STD_LOGIC;
           D0, D1, D2, D3 : out  STD_LOGIC);
	end component;
	
	signal CLK0_T, CLK1_T, CLK2_T, CLK3_T : STD_LOGIC := '0';
	signal B0_9, B1_9, B2_9, B3_9 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal B0_2, B1_2, B2_2, B3_2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal CLR_2, CLR_9 : STD_LOGIC := '0';
begin

	CLR_2 <= (not VST) or END_S;
	CLR_9 <= VST or END_S;
	COUNTER_CLK_DMUX : NUMBERCTRL_DMUX_1TO4_BIT Port map (SEL, UP, CLK0_T, CLK1_T, CLK2_T, CLK3_T);
	
	B0_COUNTER_9 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (9) Port map (CLK0_T, CLR_9, B0_9);
	B1_COUNTER_9 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (9) Port map (CLK1_T, CLR_9, B1_9);
	B2_COUNTER_9 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (9) Port map (CLK2_T, CLR_9, B2_9);
	B3_COUNTER_9 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (9) Port map (CLK3_T, CLR_9, B3_9);
	
	B0_COUNTER_2 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (2) Port map (CLK0_T, CLR_2, B0_2);
	B1_COUNTER_2 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (2) Port map (CLK1_T, CLR_2, B1_2);
	B2_COUNTER_2 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (2) Port map (CLK2_T, CLR_2, B2_2);
	B3_COUNTER_2 : NUMBERCTRL_N_COUNTER_WITH_CLEAR Generic map (2) Port map (CLK3_T, CLR_2, B3_2);
	
	B0 <= B0_9 or B0_2;
	B1 <= B1_9 or B1_2;
	B2 <= B2_9 or B2_2;
	B3 <= B3_9 or B3_2;
	
	SEL_SEL <= SEL;
	UP_UP <= UP;
end Behavioral;

