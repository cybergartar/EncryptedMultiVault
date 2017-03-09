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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity STATECTRL_MAIN is
    Port ( CONF : in  STD_LOGIC;
			  VST, VFN, PG1, PG2, PG3, PG4 : out  STD_LOGIC;
           SEL : out  integer);
end STATECTRL_MAIN;

architecture Behavioral of STATECTRL_MAIN is
	component STATECTRL_COUNTER_0_5
    Port ( CONF : in  STD_LOGIC;
			  Q : out integer);
	end component;

	signal Q_T : integer;
	signal SEL_T : integer;

begin
	STT_COUNTER : STATECTRL_COUNTER_0_5 Port map (CONF, Q_T);
	
	process (Q_T)
		begin
			if (Q_T = 0) then
				VST <= '1';
			else
				VST <= '0';
			end if;
			
			if (Q_T = 5) then
				VFN <= '1';
			else
				VFN <= '0';
			end if;
			
			if (Q_T >= 1) then
				PG1 <= '1';
			else
				PG1 <= '0';
			end if;
			
			if (Q_T >= 1) then
				PG1 <= '1';
			else
				PG1 <= '0';
			end if;
			
			if (Q_T >= 2) then
				PG2 <= '1';
			else
				PG2 <= '0';
			end if;
			
			if (Q_T >= 3) then
				PG3 <= '1';
			else
				PG3 <= '0';
			end if;
			
			if (Q_T >= 4) then
				PG4 <= '1';
			else
				PG4 <= '0';
			end if;
			
			if (Q_T = 0 or Q_T = 5) then
				SEL_T <= 0;
			else
				SEL_T <= Q_T - 1;
			end if;
	end process;
	
	SEL <= SEL_T;
	
end Behavioral;

