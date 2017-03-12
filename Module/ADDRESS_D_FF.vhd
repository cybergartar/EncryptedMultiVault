----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:18 02/17/2017 
-- Design Name: 
-- Module Name:    D_FF - Behavioral 
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

entity D_FF is
    Port ( D,clk,CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is
   signal QT : STD_LOGIC := '0';
begin
  process(clk)
   begin
	   if CLR = '0'  then QT <= '0' ;
	     elsif clk'event and clk = '0'  then
	        
			  QT <= D;
	  
	   end if;
	end process;
	Q <= QT;
	 
end Behavioral;
