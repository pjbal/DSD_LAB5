----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    20:35:40 11/18/2016 
-- Design Name: 	TDS display Unit
-- Module Name:    TDM_dis - Behavioral 
-- Project Name:  LAB5
-- Target Devices: 
-- Tool versions: 
-- Description: device tp diplay the inputs InA and InB on two 7-segment displays
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

entity TDM_dis is
    Port ( reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           InA : in  STD_LOGIC_VECTOR (3 downto 0);
           Inb : in  STD_LOGIC_VECTOR (3 downto 0);
           Cathode_A : out  STD_LOGIC;
           Cathode_B : out  STD_LOGIC;
           Anode_outs : out  STD_LOGIC_VECTOR (6 downto 0));
end TDM_dis;

architecture Behavioral of TDM_dis is

--define t-flip flop I/0s to use to flip between the two diplays
component T_flipflop
    Port ( reset : in std_logic;
	 		  Clk : in std_logic;
           Q : inout std_logic;
           Q_bar : inout std_logic);
end component;

--define n-bit tri state buffers I/O's to use to correct use of the common buss between the inputs and decoder
component nbit_tri_buff
	Generic ( n : positive := 4 );

	Port ( Data_in : in std_logic_vector(n-1 downto 0);
           enable : in std_logic;
           Output : out std_logic_vector(n-1 downto 0));
end component;

--define decoder I/Os to use for outputing the correct outputs bit to diplay the input number
component sixteen_by_sevenbit_sevSegDis_decROM
    Port ( address : in  STD_LOGIC_VECTOR (3 downto 0);
           data_outputs : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

--define internal signals
signal sig_Cathode_A : std_logic;--signal to connect tflip flop to n-nbit tristate 1 and Cathode_A output
signal sig_Cathode_B : std_logic;--signal to connect tflip flop to n-nbit tristate 2 and Cathode_B output
signal sig_Output_to_address :std_logic_vector (3 downto 0) := (others => '0');--signal to connect n-nbit tristates to 16x7 decoder rom

begin

	initTflip: T_flipflop port map(reset, clock, sig_Cathode_A, sig_Cathode_B); --instatiate T-flip to flip between the two displays

	initNbitTri1: nbit_tri_buff port map(InA, sig_Cathode_A, sig_Output_to_address); --instatiate tri state buffer to allow control over common connection with 16x7 decoder
	initNbitTri2: nbit_tri_buff port map(InB, sig_Cathode_B, sig_Output_to_address); --instatiate tri state buffer to allow control over common connection with 16x7 decoder

	initdecoder: sixteen_by_sevenbit_sevSegDis_decROM port map (sig_Output_to_address, Anode_outs); --instantiate decoder to give output bits to display coorect number on segment for given input

	Cathode_A <= sig_Cathode_A; --connect cathode signal from t-flip flop Q to output cathode line
	Cathode_B <= sig_Cathode_B; --connect cathode signal from t-flip flop Q_bar to output cathode line
	
end Behavioral;

