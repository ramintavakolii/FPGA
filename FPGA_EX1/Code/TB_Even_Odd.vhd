LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all; 

ENTITY TB_Even_Odd IS
END TB_Even_Odd;
 
ARCHITECTURE behavior OF TB_Even_Odd IS 
 
   
 
    COMPONENT Even_Odd
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         output : OUT  SIGNED(8 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : SIGNED(8 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Even_Odd PORT MAP (
          input => input,
          output => output
        );

input<= "00011000" after 20 ns, "00100000" after 40 ns, "00111000" after 60ns;

END;
