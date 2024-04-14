LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY TB_CONVOLUTION IS
GENERIC( periode : time := 20 ns);
END TB_CONVOLUTION;
 
ARCHITECTURE behavior OF TB_CONVOLUTION IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONVOLUTION
    PORT(
         clkp : IN  std_logic;
         input_a : IN  std_logic_vector(7 downto 0);
         input_x : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clkp : std_logic := '0';
   signal input_a : std_logic_vector(7 downto 0) := (others => '0');
   signal input_x : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(19 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONVOLUTION PORT MAP (
          clkp => clkp,
          input_a => input_a,
          input_x => input_x,
          Y => Y
        );

 clkp <= not clkp after periode/2;
 input_a <= "00001000" after 10 ns, "00101000" after 30 ns, "00101001" after 50 ns ,"00000110" after 70 ns, "00011000" after 90 ns,
 "00001001" after 110 ns ,"00001000" after 130 ns, "00101000" after 150 ns, "00101001" after 170 ns ,"00000110" after 190 ns, "00011000" after 210 ns,
 "00001000" after 230 ns, "00101000" after 250 ns, "00101001" after 270 ns ,"00000110" after 290 ns, "00011000" after 310 ns,
 "00001001" after 330 ns ,"00001000" after 350 ns, "00101000" after 370 ns, "00101001" after 390 ns ,"00000110" after 410 ns, "00011000" after 430 ns;
 
 input_x <= "00000100" after 10 ns, "00001001" after 30 ns, "00001110" after 50 ns ,"00000001" after 70 ns, "00001000" after 90 ns, 
 "00001001" after 110 ns, "00001000" after 130 ns, "00101000" after 150 ns, "00101001" after 170 ns ,"00000110" after 190 ns, "00011000" after 210 ns,
 "00001000" after 230 ns, "00101000" after 250 ns, "00101001" after 270 ns ,"00000110" after 290 ns, "00011000" after 310 ns,
 "00001001" after 330 ns ,"00001000" after 350 ns, "00101000" after 370 ns, "00101001" after 390 ns ,"00000110" after 410 ns, "00011000" after 430 ns;

END;
