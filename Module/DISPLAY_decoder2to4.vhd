----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:52 03/09/2017 
-- Design Name: 
-- Module Name:    Decoder2to4 - Behavioral 
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

entity DISPLAY_decoder2to4 is
    Port ( D : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end DISPLAY_decoder2to4;

architecture Behavioral of DISPLAY_decoder2to4 is

begin
	Q(0) <= not D(0) and not D(1);
	Q(1) <= not D(0) and D(1);
	Q(2) <= D(0) and not D(1);
	Q(3) <= D(0) and D(1);

end Behavioral;

