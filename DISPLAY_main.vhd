----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:00 03/08/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity DISPLAY_main is
    Port ( OP : in  STD_LOGIC;
           LC : in  STD_LOGIC;
           ER : in  STD_LOGIC;
			  EN : in STD_LOGIC;
			  addr : in STD_LOGIC_VECTOR (1 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q0 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
			  B3 : in STD_LOGIC ()
           Segment : out  STD_LOGIC_VECTOR (6 downto 0)); -- a -> 0, g-> 6
end DISPLAY_main;

architecture Behavioral of DISPLAY_main is
	------ MUX4to1 -------
	component MUX4to1
			 Port ( B3 : in  STD_LOGIC_VECTOR (3 downto 0);
           B2 : in  STD_LOGIC_VECTOR (3 downto 0);
           B1 : in  STD_LOGIC_VECTOR (3 downto 0);
           B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Bout : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal Q0_tmp : std_logic_vector (6 downto 0);
	signal Q1_tmp : std_logic_vector (6 downto 0);
	signal Q2_tmp : std_logic_vector (6 downto 0);
	signal Q3_tmp : std_logic_vector (6 downto 0);

	
begin
	addr <= addr0&addr1;
	
	segment <= "0000" when EN = '0' and addr = "00" else
				  "0000" when EN = '0' and addr = "10" else
				  "0000" when EN = '0' and addr = "11" else
				  
				  "1111110" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr = "00" else
				  "1100111" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr = "01" else
				  "1001111" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr = "10" else
				  "1110110" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr = "11" else
				  
				  "0001110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr = "00" else
				  "1111110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr = "01" else
				  "1001110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr = "10" else
				  "0101111" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr = "11" else
				  
				  "1001111" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr = "00" else
				  "0000101" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr = "01" else
				  "0000101" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr = "10" else
				  "0000000" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr = "11" else
				  
				  "1111011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "1001" else
				  "1111111" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "1000" else
				  "1110000" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0111" else
				  "1011111" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0110" else
				  "1011011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0101" else
				  "0110011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0100" else
				  "1111001" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0011" else
				  "1101101" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0010" else
				  "0110000" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0001" else
				  "1111110";
				  
				  
	------- Port Map Area --------
	withMUX : MUX4to1 port map ()
		
	 

end Behavioral;

