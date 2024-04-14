library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
Generic(n: integer range 0 to 63 := 19);
port(IN1 : in std_logic_vector(n-4 downto 0);
	  IN2 : in std_logic_vector(n downto 0);
	  --Cout : out std_logic;
	  ADD : out std_logic_vector( n downto 0));
end Adder;

architecture Behavioral of Adder is

--signal sum : std_logic_vector( n downto 0);

begin

ADD <= "0000"&IN1 + IN2;

end Behavioral;

