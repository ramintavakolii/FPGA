LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Dual_Port_Ram IS
END TB_Dual_Port_Ram;
 
ARCHITECTURE behavior OF TB_Dual_Port_Ram IS 
 
    COMPONENT Dual_Port_Ram
    PORT(
         din_a : IN  std_logic_vector(7 downto 0);
         din_b : IN  std_logic_vector(7 downto 0);
         dout_a : OUT  std_logic_vector(7 downto 0);
         dout_b : OUT  std_logic_vector(7 downto 0);
         addr_a : IN  std_logic_vector(7 downto 0);
         addr_b : IN  std_logic_vector(7 downto 0);
         clk_a : IN  std_logic;
         clk_b : IN  std_logic;
         en_a : IN  std_logic;
         en_b : IN  std_logic;
         wr_re_a : IN  std_logic;
         wr_re_b : IN  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal din_a : std_logic_vector(7 downto 0) := (others => '0');
   signal din_b : std_logic_vector(7 downto 0) := (others => '0');
   signal addr_a : std_logic_vector(7 downto 0) := (others => '0');
   signal addr_b : std_logic_vector(7 downto 0) := X"01";
   signal clk_a : std_logic := '0';
   signal clk_b : std_logic := '0';
   signal en_a : std_logic := '1';
   signal en_b : std_logic := '1';
   signal wr_re_a : std_logic := '0';
   signal wr_re_b : std_logic := '0';

 	--Outputs
   signal dout_a : std_logic_vector(7 downto 0);
   signal dout_b : std_logic_vector(7 downto 0);

   constant clk_a_period : time := 8 ns;
   constant clk_b_period : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_Port_Ram PORT MAP (
          din_a => din_a,
          din_b => din_b,
          dout_a => dout_a,
          dout_b => dout_b,
          addr_a => addr_a,
          addr_b => addr_b,
          clk_a => clk_a,
          clk_b => clk_b,
          en_a => en_a,
          en_b => en_b,
          wr_re_a => wr_re_a,
          wr_re_b => wr_re_b
        );	
		  
	 addr_a <= X"01" after 10 ns, X"03" after 20 ns, X"05" after 30 ns, X"07" after 40 ns, X"09" after 50 ns,
				  X"04" after 60 ns, X"09" after 70 ns, X"0A" after 80 ns, X"03" after 90 ns, X"06" after 100 ns ;
				  
	 addr_b <= X"02" after 10 ns, X"04" after 20 ns, X"06" after 30 ns, X"08" after 40 ns, X"0A" after 50 ns,
				  X"02" after 60 ns, X"08" after 70 ns, X"01" after 80 ns, X"05" after 90 ns, X"07" after 100 ns ; 
	 --en_a <= '1' ;
	 --en_b <= '1' ;
	 
	 din_a <= X"0F" after 10 ns, X"09" after 20 ns, X"A6" after 30 ns, X"F7" after 40 ns, X"E9" after 50 ns;
	 din_b <= X"0D" after 10 ns, X"04" after 20 ns, X"A6" after 30 ns, X"D7" after 40 ns, X"FD" after 50 ns ;
	 
	 wr_re_a <= '1' after 4 ns , '0' after 60 ns;
    wr_re_b <= '1' after 4 ns , '0' after 60 ns;
	 
	 clk_a <= not clk_a after clk_a_period/2;
	 clk_b <= not clk_b after clk_b_period/2;
END;
