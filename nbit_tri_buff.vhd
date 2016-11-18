-- Company: QMUL DSD Group 2
-- Engineer: Devashish Bishnoi 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_tri_buff is
	Generic ( n : positive := 4 );

	Port ( Data_in : in std_logic_vector(n-1 downto 0);
           enable : in std_logic;
           Output : out std_logic_vector(n-1 downto 0));
end nbit_tri_buff;

architecture Behavioral of nbit_tri_buff is

component tri_buff
	Port ( Input : in std_logic;
           enable : in std_logic;
           Output : out std_logic);
end component;

begin

inst : for i in n-1 downto 0 generate

	tri_buffer : tri_buff port map (Data_in(i), enable, Output(i));

end generate;

end Behavioral;