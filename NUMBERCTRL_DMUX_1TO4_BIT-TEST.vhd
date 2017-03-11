--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:54:05 03/11/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/NUMBERCTRL_DMUX_1TO4_BIT-TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NUMBERCTRL_DMUX_1TO4_BIT
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
 
ENTITY NUMBERCTRL_DMUX_1TO4_BIT_TEST IS
END NUMBERCTRL_DMUX_1TO4_BIT_TEST;
 
ARCHITECTURE behavior OF NUMBERCTRL_DMUX_1TO4_BIT_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NUMBERCTRL_DMUX_1TO4_BIT
    PORT(
         SEL : IN  std_logic_vector(1 downto 0);
         Q : IN  std_logic_vector(3 downto 0);
         D0 : OUT  std_logic_vector(3 downto 0);
         D1 : OUT  std_logic_vector(3 downto 0);
         D2 : OUT  std_logic_vector(3 downto 0);
         D3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');
   signal Q : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal D0 : std_logic_vector(3 downto 0);
   signal D1 : std_logic_vector(3 downto 0);
   signal D2 : std_logic_vector(3 downto 0);
   signal D3 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NUMBERCTRL_DMUX_1TO4_BIT PORT MAP (
          SEL => SEL,
          Q => Q,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3
        );

   -- Clock process definitions
   clock_process :process
   begin
		
		SEL <= "00";
		wait for period;
		Q <= "0101";
		wait for period;
		assert (D0 = "0101") report "SEL 0 FAILED" severity ERROR;
		
		
		SEL <= "01";
		wait for period;
		Q <= "1100";
		wait for period;
		assert (D0 = "0101" and D1 = "1100") report "SEL 1 FAILED" severity ERROR;
		
		
		SEL <= "10";
		wait for period;
		Q <= "1001";
		wait for period;
		assert (D0 = "0101" and D1 = "1100" and D2 = "1001") report "SEL 2 FAILED" severity ERROR;
		
		
		SEL <= "11";
		wait for period;
		Q <= "1111";
		wait for period;
		assert (D0 = "0101" and D1 = "1100" and D2 = "1001" and D3 = "1111") report "SEL 3 FAILED" severity ERROR;
		
		SEL <= "00";
		wait for period;
		Q <= "1101";
		wait for period;
		assert (D0 = "1101" and D1 = "1100" and D2 = "1001" and D3 = "1111") report "SEL 0_2 FAILED" severity ERROR;
		
		wait;
   end process;
 
END;
