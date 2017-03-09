----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:18:51 03/08/2017 
-- Design Name: 
-- Module Name:    DFF_3BIT - Behavioral 
-- Project Name: ;


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

entity DFF_3BIT is
    Port ( CLK : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (2 downto 0);
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end DFF_3BIT;

architecture Behavioral of DFF_3BIT is
	signal Q_T : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
	process (CLK)
		begin
			if falling_edge(CLK) then
				Q_T <= D;
			end if;
	end process;
	
	Q <= Q_T;

end Behavioral;

