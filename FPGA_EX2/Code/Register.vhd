library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Reg is

Generic ( n: integer range 0 to 63 := 8);
port( input : in std_logic_vector(n-1 downto 0);
		set : in std_logic;
		reset: in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end Reg;

architecture Behavioral of Reg is

signal Qout: std_logic_vector(n-1 downto 0):= (others => '0');
begin

process(clk)

begin
if (clk' event and clk = '1') then
	if ( set = '1' ) then 
		Qout <= ( others => '1');
	elsif ( reset = '0') then 
		Qout <= (others => '0');
	else
	Qout <= input;
	end if;
end if;
end process;

Q <= Qout;
end Behavioral;

