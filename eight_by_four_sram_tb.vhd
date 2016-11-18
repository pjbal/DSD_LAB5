--------------------------------------------------------------------------------
-- Company: Queen Mary University
-- Engineer: Chris Harte
--
-- Create Date:   14:05:54 10/31/2008
-- Design Name:   eight_by_four_sram
-- Module Name:   eight_by_four_sram_tb.vhd
-- Project Name:  Lab 5
-- Target Device: XCR3064xl-6pc44
-- Tool versions: Xilinx ISE	   7.104i and ModelSim XE III 6.0a starter   
-- Description: test bench for 8 x 4-bit SRAM  
-- 
-- VHDL Test Bench Created by ISE for module: eight_by_four_sram
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

ENTITY eight_by_four_sram_tb_vhd IS
END eight_by_four_sram_tb_vhd;

ARCHITECTURE behavior OF eight_by_four_sram_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT eight_by_four_sram
	PORT(
		address : IN std_logic_vector(2 downto 0);
		read_notwrite : IN std_logic;
		chip_select : IN std_logic;       
		data_inout : INOUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL read_notwrite :  std_logic := '1';
	SIGNAL chip_select :  std_logic := '0';
	SIGNAL address :  std_logic_vector(2 downto 0) := (others=>'0');

	--BiDirs
	SIGNAL data_inout :  std_logic_vector(3 downto 0);

BEGIN

-- *************** Comments on how this test bench works ***************** --		

-- From the designs of the components that make up the memory we can calculate
-- the expected timing values for our SRAM device.

-- The delay times associated with internal components are:

-- (a) three_to_eight_decoder  	14ns to decode
-- (b) nbit_tristate_buffer 		7ns to change state
-- (c) sram_cell : output			7ns for output to enable/disable
--	(d) sram_cell : write logic	7ns for data to be written 
-- (e) eight_by_four_sram			7ns for read/write logic
-- (f) dlatch : data input			7ns for Q to change state	

-- Thus we can predict SRAM read timings for this device based of the internal
-- circuit designs and delay times above:
-- T_AA 	= a + c + b = 28ns
-- T_OE 	= e + c 		= 14ns
-- T_ACS	= e + c		= 14ns 
-- T_OZ	= e + c		= 14ns 
-- T_OH	= a + c + b = 28ns

-- Likewise, we can also predict write timings for this device:
-- T_AS	= a			= 14ns
-- T_WP	= e + d + f	= 21ns
-- T_CSW	= e + d + f	= 21ns
-- T_AH	= e + c		= 21ns
-- T_DS	= f			= 7ns
-- T_DH	= e + d		= 14ns

-- Refering to the lecture notes on SRAM read and write timing it is possible
-- to design a test bench that will write the following data values into the 
-- memory then read them back again:

-- Address  : Data value
--		000	:	0101
--		001	:	1010
--		010	:	1100
--		011	:	0011
--		100	:	0111
--		101	:	1110
--		110	:	0000
--		111	:	1111

-- At the start of the test bench contents of all memory cells is undefined so
-- we expect to see UUUU as the output. 

-- NOTE: This test bench should be run for 1300ns to see all the results

-- NOTE: the SRAM devices do not need a synchronous clock signal

-- NOTE: when you see the simulation of the read cycles, take note
-- of the delay time between the start of the chip select and the data
-- appearing at the output. This test bench tests the device to the limit 
-- of its stability by using the shortest possible timings. The larger 
-- devices you will make this lab have longer delay times so you must 
-- be careful when you write test benches for them.
	
-- *********************************************************************** --
	
	-- Instantiate the Unit Under Test (UUT)
	uut: eight_by_four_sram PORT MAP(
		address => address,
		read_notwrite => read_notwrite,
		chip_select => chip_select,
		data_inout => data_inout
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- *** Begin a CS controlled write ***

		address <= "000";	-- set up address 0

		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write

		wait for 22 ns; -- wait for at least T_AS
		chip_select <= '1'; 	-- set CS to 1 to start the write operation

		wait for 14 ns;
		data_inout <= "0101"; -- set up data
		--(this can happen any time as long as it occurs at least T_DS 
		-- before chip select is set to 0 at the end of the write)

		wait for 14 ns; -- 14 + the previous 14 > T_CSW
		chip_select <= '0';	-- set CS back to 0 to end the write operation

		wait for 22 ns; -- wait for at least T_AH  (T_AH > T_DH)

		-- ** first write cycle is complete
		-- ** complete 7 more write cycles to fill the memory with values...

	   -- Write Address 1
		address <= "001";		 -- set up address
		data_inout <= "1010"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 2
		address <= "010";		 -- set up address
		data_inout <= "1100"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 3
		address <= "011";		 -- set up address
		data_inout <= "0011"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 4
		address <= "100";		 -- set up address
		data_inout <= "0111"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 5
		address <= "101";		 -- set up address
		data_inout <= "1110"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 6
		address <= "110";		 -- set up address
		data_inout <= "0000"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

	   -- Write Address 7
		address <= "111";		 -- set up address
		data_inout <= "1111"; -- set up data
		read_notwrite <= '0'; -- set Read/notWrite to 0 ready for the write
		wait for 22 ns; 		-- wait for at least T_AS
		chip_select <= '1';	-- set CS to 1 to start the write operation
		wait for 22 ns; 		-- wait for at least T_CSW
		chip_select <= '0';	-- set chip select back to 0 to end the write operation
		wait for 22 ns; 		-- wait for at least T_AH  (T_AH > T_DH)

		-- ** write cycles complete - set up reading memory

		-- VERY IMPORTANT: set up data bus to Hi-Z so we can read it
		data_inout <= "ZZZZ";
		
		-- set Read/notWrite to 1 ready for the read 
		read_notwrite <= '1';

		address <= "000";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 40 ns; 		-- Wait a long time for the first read
		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ  


		-- read address 1
		address <= "001";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ 

		-- read address 2
		address <= "010";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ
		
		-- read address 3
		address <= "011";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ
		
		-- read address 4
		address <= "100";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ
		
		-- read address 5
		address <= "101";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ
		
		-- read address 6
		address <= "110";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ
		
		-- read address 7
		address <= "111";		 -- set up address
		wait for 28 ns; 		-- wait for T_AA to make sure the output is valid
		chip_select <= '1';	-- set CS to 1 to start the read operation
		wait for 15 ns; 		-- wait for at least T_ACS		
		chip_select <= '0';	-- set chip select back to 0 to end the read 
		wait for 16 ns; 		-- wait for more than T_OZ

		wait; -- will wait forever
	END PROCESS;

END;
