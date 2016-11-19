----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    22:40:43 11/19/2016 
-- Design Name: 	Static RAM Cell
-- Module Name:    staticRAM_cell - Behavioral 
-- Project Name: 		Lab 5
-- Target Devices: 
-- Tool versions: 
-- Description: device to allow storage of a bit, when cell select is 0 then output should be high  
--						impendence and when 1 then ouput should activate and can read o write depenant on control bit. 
-- Dependencies: 
--						-TwoInputAND_VHDL
--						-dLatch
--							****
--						-tri_buff
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity staticRAM_cell is
    Port ( Data_in : in  STD_LOGIC;
           Cell_select : in  STD_LOGIC;
           Write_enable : in  STD_LOGIC;
           Data_out : out  STD_LOGIC);
end staticRAM_cell;



architecture Behavioral of staticRAM_cell is

component TwoInputAND_VHDL
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

component dLatch
    Port ( D : in  STD_LOGIC;
           c : in  STD_LOGIC;
           q : inout  STD_LOGIC;
           q_bar : inout  STD_LOGIC);
end component;

component tri_buff
    Port ( Input : in std_logic;
           enable : in std_logic;
           Output : out std_logic);
end component;

signal sig_and_dlatch_c: std_logic := '0'; --signal to connect and gate and dlatch, containg control signal of reading or writing
signal sig_dlatch_tri: std_logic := '0'; --signal to conect dlatch to tri buffer so that the access to the buss can be controlled by the tri state buffer


begin

initConAnd: TwoInputAND_VHDL port map (Cell_Select, Write_Enable, sig_and_dlatch_c); --instantiate and gate to control hold or write state of d-latch, can only write if selected and write is high
initDLatch: dLatch port map (Data_In, sig_and_dlatch_c, sig_dlatch_tri); --instantiate d-latch to store the bit
intTriBuf: tri_buff port map (sig_dlatch_tri, Cell_Select, Data_Out); --instantiate tri state buffer to control access of read data to further parts of the circuit


end Behavioral;

