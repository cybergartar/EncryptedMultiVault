----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:35 03/06/2017 
-- Design Name: 
-- Module Name:    divider - Behavioral 
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

entity DISPLAY_dividerto200Hz is
    Port ( CLK25 : in  STD_LOGIC;
           CLK200Hz : out  STD_LOGIC);
end DISPLAY_dividerto200Hz;

architecture Behavioral of DISPLAY_dividerto200Hz is
	signal COUNT : std_logic := '0';
	signal CLK_temp : std_logic;
	
begin
	process(CLK)
	begin
		if CLK_temp'event and CLK_temp = '1' then
			if COUNT >= 62499 then CLK200Hz <= not CLK200Hz; COUNT <= '0';
			else COUNT <= COUNT + 1;
			end if;
		end if;
	end process;
	
	CLK200Hz <= CLK_temp;
	
end Behavioral;

