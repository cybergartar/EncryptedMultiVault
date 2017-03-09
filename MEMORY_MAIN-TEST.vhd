--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:14:49 03/08/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/MAIN_MEMORY_TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAIN_MEMORY
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
 
ENTITY MAIN_MEMORY_TEST IS
END MAIN_MEMORY_TEST;
 
ARCHITECTURE behavior OF MAIN_MEMORY_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAIN_MEMORY
    PORT(
         B3 : IN  std_logic_vector(3 downto 0);
         B2 : IN  std_logic_vector(3 downto 0);
         B1 : IN  std_logic_vector(3 downto 0);
         B0 : IN  std_logic_vector(3 downto 0);
         A3 : OUT  std_logic_vector(3 downto 0);
         A2 : OUT  std_logic_vector(3 downto 0);
         A1 : OUT  std_logic_vector(3 downto 0);
         A0 : OUT  std_logic_vector(3 downto 0);
         VST : IN  std_logic;
         VFN : IN  std_logic;
         ST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B3 : std_logic_vector(3 downto 0) := (others => '0');
   signal B2 : std_logic_vector(3 downto 0) := (others => '0');
   signal B1 : std_logic_vector(3 downto 0) := (others => '0');
   signal B0 : std_logic_vector(3 downto 0) := (others => '0');
   signal VST : std_logic := '0';
   signal VFN : std_logic := '0';
   signal ST : std_logic := '0';

 	--Outputs
   signal A3 : std_logic_vector(3 downto 0);
   signal A2 : std_logic_vector(3 downto 0);
   signal A1 : std_logic_vector(3 downto 0);
   signal A0 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant wait_time : time := 10 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAIN_MEMORY PORT MAP (
          B3 => B3,
          B2 => B2,
          B1 => B1,
          B0 => B0,
          A3 => A3,
          A2 => A2,
          A1 => A1,
          A0 => A0,
          VST => VST,
          VFN => VFN,
          ST => ST
        );

   -- Clock process definitions
   cprocess :process
   begin
		VST <= '0';
		VFN <= '0';
		ST <= '0';
		wait for wait_time;
		
		VST <= '1';
		wait for wait_time;
		B0 <= "0101";
		wait for wait_time;
		VST <= '0';
		B3 <= "1010";
		B2 <= "1001";
		B1 <= "1100";
		B0 <= "0001";
		wait for wait_time;
		VFN <= '1';
		ST <= '1';
		wait for wait_time;
		ST <= '0';
		wait for wait_time;
		
		assert (A3 & A2 & A1 & A0 = "1010100111000001") report "FAILED1" severity ERROR;
		wait for wait_time;
		
		VST <= '0';
		VFN <= '0';
		ST <= '0';
		wait for wait_time;
		
		VST <= '1';
		wait for wait_time;
		B0 <= "0011";
		wait for wait_time;
		VST <= '0';
		B3 <= "1110";
		B2 <= "1011";
		B1 <= "1101";
		B0 <= "0101";
		wait for wait_time;
		VFN <= '1';
		ST <= '1';
		wait for wait_time;
		ST <= '0';
		wait for wait_time;
		
		assert (A3 & A2 & A1 & A0 = "1110101111010101") report "FAILED2" severity ERROR;
		wait for wait_time;
		
		VST <= '0';
		VFN <= '0';
		ST <= '0';
		wait for wait_time;
		
		VST <= '1';
		wait for wait_time;
		B0 <= "0101";
		wait for wait_time;
		VST <= '0';
		wait for wait_time;
		VFN <= '1';
		ST <= '0';
		wait for wait_time;
		assert (A3 & A2 & A1 & A0 = "1010100111000001") report "FAILED3" severity ERROR;
		
   end process;

END;
