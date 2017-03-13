----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:48 03/13/2017 
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

entity VAULTLCK_main is
	Port( EQU,ST,VFN:in STD_LOGIC;
			SW: in STD_LOGIC_VECTOR(2 downto 0);
			STA: out STD_LOGIC_VECTOR(2 downto 0));
end VAULTLCK_main;

architecture Behavioral of VAULTLCK_main is

   signal s0,s1,s2 : STD_LOGIC;
	signal T0,T1,T2 : STD_LOGIC ; 
	signal x1,x2 : STD_LOGIC ;

	component T_FF is
		    Port ( T,CLK,CLR : in  STD_LOGIC;
                 Q : out  STD_LOGIC);
          end component;

begin
			x1 <= EQU and ST;
			x2 <= x1 or ST;
			
			T0 <= x2  and SW(0);
			T1 <= x2  and SW(1);
			T2 <= x2  and SW(2);

			B0 : T_FF port map (T0,VFN,'1',s0);
			B1 : T_FF port map (T1,VFN,'1',s1);
			B2 : T_FF port map (T2,VFN,'1',s2);
			
			STA <= s2&s1&s0;
			

end Behavioral;

