--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Devashish Bishnoi 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY nbit_tri_buff_tb IS
END nbit_tri_buff_tb;
 
ARCHITECTURE behavior OF nbit_tri_buff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nbit_tri_buff
    PORT(
         Data_in : IN  std_logic_vector(3 downto 0);
         enable : IN  std_logic;
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic_vector(3 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbit_tri_buff PORT MAP (
          Data_in => Data_in,
          enable => enable,
          Output => Output
        );



 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Data_in <= "0000";
		enable <= '0' ;
		
		wait for 100 ns;	
		Data_in <= "0000";
		enable <= '1' ;
		
		wait for 100 ns;	
		Data_in <= "1111";
		enable <= '1' ;


      -- insert stimulus here 

      wait;
   end process;

END;
