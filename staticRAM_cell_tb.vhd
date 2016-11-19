--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   23:03:48 11/19/2016
-- Design Name:   Test Bench static Ram cell
-- Module Name:   H:/Documents/DSD/LAB5/staticRAM_cell/staticRAM_cell_tb.vhd
-- Project Name:  LAB5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: staticRAM_cell
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
 
ENTITY staticRAM_cell_tb IS
END staticRAM_cell_tb;
 
ARCHITECTURE behavior OF staticRAM_cell_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT staticRAM_cell
    PORT(
         Data_in : IN  std_logic;
         Cell_select : IN  std_logic;
         Write_enable : IN  std_logic;
         Data_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic := '0';
   signal Cell_select : std_logic := '0';
   signal Write_enable : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: staticRAM_cell PORT MAP (
          Data_in => Data_in,
          Cell_select => Cell_select,
          Write_enable => Write_enable,
          Data_out => Data_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --stimulus 1- cell not selected
		Cell_select <= '0';
		wait for 100 ns;
		
		--stimulus 2- write 1 to latch
		Data_in <= '1';
		Write_enable <= '1';
		Cell_select <= '1'
		wait for 100 ns;
		
		--stimulus 3- hold 1
		Write_enable <= '0';
		Data_in <= '0';
		Cell_select <= '1'
		wait for 100 ns;
		
		--stimulus 4-  write 0 to latch
		Data_in <= '0';
		Write_enable <= '1';
		Cell_select <= '1'
		wait for 100 ns;
		
		--stimulus 5- hold 0
		Write_enable <= '0';
		Data_in <= '1';
		Cell_select <= '1'
		wait for 100 ns;
		
		Cell_select <= '0'

      wait;
   end process;

END;
