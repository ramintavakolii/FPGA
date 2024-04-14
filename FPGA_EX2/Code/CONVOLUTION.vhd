library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CONVOLUTION is

port(clkp : in std_logic;
	  input_a : in std_logic_vector(7 downto 0);
	  input_x : in std_logic_vector(7 downto 0);
	  Y : out std_logic_vector( 19 downto 0));
	  
end CONVOLUTION;

architecture Structral of CONVOLUTION is

-------------------------------
signal R : std_logic ;
signal reg1, reg2 : std_logic_vector(7 downto 0);
signal mult : std_logic_vector(15 downto 0);
signal sum : std_logic_vector(19 downto 0) ;
signal add_reg : std_logic_vector(19 downto 0);
-------------------------------
 
-- component decleration
-----------------------------------------------------
component Multiplier
generic(n: integer := 8);
port(IN1 : in std_logic_vector(n-1 downto 0);
	  IN2 : in std_logic_vector(n-1 downto 0);
	  MUL : out std_logic_vector( n+n-1 downto 0));
end component;
-----------------------------------------------------
component Adder
Generic(n: integer range 0 to 63 := 19);
port(IN1 : in std_logic_vector(n-4 downto 0);
	  IN2 : in std_logic_vector(n downto 0);
	  ADD : out std_logic_vector( n downto 0));
end component;
-----------------------------------------------------
component Counter
port( 
		clk: in std_logic;
		rco: out std_logic);
end component;
-----------------------------------------------------
component Reg
Generic ( n: integer range 0 to 63 := 8);
port( input : in std_logic_vector(n-1 downto 0);
		set : in std_logic;  -- active high
		reset: in std_logic; -- avtive low
		clk : in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end component;
-----------------------------------------------------
begin

U1 : Multiplier port map ( reg1, reg2, mult);
U3 : Adder port map ( mult, add_reg, sum);
U2 : Counter port map ( clkp,R);

U4: Reg
generic map ( n => 8)
port map ( input_a, '0', '1', clkp, reg1);

U5: Reg
generic map ( n => 8)
port map ( input_x, '0', '1', clkp, reg2);

U6: Reg
generic map ( n => 20)
port map ( sum, '0', R, clkp, add_reg);

U7: Reg
generic map ( n => 20)
port map ( sum, '0', (not R), clkp, Y);

end Structral;

