--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe	
--
-- Create Date:   22:06:28 11/19/2016
-- Design Name:   d-latch Test Bench
-- Module Name:   H:/Documents/DSD/LAB5/dLatch/dLatch_tb.vhd
-- Project Name:  Lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dLatch
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
 
ENTITY dLatch_tb IS
END dLatch_tb;
 
ARCHITECTURE behavior OF dLatch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dLatch
    PORT(
         D : IN  std_logic;
         c : IN  std_logic;
         q : INOUT  std_logic;
         q_bar : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal c : std_logic := '0';

	--BiDirs
   signal q : std_logic;
   signal q_bar : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dLatch PORT MAP (
          D => D,
          c => c,
          q => q,
          q_bar => q_bar
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--stimulus 1: store 1
		D <= '1';
		c <= '1';
		wait for 100ns;
		
		--stimulus 2: attempt to 0 write when holding 1
		c <= '0';
		D <= '0';
		wait for 100ns;
		
		--stimulus 3: store 0
		D <= '0';
		c <= '1';
		wait for 100ns;
		
		--stimulus 4: attempt to 1 write when holding 0
		c <= '0';
		D <= '1';
		wait for 100ns;


      wait;
   end process;

END;
