----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:21:37 03/09/2017 
-- Design Name: 
-- Module Name:    STATECTRL_COUNTER_0_5 - Behavioral 
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

entity STATECTRL_COUNTER_0_5 is
    Port ( CONF : in  STD_LOGIC;
			  Q : out STD_LOGIC_VECTOR (2 downto 0);
			  TC : out STD_LOGIC := '0');
end STATECTRL_COUNTER_0_5;

architecture Behavioral of STATECTRL_COUNTER_0_5 is
	signal Q_T : STD_LOGIC_VECTOR (2 downto 0) := "000";
	signal TC_T : STD_LOGIC := '0';
begin
	process (CONF)
		begin
			if ( rising_edge(CONF) ) then
				if (Q_T = "101") then
					Q_T <= "000";
					TC_T <= '1';
				else
					Q_T <= Q_T + 1;
					TC_T <= '0';
				end if;
			end if;
	end process;
	
	Q <= Q_T;
	TC <= TC_T;

end Behavioral;

