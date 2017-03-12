--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:46:51 03/11/2017
-- Design Name:   
-- Module Name:   C:/Users/cyber/ASSIGN/nUMBERCTRL_MAIN-TEST.vhd
-- Project Name:  ASSIGN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NUMBERCTRL_MAIN
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NUMBERCTRL_MAIN_TEST IS
END NUMBERCTRL_MAIN_TEST;
 
ARCHITECTURE behavior OF NUMBERCTRL_MAIN_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NUMBERCTRL_MAIN
    PORT(
         UP : IN  std_logic;
         VST : IN  std_logic;
         END_S : IN  std_logic;
         SEL : IN  std_logic_vector(1 downto 0);
         B0 : OUT  std_logic_vector(3 downto 0);
         B1 : OUT  std_logic_vector(3 downto 0);
         B2 : OUT  std_logic_vector(3 downto 0);
         B3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal UP : std_logic := '0';
   signal VST : std_logic := '0';
   signal END_S : std_logic := '0';
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal B0 : std_logic_vector(3 downto 0);
   signal B1 : std_logic_vector(3 downto 0);
   signal B2 : std_logic_vector(3 downto 0);
   signal B3 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NUMBERCTRL_MAIN PORT MAP (
          UP => UP,
          VST => VST,
          END_S => END_S,
          SEL => SEL,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3
        );

   -- Clock process definitions
   cloprocess :process
   begin
		for i in 8 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;
		
		for i in 8 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;
		
		for i in 8 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;
		
		for i in 8 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= "00";
		
		---------------------------------------------------------------------
		VST <= '1';
		for i in 9 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;
		
		for i in 9 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;


		for i in 9 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;


		for i in 9 downto 0 loop
			UP <= '0';
			wait for period;
			UP <= '1';
			wait for period;
		end loop;
		wait for period;
		SEL <= SEL + 1;
		wait for period;

		END_S <= '1';
		wait;
   end process;

END;
