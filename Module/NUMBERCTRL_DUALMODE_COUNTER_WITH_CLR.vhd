----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:33 03/11/2017 
-- Design Name: 
-- Module Name:    NUMBERCTRL_DUALMODE_COUNTER - Behavioral 
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

entity NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR is
    Port ( M, CLK, CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR;

architecture Behavioral of NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR is
	signal Q_T : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal OLD_M : STD_LOGIC := '0';
	signal OLD_CLK : STD_LOGIC := '0';
begin
	process (CLK, M, CLR)
		begin
			if (CLR = '1') then
				Q_T <= "0000";
			end if;
			if (M /= OLD_M) then
				Q_T <= "0000";
				OLD_M <= M;
			end if;
			
			if (CLK /= OLD_CLK) then
				OLD_CLK <= CLK;
				
				if (CLK = '1') then
					if (M = '0') then
						if (Q_T = "1001") then
							Q_T <= "0000";
						else
							Q_T <= Q_T + 1;
						end if;
					elsif (M = '1') then
						if (Q_T = "0010") then
							Q_T <= "0000";
						else
							Q_T <= Q_T + 1;
						end if;
					end if;
				end if;
			end if;
	end process;
	
	Q <= Q_T;

end Behavioral;

