----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:35 03/13/2017 
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

entity ADDRESS_main is
    Port ( VST : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  STA : in STD_LOGIC_VECTOR(2 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           SW : out  STD_LOGIC_VECTOR (3 downto 0);
           ST : out  STD_LOGIC);
end ADDRESS_main;

architecture Behavioral of ADDRESS_main is

		signal x : STD_LOGIC_VECTOR (1 downto 0);
		
	component DFF_2 is
		Port( D : in  STD_LOGIC_VECTOR(1 downto 0);
			   clk : in STD_LOGIC;
            CLR : in  STD_LOGIC;
            Q : out  STD_LOGIC_VECTOR(1 downto 0));
	   end component;
		
	component Decode2_4 is
		Port ( D : in  STD_LOGIC_VECTOR (1 downto 0);
             Q : out  STD_LOGIC_VECTOR (3 downto 0));
		end component;
		
	 component Mux4_1 is
		Port ( STA : in  STD_LOGIC_VECTOR (2 downto 0);
				sec : in  STD_LOGIC_VECTOR (1 downto 0);
				ST : out STD_LOGIC);
		end component ;
begin
	
	
	DFF : DFF_2  port map(B,clk,VST,x);
	decode : Decode2_4 port map(x,SW);
	Mux	: Mux4_1 port map (STA,B,ST);
	

	

end Behavioral;

