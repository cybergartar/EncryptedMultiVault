----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:40 03/09/2017 
-- Design Name: 
-- Module Name:    counter0to3 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DISPLAY_counter0to3 is
    Port ( CLK200Hz : in  STD_LOGIC;
			  CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (1 downto 0));
end DISPLAY_counter0to3;

architecture Behavioral of DISPLAY_counter0to3 is
	signal tmp: std_logic_vector(1 downto 0); 
  begin  
      process (CLK200Hz, CLR) 
        begin  
          if (CLR = '1') then  
            tmp <= "00";  
          elsif (CLK200Hz'event and CLK200Hz = '1') then  
            tmp <= tmp + 1; 
          end if;  
      end process; 
      Q <= tmp;  


end Behavioral;

