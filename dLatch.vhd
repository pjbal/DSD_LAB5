----------------------------------------------------------------------------------
-- Company: QMUL DSD Group2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    21:44:15 11/19/2016 
-- Design Name: 	D-latch
-- Module Name:    dLatch - Behavioral 
-- Project Name: 	LAB5
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--					-Two input NOR
--					-Inverter
--					-two input AND
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

entity dLatch is
    Port ( D : in  STD_LOGIC;
           c : in  STD_LOGIC;
           q : inout  STD_LOGIC;
           q_bar : inout  STD_LOGIC);
end dLatch;

architecture Behavioral of dLatch is

component Inverter_VHDL
    Port ( a : in  STD_LOGIC;
           b : out  STD_LOGIC);
end component;

component TwoInputAND_VHDL
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

component TwoInputNOR_VHDL
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

signal sig_not_to_and : std_logic := '0';--signal to invert input to AND A to allow AND A and B to get negated inputs
signal sig_andA_to_norA : std_logic := '0';--signal from and A output to XNOR A Input
signal sig_andB_to_norB : std_logic := '0';--signal from and B output to XNOR B input

begin

	--instantiate components
	initNotA: Inverter_VHDL port map (d, sig_not_to_and);--instantiate inverter to negate input into and A. to give inverted data to and A than B
	initANDA: TwoInputAND_VHDL port map (sig_not_to_and, c, sig_andA_to_norA); --instantiate and gate A
	initANDB: TwoInputAND_VHDL port map (c, D, sig_andB_to_norB); --instantiate and gate AinitNORA: TwoInputNOR_VHDL port map 
	initNORA: TwoInputNOR_VHDL port map (sig_andA_to_norA, Q_bar, Q);--instantiate NOR Gate A
	initNORB: TwoInputNOR_VHDL port map (Q, sig_andB_to_norB, Q_bar);--instantiate NOR Gate B

end Behavioral;

