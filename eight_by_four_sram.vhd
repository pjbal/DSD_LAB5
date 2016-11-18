--------------------------------------------------------------------------------
-- Company: Queen Mary University
-- Engineer: Chris Harte
--
-- Create Date:    17:32:20 10/29/08
-- Design Name:    335labs
-- Module Name:    eight_by_four_sram - Behavioral
-- Project Name:   Lab 5
-- Target Device:  XCR3064xl-6pc44
-- Tool versions:  Xilinx ISE	   7.104i and ModelSim XE III 6.0a starter   
-- Description: an 8 x 4 ram device
--
-- Dependencies: m_by_n_sram_array, nbit_tristate_buffer, three_to_eight_decoder
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ********* COMMENTS ON HOW THIS DEVICE DESIGN WORKS ******************
--
--	See page 9 of lab script 5
--
-- ENTITY 
-- the entity declaration defines the interface of "eight_by_four_sram" 
-- Note that the data_inout port is of type "inout"
--
-- ARCHITECTURE 
-- architecture describes the internal structure of the device 
--
-- COMPONENTS
-- This architecture requires three sub-components:
-- * "m_by_n_sram_array"
-- * "three_to_eight_decoder"
-- * "nbit_tristate_buffer"
-- 
-- SIGNALS
--	This device uses four internal signals, two of which are bit vectors
-- and two are single bit signals 
--
-- INSTANCES
--	The three sub-components are instantiated in the main body of the 
-- architecture code and their ports are mapped appropriately according 
-- to the design. Note that the m_by_n_sram_array requires two values in its 
-- generic map.
--
-- NOTE: This device will NOT compile or pass a syntax check until code 
-- files for the three sub-compontents are implemented.  
--
-- *********************************************************************

--ENTITY
entity eight_by_four_sram is
    Port ( address : in std_logic_vector(2 downto 0);
           read_notwrite : in std_logic;
           chip_select : in std_logic;
           data_inout : inout std_logic_vector(3 downto 0));
end eight_by_four_sram;

-- ARCHITECTURE
architecture Behavioral of eight_by_four_sram is

-- COMPONENTS
component three_to_eight_decoder
    Port ( 	OE : in std_logic;
	 			address : in std_logic_vector(2 downto 0);
				O_outputs : out std_logic_vector(7 downto 0));
end component;

component m_by_n_sram_array  
	 Generic (m : positive;
	 			 n : positive);
    Port ( data_in : in std_logic_vector(n-1 downto 0);
           select_lines : in std_logic_vector(m-1 downto 0);
			  write_enable : in std_logic;
			  data_out : out std_logic_vector(n-1 downto 0));
end component;

component nbit_tri_buff
	 Generic (n : positive);
    	Port ( Data_in : in std_logic_vector(n-1 downto 0);
           enable : in std_logic;
           Output : out std_logic_vector(n-1 downto 0));
end component;

-- SIGNALS
signal select_lines : std_logic_vector (7 downto 0);
signal array_to_tribuff : std_logic_vector (3 downto 0);
signal array_enable, buff_enable : std_logic;

begin

-- LOGIC ASSIGNMENTS:
array_enable <= (not read_notwrite) and chip_select after 7 ns;

buff_enable <= read_notwrite and chip_select after	7 ns;


-- DEVICE INSTANCES
decode : three_to_eight_decoder port map ('1', address, select_lines);

ramarray : m_by_n_sram_array generic map (8, 4) port map (data_inout, select_lines, array_enable, array_to_tribuff);

tribuff : nbit_tri_buff generic map (4) port map (array_to_tribuff, buff_enable, data_inout);

end Behavioral;
