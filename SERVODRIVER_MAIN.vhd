----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:34 03/12/2017 
-- Design Name: 
-- Module Name:    SERVO - Behavioral 
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

entity SERVODRIVER_MAIN is
    Port ( CLK, STATE : in  STD_LOGIC;
           SERVO_PULSE : out  STD_LOGIC);
end SERVODRIVER_MAIN;

architecture Behavioral of SERVODRIVER_MAIN is
	signal COUNT : integer := 0;
	signal PULSE_T : STD_LOGIC := '1';
begin
	process (CLK)
		begin
		if (CLK'event and CLK = '1') then
			if (COUNT = 500000) then
				COUNT <= 0;
			else
				COUNT <= COUNT + 1;
				if (STATE = '0' and COUNT >= 25000) then
					PULSE_T <= '0';
				elsif (STATE = '1' and COUNT >= 50000) then
					PULSE_T <= '0';
				else
					PULSE_T <= '1';
				end if;
			end if;	
		end if;
	end process;
	
	SERVO_PULSE <= PULSE_T;

end Behavioral;

