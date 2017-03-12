--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:50:50 03/08/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/MEMORY_8X16-TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMORY_8X16
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
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MEMORY_3X16_TEST IS
END MEMORY_3X16_TEST;
 
ARCHITECTURE behavior OF MEMORY_3X16_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MEMORY_3X16
    PORT(
         D3 : IN  std_logic_vector(3 downto 0);
         D2 : IN  std_logic_vector(3 downto 0);
         D1 : IN  std_logic_vector(3 downto 0);
         D0 : IN  std_logic_vector(3 downto 0);
         ADDR : IN  std_logic_vector(1 downto 0);
         READ_SIG : IN  std_logic;
         WRITE_SIG : IN  std_logic;
         Q3 : OUT  std_logic_vector(3 downto 0);
         Q2 : OUT  std_logic_vector(3 downto 0);
         Q1 : OUT  std_logic_vector(3 downto 0);
         Q0 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D3 : std_logic_vector(3 downto 0) := (others => '0');
   signal D2 : std_logic_vector(3 downto 0) := (others => '0');
   signal D1 : std_logic_vector(3 downto 0) := (others => '0');
   signal D0 : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR : std_logic_vector(1 downto 0) := (others => '0');
   signal READ_SIG : std_logic := '0';
   signal WRITE_SIG : std_logic := '0';

 	--Outputs
   signal Q3 : std_logic_vector(3 downto 0);
   signal Q2 : std_logic_vector(3 downto 0);
   signal Q1 : std_logic_vector(3 downto 0);
   signal Q0 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMORY_3X16 PORT MAP (
          D3 => D3,
          D2 => D2,
          D1 => D1,
          D0 => D0,
          ADDR => ADDR,
          READ_SIG => READ_SIG,
          WRITE_SIG => WRITE_SIG,
          Q3 => Q3,
          Q2 => Q2,
          Q1 => Q1,
          Q0 => Q0
        );

   -- Clock process definitions
   cprocess :process
   begin
		READ_SIG <= '0';
		WRITE_SIG <= '0';
		wait for 100 ms;
		D3 <= "1100";
		D2 <= "1001";
		D1 <= "0100";
		D0 <= "1101";
		wait for 100 ms;
		ADDR <= "10";
		wait for 100 ms;
		WRITE_SIG <= '1';
		wait for 100 ms;
		WRITE_SIG <= '0';
		READ_SIG <= '1';
		wait for 100 ms;
		assert (D3&D2&D1&D0 = "1100100101001101") report "FAILED" severity ERROR;
		wait for 100 ms;
		
		READ_SIG <= '0';
		WRITE_SIG <= '0';
		wait for 100 ms;
		D3 <= "1010";
		D2 <= "1011";
		D1 <= "1100";
		D0 <= "1111";
		wait for 100 ms;
		ADDR <= "01";
		wait for 100 ms;
		WRITE_SIG <= '1';
		wait for 100 ms;
		WRITE_SIG <= '0';
		READ_SIG <= '1';
		wait for 100 ms;
		assert (D3&D2&D1&D0 = "1010101111001111") report "FAILED" severity ERROR;
   end process;
 


END;
