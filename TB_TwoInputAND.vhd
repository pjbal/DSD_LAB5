--------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe
--
-- Create Date:   20:32:32 10/09/2016
-- Design Name:   Test bench for TwoInputAND
-- Module Name:   H:/Documents/DSD/LAB1/DSD_LAB1_TwoInputAND/TB_TwoInputAND.vhd
-- Project Name:  DSD_LAB1_TwoInputAND
-- Target Device:  
-- Tool versions:  
-- Description:  Test Bench to go through all possible inputs. 
-- 
-- VHDL Test Bench Created by ISE for module: TwoInputAND_VHDL
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
 
ENTITY TB_TwoInputAND IS
END TB_TwoInputAND;
 
ARCHITECTURE behavior OF TB_TwoInputAND IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TwoInputAND_VHDL
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sig_a : std_logic := '0';
   signal sig_b : std_logic := '0';

 	--Outputs
   signal sig_c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TwoInputAND_VHDL PORT MAP (sig_a, sig_b, sig_c);

   -- Clock process definitions
   --<clock>_process :process
  -- begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      sig_a <= '0';
		sig_b <= '0';
		
		wait for 100ns;
		
		sig_a <= '1';
		
		wait for 100ns;
		
		sig_a <= '0';
		sig_b <= '1';
		
		wait for 100ns;
		
		sig_a <= '1';

      wait;
   end process;

END;
