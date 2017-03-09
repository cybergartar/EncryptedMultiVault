--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:56:38 03/09/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/STATECTRL_MAIN_TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: STATECTRL_MAIN
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
 
ENTITY STATECTRL_MAIN_TEST IS
END STATECTRL_MAIN_TEST;
 
ARCHITECTURE behavior OF STATECTRL_MAIN_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT STATECTRL_MAIN
    PORT(
         CONF : IN  std_logic;
         VST : OUT  std_logic;
         VFN : OUT  std_logic;
         PG1 : OUT  std_logic;
         PG2 : OUT  std_logic;
         PG3 : OUT  std_logic;
         PG4 : OUT  std_logic;
         SEL : OUT  integer
        );
    END COMPONENT;
    

   --Inputs
   signal CONF : std_logic := '0';

 	--Outputs
   signal VST : std_logic;
   signal VFN : std_logic;
   signal PG1 : std_logic;
   signal PG2 : std_logic;
   signal PG3 : std_logic;
   signal PG4 : std_logic;
   signal SEL : integer;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: STATECTRL_MAIN PORT MAP (
          CONF => CONF,
          VST => VST,
          VFN => VFN,
          PG1 => PG1,
          PG2 => PG2,
          PG3 => PG3,
          PG4 => PG4,
          SEL => SEL
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
