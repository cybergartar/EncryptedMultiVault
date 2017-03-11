--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:12 03/11/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/NUMBERCTRL_DUALMODE_COUNTER-TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NUMBERCTRL_DUALMODE_COUNTER
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR_TEST IS
END NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR_TEST;
 
ARCHITECTURE behavior OF NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR
    PORT(
         M : IN  std_logic;
         CLK : IN  std_logic;
			CLR : IN std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal M : std_logic := '0';
   signal CLK : std_logic := '0';
	signal CLR : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NUMBERCTRL_DUALMODE_COUNTER_WITH_CLEAR PORT MAP (
          M => M,
          CLK => CLK,
			 CLR => CLR,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		for i in 13 downto 0 loop
			CLK <= '0';
			wait for CLK_period;
			CLK <= '1';
			wait for CLK_period;
			if (i < 2) then
				CLR <= '1';
			elsif (i < 7) then
				M <= '0';
			elsif (i < 10) then
				M <= '1';
			end if;
		end loop;
		wait;
   end process;

END;
