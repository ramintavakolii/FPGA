library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier is
Generic(n: integer range 0 to 63 := 8);
port(IN1 : in std_logic_vector(n-1 downto 0);
	  IN2 : in std_logic_vector(n-1 downto 0);
	  MUL : out std_logic_vector( n+n-1 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin

MUL <= IN1 * IN2;
end Behavioral;

