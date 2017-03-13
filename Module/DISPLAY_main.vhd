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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DISPLAY_main is
    Port ( --OP : in  STD_LOGIC;
           --LC : in  STD_LOGIC;
           --ER : in  STD_LOGIC;
			  --EN : in STD_LOGIC;
			  CLK25 : in std_logic;
			  B3,B2,B1,B0 : in STD_LOGIC_VECTOR (3 downto 0);
			  VST,VFN,ST,EQU : in std_logic;
			  Digit : out std_logic_vector (3 downto 0);
           Segment : out  STD_LOGIC_VECTOR (6 downto 0)); -- a -> 0, g-> 6
end DISPLAY_main;

architecture Behavioral of DISPLAY_main is
	signal OP : std_logic;
	signal LC : std_logic;
	signal ER : std_logic;
	signal EN : std_logic;
	------ MUX4to1 -------
	component DISPLAY_mux4to1
			 Port ( B3 : in  STD_LOGIC_VECTOR (3 downto 0);
           B2 : in  STD_LOGIC_VECTOR (3 downto 0);
           B1 : in  STD_LOGIC_VECTOR (3 downto 0);
           B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Bout : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	signal Q : std_logic_vector (3 downto 0);
	
	------ counter0to3 ------
	component DISPLAY_counter0to3
			 Port ( CLK200Hz : in  STD_LOGIC;
			  CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (1 downto 0));
	end component;
	signal addr_tmp : std_logic_vector (1 downto 0);
	
	------ dividerto200Hz ------
	component DISPLAY_dividerto200Hz
			 Port ( CLK25 : in  STD_LOGIC;
           CLK200Hz : out  STD_LOGIC);
	end component;
	signal CLK200Hz_tmp : std_logic;
	
	------ decoder2to4 -------
	component DISPLAY_decoder2to4
			Port ( D : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
begin
	EN <= not VST;
	OP <= VFN and (not ST) and EQU;
	LC <= VFN and ST;
	ER <= VFN and (not ST) and EQU;
	
	------- Port Map Area --------
	withMUX : DISPLAY_mux4to1 port map (B3 => B3, B2 => B2, B1 => B1, B0 => B0, Bout => Q, addr => addr_tmp);
	
	withdivider : DISPLAY_dividerto200Hz port map (CLK25 => CLK25, CLK200Hz => CLK200Hz_tmp);
	
	withcounter : DISPLAY_counter0to3 port map(CLK200Hz => CLK200Hz_tmp, CLR => '0', Q => addr_tmp);
	
	withdecoder : DISPLAY_decoder2to4 port map (D => addr_tmp, Q => Digit);
	
	segment <= "0000000" when EN = '0' and addr_tmp = "01" else
				  "0000000" when EN = '0' and addr_tmp = "10" else
				  "0000000" when EN = '0' and addr_tmp = "11" else
				  
				  "1111110" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr_tmp = "00" else
				  "1100111" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr_tmp = "01" else
				  "1001111" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr_tmp = "10" else
				  "1110110" when EN = '1' and OP = '1' and LC = '0' and ER = '0' and addr_tmp = "11" else
				  
				  "0001110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr_tmp = "00" else
				  "1111110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr_tmp = "01" else
				  "1001110" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr_tmp = "10" else
				  "0101111" when EN = '1' and OP = '0' and LC = '1' and ER = '0' and addr_tmp = "11" else
				  
				  "1001111" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr_tmp = "00" else
				  "0000101" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr_tmp = "01" else
				  "0000101" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr_tmp = "10" else
				  "0000000" when EN = '1' and OP = '0' and LC = '0' and ER = '1' and addr_tmp = "11" else
				  
				  "1111011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "1001" else
				  "1111111" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "1000" else
				  "1110000" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0111" else
				  "1011111" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0110" else
				  "1011011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0101" else
				  "0110011" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0100" else
				  "1111001" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0011" else
				  "1101101" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0010" else
				  "0110000" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0001" else
				  "1111110" when EN = '1' and OP = '0' and LC = '0' and ER = '0' and Q = "0000" else
				  
				  "1111011" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "1001" else
				  "1111111" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "1000" else
				  "1110000" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0111" else
				  "1011111" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0110" else
				  "1011011" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0101" else
				  "0110011" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0100" else
				  "1111001" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0011" else
				  "1101101" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0010" else
				  "0110000" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0001" else
				  "1111110" when EN = '0' and addr_tmp = "00" and OP = '0' and LC = '0' and ER = '0' and Q = "0000";		
	 

end Behavioral;

