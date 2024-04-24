LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_unsigned.all;
 
ENTITY TB_LIFO IS
END TB_LIFO;
 
ARCHITECTURE behavior OF TB_LIFO IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT LIFO
    PORT(
         datain : IN  std_logic_vector(7 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0);
         Clk : IN  std_logic; En : IN  std_logic; RW : IN  std_logic;
         Empty : OUT  std_logic; Full : OUT  std_logic;
			pointer: out integer range 0 to 255 ;
         add : integer range 0 to 255
        );
    END COMPONENT;
    
   --Inputs
   signal datain : std_logic_vector(7 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal En : std_logic := '0';
   signal RW : std_logic := '0';
   signal add : integer range 0 to 255 := 0 ;

 	--Outputs
   signal dataout : std_logic_vector(7 downto 0);
   signal Empty : std_logic;
   signal Full : std_logic;
	signal pointer: integer range 0 to 255;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LIFO PORT MAP (
          datain => datain,
          dataout => dataout,
          Clk => Clk,
          En => En,
          RW => RW,
          Empty => Empty,
          Full => Full,
			 pointer => pointer,
          add => add
        );

  clk <= not clk after CLK_period/2;
  datain <= X"09" after 10 ns, X"20" after 20 ns, X"0F" after 30 ns, X"F2" after 40 ns,
  X"4F" after 50 ns, X"7E" after 60 ns ;
  En <= '1';
  RW <= '1' after 8 ns, '0' after 70 ns;
  add <= 5;
END;
