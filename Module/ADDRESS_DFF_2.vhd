----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:47 03/13/2017 
-- Design Name: 
-- Module Name:    DFF_2 - Behavioral 
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

entity DFF_2 is
  Port( D:in  STD_LOGIC_VECTOR(1 downto 0);
		  CLK,CLR :in STD_LOGIC;
		  Q : out STD_LOGIC_VECTOR(1 downto 0));
		  
end DFF_2;

architecture Behavioral of DFF_2 is

	signal DT0,DT1 : STD_LOGIC;
	signal QT0,QT1 : STD_LOGIC;
	
 component D_FF is
	Port ( D,clk,CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component;
	
begin
			DT0 <=D(0);
			DT1 <=D(1);
	
			B0 : D_FF port map(DT0,CLK,CLR,QT0);
			B1 : D_FF port map(DT1,CLK,CLR,QT1);
			 
			Q <= QT0&QT1;		

end Behavioral;

