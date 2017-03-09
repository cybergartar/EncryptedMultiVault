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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity STATECTRL_COUNTER_0_5 is
    Port ( CONF : in  STD_LOGIC;
			  Q : out integer);
end STATECTRL_COUNTER_0_5;

architecture Behavioral of STATECTRL_COUNTER_0_5 is
	signal Q_T : integer := 0;
begin
	process (CONF)
		begin
			if ( rising_edge(CONF) ) then
				if (Q_T = 5) then
					Q_T <= 0;
				else
					Q_T <= Q_T + 1;
				end if;
			end if;
	end process;
	
	Q <= Q_T;

end Behavioral;

