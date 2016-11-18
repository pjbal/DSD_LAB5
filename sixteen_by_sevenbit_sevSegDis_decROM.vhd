----------------------------------------------------------------------------------
-- Company: QMUL DSD Group2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    19:27:11 11/18/2016 
-- Design Name: 	16 x 7-bit seven-segment decoder ROM 
-- Module Name:    sixteen_by_sevenbit_sevSegDis_decROM - Behavioral 
-- Project Name:  LAB5
-- Target Devices: 
-- Tool versions: 
-- Description: device to take 4bit binary input and output the relevent 8 bit binnary code to light a 7-seg diplay
--
-- Dependencies: 
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

entity sixteen_by_sevenbit_sevSegDis_decROM is
    Port ( address : in  STD_LOGIC_VECTOR (3 downto 0);
           data_outputs : out  STD_LOGIC_VECTOR (6 downto 0));
end sixteen_by_sevenbit_sevSegDis_decROM;

architecture Behavioral of sixteen_by_sevenbit_sevSegDis_decROM is

begin

	--selected signal assignment to send relevent output to light seven segment for given input
	with address select data_outputs <=
		"1111110" when "0000",
		"0110000" when "0001",
		"1101101" when "0010",
		"1111001" when "0011",
		"0110011" when "0100",
		"1011011" when "0101",
		"1011111" when "0110",
		"1110000" when "0111",
		"1111111" when "1000",
		"1111011" when "1001",
		"1101111" when "1010",
		"0011111" when "1011",
		"1001110" when "1100",
		"0111101" when "1101",
		"1001111" when "1110",
		"1000111" when "1111",
		"0000000" when others;


end Behavioral;

