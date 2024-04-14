
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_Counter IS
Generic(periode_clk: time := 10 ns);
END TB_Counter;
 
ARCHITECTURE behavior OF TB_Counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         clk : IN  std_logic;
         rco : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs

   signal clk : std_logic := '0';

 	--Outputs
   signal rco : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          clk => clk,
          rco => rco);
			 
clk <= not clk after periode_clk/2;

--loadn <= '0' after 90 ns , '1' after 100 ns;
--clrn <= '0' after 120 ns;

END;
