----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:02:09 03/13/2017 
-- Design Name: 
-- Module Name:    Decode2_4 - Behavioral 
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

entity Decode2_4 is
    Port ( D : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : OUT  STD_LOGIC_VECTOR (3 downto 0));
end Decode2_4;

architecture Behavioral of Decode2_4 is

begin

	Q <=  "1000" when  D="11" else -- 3
			"0100" when  D="10" else -- 2
			"0010" when  D="01" else -- 1
			"0001" when	 D="00" else -- 0
			"0000";


end Behavioral;

