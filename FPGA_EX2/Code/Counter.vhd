library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Counter is

port( 
		clk: in std_logic;
		rco: out std_logic
		);
	  
end Counter;

architecture Behavioral of Counter is

signal R: std_logic := '1';

begin

process(clk)

variable count: std_logic_vector(3 downto 0) := "0000";
begin

if( clk' event and clk = '1' )then

	count := count + "0001";
	R <= '1';
	if ( count = "1001" )then
   R <= '0';
	elsif ( count = "1010" )then
	count := "0000";
	
	end if;
end if;
end process;

rco <= R;
end Behavioral;

