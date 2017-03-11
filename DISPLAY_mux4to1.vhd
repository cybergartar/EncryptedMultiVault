----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:48 03/08/2017 
-- Design Name: 
-- Module Name:    MUX4to1 - Behavioral 
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

entity DISPLAY_mux4to1 is
    Port ( B3 : in  STD_LOGIC_VECTOR (3 downto 0);
           B2 : in  STD_LOGIC_VECTOR (3 downto 0);
           B1 : in  STD_LOGIC_VECTOR (3 downto 0);
           B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Bout : out  STD_LOGIC_VECTOR (3 downto 0));
end DISPLAY_mux4to1;

architecture Behavioral of DISPLAY_mux4to1 is
	--signal Bout_temp : std_logic_vector (3 downto 0);
begin
	addr <= addr1&addr0;
	
	Bout <= B3 when addr = "11" else
			  B2 when addr = "10" else
			  B1 when addr = "01" else 
			  B0;
end Behavioral;

