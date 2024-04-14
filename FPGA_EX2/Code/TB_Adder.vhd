LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
 
ENTITY TB_Adder IS

END TB_Adder;
 
ARCHITECTURE behavior OF TB_Adder IS 
 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Adder
    PORT(
         IN1 : IN  std_logic_vector(15 downto 0);
         IN2 : IN  std_logic_vector(19 downto 0);
         ADD : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IN1 : std_logic_vector(15 downto 0) := (others => '0');
   signal IN2 : std_logic_vector(19 downto 0) := (others => '0');

 	--Outputs
   signal ADD : std_logic_vector(19 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          IN1 => IN1,
          IN2 => IN2,
          ADD => ADD
        );

IN1 <= conv_std_logic_vector(16,16) after 15 ns, conv_std_logic_vector(17,16) after 35 ns;
IN2 <= conv_std_logic_vector(23,20) after 15 ns, conv_std_logic_vector(34,20) after 25 ns;

END;
