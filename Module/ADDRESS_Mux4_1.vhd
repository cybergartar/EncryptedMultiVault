----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:53 03/13/2017 
-- Design Name: 
-- Module Name:    Mux4_1 - Behavioral 
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

entity Mux4_1 is
    Port (  STA : in  STD_LOGIC_VECTOR (2 downto 0);
				sec : in  STD_LOGIC_VECTOR (1 downto 0);
				ST : out STD_LOGIC);
end Mux4_1;

architecture Behavioral of Mux4_1 is

begin
		ST <= STA(0) when sec = "00" else
				STA(1) when sec = "01" else
				STA(2) when sec = "10" else
				'X';
		
			

end Behavioral;

