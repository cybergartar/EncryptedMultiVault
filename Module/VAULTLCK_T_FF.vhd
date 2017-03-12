----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:17 03/13/2017 
-- Design Name: 
-- Module Name:    T_FF - Behavioral 
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

entity T_FF is
    Port ( T,CLK,CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end T_FF;

architecture Behavioral of T_FF is

   signal QT : STD_LOGIC := '0';
begin
  process(CLK)
   begin
	   if CLR = '0'  then QT <= '0' ;
	     elsif clk'event and clk = '1'  then
		    if T='0' then  QT<=QT;
			 elsif T='1' then QT<= NOT QT;
	        
			 end if;
			end if; 
	end process;
	Q <= QT;

end Behavioral;

