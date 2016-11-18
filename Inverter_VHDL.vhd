----------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe 
-- 
-- Create Date:    15:19:16 10/09/2016 
-- Design Name:    Inverter
-- Module Name:    Inverter_VHDL - Behavioral 
-- Project Name:   DSD LAB 1
-- Target Devices: 
-- Tool versions: 
-- Description:    Single Inverter.
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

entity Inverter_VHDL is
    Port ( a : in  STD_LOGIC;
           b : out  STD_LOGIC);
end Inverter_VHDL;

architecture Behavioral of Inverter_VHDL is

begin
	process(a)
		begin
			b <= (not a) after 7ns;
	end process;
end Behavioral;

