----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:32 03/08/2017 
-- Design Name: 
-- Module Name:    MAIN_MEMORY - Behavioral 
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

entity MAIN_MEMORY is
    Port ( B3, B2, B1, B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           A3, A2, A1, A0 : out  STD_LOGIC_VECTOR (3 downto 0);
           VST, VFN, ST : in  STD_LOGIC);
end MAIN_MEMORY;

architecture Behavioral of MAIN_MEMORY is
	component DFF_3BIT
		Port ( CLK : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (2 downto 0);
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component MEMORY_8X16
		Port ( D3, D2, D1, D0 : in  STD_LOGIC_VECTOR (3 downto 0);
           ADDR : in  STD_LOGIC_VECTOR (2 downto 0);
           READ_SIG, WRITE_SIG : in  STD_LOGIC;
           Q3, Q2, Q1, Q0 : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal B_ADDR, SELECTED_ADDR : STD_LOGIC_VECTOR (2 downto 0) := "000";
	signal MEM_READ, MEM_WRITE : STD_LOGIC := '0';
	
begin
	MAIN_MEM : MEMORY_8X16 Port map (B3, B2, B1, B0,
												SELECTED_ADDR, MEM_READ, MEM_WRITE,
												A3, A2, A1, A0);
												
	ADDR_LOCK : DFF_3BIT Port map (VST, B_ADDR, SELECTED_ADDR);
	
	B_ADDR <= B0(2 downto 0);
	MEM_READ <= VFN and (not ST);
	MEM_WRITE <= VFN and ST;

end Behavioral;

