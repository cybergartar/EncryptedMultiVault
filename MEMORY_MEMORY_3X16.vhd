----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:55 03/08/2017 
-- Design Name: 
-- Module Name:    MEMORY_8X16 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMORY_3X16 is
    Port ( D3, D2, D1, D0 : in  STD_LOGIC_VECTOR (3 downto 0);
           ADDR : in  STD_LOGIC_VECTOR (1 downto 0);
           READ_SIG, WRITE_SIG : in  STD_LOGIC;
           Q3, Q2, Q1, Q0 : out  STD_LOGIC_VECTOR (3 downto 0));
end MEMORY_3X16;

architecture Behavioral of MEMORY_3X16 is
	type mem_3x16_type is array (2 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
	signal MEM : mem_3x16_type;
	signal MERGED_D, MERGED_Q : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin
	MERGED_D <= (D3 & D2 & D1 & D0);
	
	process (READ_SIG, WRITE_SIG)
		variable N_ADDRESS : integer;
		begin
			n_address := to_integer (unsigned(ADDR));
			if (READ_SIG = '1') then
				MERGED_Q <= MEM(n_address);
			elsif (WRITE_SIG = '1') then
				MEM(n_address) <= MERGED_D;
			else
				MERGED_Q <= (others => '0');
			end if;
	end process;
	
	Q0 <= MERGED_Q (3 downto 0);
	Q1 <= MERGED_Q (7 downto 4);
	Q2 <= MERGED_Q (11 downto 8);
	Q3 <= MERGED_Q (15 downto 12);

end Behavioral;

