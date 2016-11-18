--------------------------------------------------------------------------------
-- Company: Queen Mary University
-- Engineer: Chris Harte
--
-- Create Date:   16:55:41 10/29/2008
-- Design Name:   three_to_eight_decoder
-- Module Name:   three_to_eight_decoder_tb.vhd
-- Project Name:  Lab 5
-- Target Device: XCR3064xl-6pc44
-- Tool versions: Xilinx ISE	   7.104i and ModelSim XE III 6.0a starter  
-- Description: Test bench for three to eight decoder  
-- 
-- VHDL Test Bench Created by ISE for module: three_to_eight_decoder
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY three_to_eight_decoder_tb_vhd IS
END three_to_eight_decoder_tb_vhd;

ARCHITECTURE behavior OF three_to_eight_decoder_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT three_to_eight_decoder
	PORT(
		OE : IN std_logic;
		address : IN std_logic_vector(2 downto 0);          
		O_outputs : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL OE :  std_logic := '0';
	SIGNAL address :  std_logic_vector(2 downto 0) := (others=>'0');

	--Outputs
	SIGNAL O_outputs :  std_logic_vector(7 downto 0);


-- *************** Comments on how this test bench works ***************** --		

-- This is a three to eight decoder so when the enable input is '1' we 
-- expect to see a '1' on output O(n) where n is the 'address' value. 

-- OE Address O7 O6 O5 O4 O3 O2 O1 O0
--  1   000   0  0  0  0  0  0  0  1
--  1   001   0  0  0  0  0  0  1  0
--  1   010   0  0  0  0  0  1  0  0
--  1   011   0  0  0  0  1  0  0  0
--  1   100   0  0  0  1  0  0  0  0
--  1   101   0  0  1  0  0  0  0  0
--  1   110   0  1  0  0  0  0  0  0
--  1   111   1  0  0  0  0  0  0  0
--  0   XXX   0  0  0  0  0  0  0  0

-- ************************************************************************ --

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: three_to_eight_decoder PORT MAP(
		OE => OE,
		address => address,
		O_outputs => O_outputs
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		OE <= '1';
		address <= "000";
		--  expect 00000001
		
		wait for 50 ns;

		address <= "001";
		--  expect 00000010

		wait for 50 ns;

		address <= "010";
		--  expect 00000100
	
		wait for 50 ns;

		address <= "011";
		--  expect 00001000

		wait for 50 ns;

		address <= "100";
		--  expect 00010000

		wait for 50 ns;

		address <= "101";
		--  expect 00100000
		wait for 50 ns;

		address <= "110";
		--  expect 01000000

		wait for 50 ns;

		address <= "111";
		--  expect 10000000

		wait for 50 ns;

		OE <= '0';
		--  expect 00000000
		

		wait; -- will wait forever
	END PROCESS;

END;































































