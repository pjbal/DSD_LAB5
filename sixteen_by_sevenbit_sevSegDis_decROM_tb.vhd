--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   19:47:50 11/18/2016
-- Design Name:   16 x 7-bit seven-segment decoder ROM Test Bench
-- Module Name:   H:/Documents/DSD/LAB3/sixteen_by_sevenbit_sevSegDis_decROM/sixteen_by_sevenbit_sevSegDis_decROM_tb.vhd
-- Project Name:  sixteen_by_sevenbit_sevSegDis_decROM
-- Target Device:  
-- Tool versions:  
-- Description:    Test Bench to test all addresses with 16 x 7-bit seven-segment decoder ROM
-- 
-- VHDL Test Bench Created by ISE for module: sixteen_by_sevenbit_sevSegDis_decROM
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
USE ieee.numeric_std.ALL;
 
ENTITY sixteen_by_sevenbit_sevSegDis_decROM_tb IS
END sixteen_by_sevenbit_sevSegDis_decROM_tb;
 
ARCHITECTURE behavior OF sixteen_by_sevenbit_sevSegDis_decROM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sixteen_by_sevenbit_sevSegDis_decROM
    PORT(
         address : IN  std_logic_vector(3 downto 0);
         data_outputs : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal data_outputs : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sixteen_by_sevenbit_sevSegDis_decROM PORT MAP (
          address => address,
          data_outputs => data_outputs
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--loop through all possible inputs
		loop0: for i in 15 downto 0 loop
			address <= std_logic_vector(to_unsigned(i, 4));--assign stimulus defined from loop0
			wait for 100 ns;
		end loop;

      wait;
   end process;

END;
