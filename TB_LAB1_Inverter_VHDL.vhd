--------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe
--
-- Create Date:   18:35:02 10/09/2016
-- Design Name:   Test bench for Inverter
-- Module Name:   H:/Documents/DSD/LAB1/DSD_LAB1_Inverter_VHDL/TB_Inverter_VHDL.vhd
-- Project Name:  DSD_LAB1_Inverter_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   Test Bench to go through all possible inputs. 
-- 
-- VHDL Test Bench Created by ISE for module: Inverter_VHDL
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
 
ENTITY TB_Inverter_VHDL IS
END TB_Inverter_VHDL;
 
ARCHITECTURE behavior OF TB_Inverter_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Inverter_VHDL
    PORT(
         a : IN  std_logic;
         b : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sig_a : std_logic := '0';

 	--Outputs
   signal sig_b : std_logic;
   
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Inverter_VHDL PORT MAP (sig_a, sig_b);

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      sig_a <= '1'; 
		
		wait for 100 ns;
		
		sig_a <= '0';

      wait;
   end process;

END;
