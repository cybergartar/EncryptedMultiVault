----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:52 03/11/2017 
-- Design Name: 
-- Module Name:    NUMBERCTRL_DMUX_1TO4_BIT - Behavioral 
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

entity NUMBERCTRL_DMUX_1TO4_BIT is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : in  STD_LOGIC;
           D0, D1, D2, D3 : out  STD_LOGIC);
end NUMBERCTRL_DMUX_1TO4_BIT;

architecture Behavioral of NUMBERCTRL_DMUX_1TO4_BIT is
	signal D0_T, D1_T, D2_T, D3_T : STD_LOGIC := '0';
begin
	process (SEL, Q)
		begin
			case SEL is
				when "00" => D0_T <= Q;
				when "01" => D1_T <= Q;
				when "10" => D2_T <= Q;
				when others => D3_T <= Q;
			end case;
	end process;
	
	D0 <= D0_T;
	D1 <= D1_T;
	D2 <= D2_T;
	D3 <= D3_T;
	
end Behavioral;

