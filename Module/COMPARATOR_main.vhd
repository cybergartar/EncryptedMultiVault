----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:49:30 03/09/2017 
-- Design Name: 
-- Module Name:    COMPARATOR_main - Behavioral 
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

entity COMPARATOR_main is
    Port ( A3, A2, A1, A0 : in  STD_LOGIC_VECTOR (3 downto 0);
           B3, B2, B1, B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           EQU : out  STD_LOGIC);
end COMPARATOR_main;

architecture Behavioral of COMPARATOR_main is

begin
	EQU <= '1' when A0(0) = B0(0) and A0(1) = B0(1) and A0(2) = B0(2) and A0(3) = B0(3) and 
						 A1(0) = B1(0) and A1(1) = B1(1) and A1(2) = B1(2) and A1(3) = B1(3) and 
						 A2(0) = B2(0) and A2(1) = B2(1) and A2(2) = B2(2) and A2(3) = B2(3) and 
						 A3(0) = B3(0) and A3(1) = B3(1) and A3(2) = B3(2) and A3(3) = B3(3) 
				  else
			 '0';
end Behavioral;

