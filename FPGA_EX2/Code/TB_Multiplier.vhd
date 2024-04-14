LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
use ieee.std_logic_unsigned.all;
 
ENTITY TB_Multiplier IS
END TB_Multiplier;
 
ARCHITECTURE behavior OF TB_Multiplier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplier
    PORT(
         IN1 : IN  std_logic_vector(7 downto 0);
         IN2 : IN  std_logic_vector(7 downto 0);
         MUL : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IN1 : std_logic_vector(7 downto 0) := (others => '0');
   signal IN2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MUL : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier PORT MAP (
          IN1 => IN1,
          IN2 => IN2,
          MUL => MUL
        );

IN1 <= conv_std_logic_vector(68,8) after 15 ns, conv_std_logic_vector(57,8) after 35 ns;
IN2 <= conv_std_logic_vector(23,8) after 15 ns, conv_std_logic_vector(34,8) after 25 ns;

END;
