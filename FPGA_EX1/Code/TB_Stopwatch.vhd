LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL; 

ENTITY TB_Stopwatch IS
generic (   
            clk_period : time := 1 ns -- per le tempistiche
        );
END TB_Stopwatch;
 
ARCHITECTURE behavior OF TB_Stopwatch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Stopwatch
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         min : OUT  std_logic_vector(6 downto 0);
         sec : OUT  std_logic_vector(6 downto 0);
         Hsec : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '1';
   signal reset : std_logic := '1';
   signal start : std_logic := '1';

 	--Outputs
   signal min : std_logic_vector(6 downto 0);
   signal sec : std_logic_vector(6 downto 0);
   signal Hsec : std_logic_vector(6 downto 0);


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Stopwatch PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          min => min,
          sec => sec,
          Hsec => Hsec
        );
	
clk <= NOT clk after clk_period/2;
start <= '0' after 5ns , '1' after 25 ns;
reset <= '0' after 5ns , '1' after 60 ns,'0' after 90 ns;
	
	
END;






