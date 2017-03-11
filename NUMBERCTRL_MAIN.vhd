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
           B0, B1, B2, B3 : out  STD_LOGIC_VECTOR (3 downto 0));
end NUMBERCTRL_MAIN;

architecture Behavioral of NUMBERCTRL_MAIN is
	component NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR
		Port ( M, CLK, CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component NUMBERCTRL_DMUX_1TO4_BIT is
		Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : in  STD_LOGIC;
           D0, D1, D2, D3 : out  STD_LOGIC);
	end component;
	
	signal CLK0_T, CLK1_T, CLK2_T, CLK3_T : STD_LOGIC := '0';
	signal D0_T, D1_T, D2_T, D3_T : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	COUNTER_CLK_DMUX : NUMBERCTRL_DMUX_1TO4_BIT Port map (SEL, UP, CLK0_T, CLK1_T, CLK2_T, CLK3_T);
	
	B0_COUNTER : NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR Port map (VST, CLK0_T, END_S, B0);
	B1_COUNTER : NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR Port map (VST, CLK1_T, END_S, B1);
	B2_COUNTER : NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR Port map (VST, CLK2_T, END_S, B2);
	B3_COUNTER : NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR Port map (VST, CLK3_T, END_S, B3);
end Behavioral;

