--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:18 03/09/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/STATECTRL_COUNTER_0_5-TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: STATECTRL_COUNTER_0_5
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY STATECTRL_COUNTER_0_5_TEST IS
END STATECTRL_COUNTER_0_5_TEST;
 
ARCHITECTURE behavior OF STATECTRL_COUNTER_0_5_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT STATECTRL_COUNTER_0_5
    PORT(
         CONF : IN  std_logic;
         Q : OUT  integer
        );
    END COMPONENT;
    

   --Inputs
   signal CONF : std_logic := '0';

 	--Outputs
   signal Q : integer;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: STATECTRL_COUNTER_0_5 PORT MAP (
          CONF => CONF,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		CONF <= '0';
		wait for period;
		CONF <= '1';
		wait for period;
   end process;
 
END;
