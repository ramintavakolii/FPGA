
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--USE ieee.numeric_std.ALL;
 
ENTITY TB_Reg IS
Generic(periode_clk: time := 10 ns);
END TB_Reg;
 
ARCHITECTURE behavior OF TB_Reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         set : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal set : std_logic := '0';
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg PORT MAP (
          input => input,
          set => set,
          reset => reset,
          clk => clk,
          Q => Q
        );
		  
clk <= not clk after periode_clk/2;
input <= "01000000" after 30 ns, "11001100"after 45 ns , "10011111" after 110 ns;
set <= '1' after 150 ns;
reset <= '0' after 100 ns;

END;
