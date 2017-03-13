----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:02 03/09/2017 
-- Design Name: 
-- Module Name:    STATECTRL_MAIN - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity STATECTRL_MAIN is
    Port ( CONF : in  STD_LOGIC;
			  VST, VFN, PG1, PG2, PG3, PG4, END_S : out  STD_LOGIC;
           SEL : out STD_LOGIC_VECTOR (1 downto 0));
end STATECTRL_MAIN;

architecture Behavioral of STATECTRL_MAIN is
	component STATECTRL_COUNTER_0_5
    Port ( CONF : in  STD_LOGIC;
			  Q : out STD_LOGIC_VECTOR (2 downto 0);
			  TC : out STD_LOGIC := '0');
	end component;

	signal Q_T : STD_LOGIC_VECTOR (2 downto 0);
	signal SEL_T : STD_lOGIC_VECTOR (1 downto 0);
	signal TEMP : STD_LOGIC_VECTOR (2 downto 0);

begin
	STT_COUNTER : STATECTRL_COUNTER_0_5 Port map (CONF, Q_T, END_S);
	
	process (Q_T)
		begin
			if (Q_T = "000") then
				VST <= '1';
			else
				VST <= '0';
			end if;
			
			if (Q_T = "101") then
				VFN <= '1';
			else
				VFN <= '0';
			end if;
			
			if (Q_T >= "001") then
				PG1 <= '1';
			else
				PG1 <= '0';
			end if;
			
			if (Q_T >= "010") then
				PG2 <= '1';
			else
				PG2 <= '0';
			end if;
			
			if (Q_T >= "011") then
				PG3 <= '1';
			else
				PG3 <= '0';
			end if;
			
			if (Q_T >= "100") then
				PG4 <= '1';
			else
				PG4 <= '0';
			end if;
			
			if (Q_T = "000" or Q_T = "101") then
				SEL_T <= "00";
			else
				TEMP <= Q_T - 1;
				SEL_T <= TEMP(1) & TEMP(0);
			end if;
	end process;
	
	SEL <= SEL_T;
	
end Behavioral;

