--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   21:36:05 11/18/2016
-- Design Name:   Test Bench Time division muliplexor
-- Module Name:   H:/Documents/DSD/LAB5/TDM_dis/TDM_dis_tb.vhd
-- Project Name:  LAB5
-- Target Device:  
-- Tool versions:  
-- Description:   Test bench to test function of devise for a range of stimuluses
-- 
-- VHDL Test Bench Created by ISE for module: TDM_dis
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
 
ENTITY TDM_dis_tb IS
END TDM_dis_tb;
 
ARCHITECTURE behavior OF TDM_dis_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TDM_dis
    PORT(
         reset : IN  std_logic;
         Clock : IN  std_logic;
         InA : IN  std_logic_vector(3 downto 0);
         Inb : IN  std_logic_vector(3 downto 0);
         Cathode_A : OUT  std_logic;
         Cathode_B : OUT  std_logic;
         Anode_outs : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal Clock : std_logic := '0';
   signal InA : std_logic_vector(3 downto 0) := (others => '0');
   signal Inb : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Cathode_A : std_logic;
   signal Cathode_B : std_logic;
   signal Anode_outs : std_logic_vector(6 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TDM_dis PORT MAP (
          reset => reset,
          Clock => Clock,
          InA => InA,
          Inb => Inb,
          Cathode_A => Cathode_A,
          Cathode_B => Cathode_B,
          Anode_outs => Anode_outs
        );

	Clock <= not Clock after 50ns;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--stimulus 1 &2
		reset <= '1';
		InA <= "0110";
		InB <= "1110";
		wait for 75 ns;
		reset <= '0';
		wait for 200 ns;
		
		--stimulus 3 &4
		reset <= '0';
		InA <= "0000";
		InB <= "1010";
		wait for 200 ns;
		
		--stimulus 5&6
		reset <= '0';
		InA <= "0011";
		InB <= "1000";
		wait for 200 ns;
		
			
		--stimulus 7&8
		reset <= '0';
		InA <= "1001";
		InB <= "0110";
		wait for 200 ns;
		
		--stimulus 9&10
		reset <= '1';
		InA <= "1101";
		InB <= "0100";
		wait for 200 ns;


      wait;
   end process;

END;
