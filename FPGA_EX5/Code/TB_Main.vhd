LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_Main IS
END TB_Main;
 
ARCHITECTURE behavior OF TB_Main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         Din : IN  std_logic_vector(7 downto 0);
         YA : OUT  std_logic_vector(17 downto 0);
         YB : OUT  std_logic_vector(17 downto 0);
         YC : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal clk : std_logic := '0';
   signal Din : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal YA : std_logic_vector(17 downto 0);
   signal YB : std_logic_vector(17 downto 0);
   signal YC : std_logic_vector(17 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          Din => Din,
          YA => YA,
          YB => YB,
          YC => YC
        );
clk<=not clk after 50 ns;
Din<=x"01" after 0 ns ,x"02" after 100  ns ,x"03" after 200  ns ,x"04" after 300  ns ,x"05" after 400  ns ,
x"06" after 500  ns ,x"07" after 600  ns ,x"08" after 700  ns ,x"09" after 800  ns ,x"0A" after 900  ns ,
x"01" after 1000 ns ,x"02" after 1100 ns ,x"03" after 1200 ns ,x"04" after 1300 ns ,x"05" after 1400 ns ,
x"06" after 1500 ns ,x"07" after 1600 ns ,x"08" after 1700 ns ,x"09" after 1800 ns ,x"0A" after 1900 ns ,
x"01" after 2000 ns,x"10" after 2100 ns ;

END;
