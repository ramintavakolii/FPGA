LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL; 

ENTITY TB_Freq_div IS
generic (   
            clk_period : time := 1 ns -- per le tempistiche
        );
END TB_Freq_div;
 
ARCHITECTURE behavior OF TB_Freq_div IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Freq_div
    PORT(
         clk : IN  std_logic;
         duty_cycle : IN  std_logic_vector(3 downto 0);
         out_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal duty_cycle : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal out_clk : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Freq_div PORT MAP (
          clk => clk,
          duty_cycle => duty_cycle,
          out_clk => out_clk
        );

 
clk <= NOT clk after clk_period/2;
duty_cycle <= "0100"  ;

END;
