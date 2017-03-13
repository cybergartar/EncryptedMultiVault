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

entity NUMBERCTRL_N_COUNTER_WITH_CLEAR is
	 Generic (COUNT : in integer := 3);
    Port ( CLK, CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end NUMBERCTRL_N_COUNTER_WITH_CLEAR;

architecture Behavioral of NUMBERCTRL_N_COUNTER_WITH_CLEAR is
	signal Q_T : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	process (CLK, CLR)
		begin
			if (CLR = '1') then
				Q_T <= "0000";
			else
				if (rising_edge(CLK)) then
					if (Q_T = COUNT) then
						Q_T <= "0000";
					else	
						Q_T <= Q_T + 1;
					end if;
				end if;	
			end if;
			
	end process;
	
	Q <= Q_T;

end Behavioral;

