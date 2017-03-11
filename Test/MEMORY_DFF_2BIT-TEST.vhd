--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:24:15 03/08/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/DFF_TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DFF_3BIT
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
 
ENTITY DFF_TEST IS
END DFF_TEST;
 
ARCHITECTURE behavior OF DFF_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFF_2BIT
    PORT(
         CLK : IN  std_logic;
         D : IN  std_logic_vector(1 downto 0);
         Q : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal D : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFF_2BIT PORT MAP (
          CLK => CLK,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '1';
		D <= "10";
		wait for 500 ms;
		CLK <= '0';
		wait for 100 ms;
		assert (Q = "10") report "FAILED" severity ERROR;
   end process;
 


END;
