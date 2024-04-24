library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
use ieee.std_logic_unsigned.all;

entity Dual_Port_Ram is
port(
din_a, din_b:in std_logic_vector(7 downto 0);
dout_a, dout_b: out std_logic_vector(7 downto 0);
addr_a, addr_b: in std_logic_vector(7 downto 0);
clk_a, clk_b: in std_logic;
en_a, en_b: in std_logic;
wr_re_a, wr_re_b: in std_logic
);
end Dual_Port_Ram;

architecture Behavioral of Dual_Port_Ram is
type memory is array(0 to 255)of std_logic_vector(7 downto 0);
shared variable RAM: memory; 
signal douta: std_logic_vector(7 downto 0) := (others => '0');
signal doutb: std_logic_vector(7 downto 0) := (others => '0');
begin
process(clk_a)

begin
if(clk_a' event and clk_a = '1') then
	if(en_a = '1') then
		if( wr_re_a = '1') then RAM(conv_integer(addr_a)) := din_a;			
		elsif(wr_re_a = '0') then
		douta <= RAM(conv_integer(addr_a));
		end if;
	end if;
end if;
end process;
dout_a <= douta;
process(clk_b)

begin
if(clk_b' event and clk_b = '1') then
	if(en_b = '1') then
		if( wr_re_b = '1') then RAM(conv_integer(addr_b)) := din_b;
		elsif(wr_re_b = '0') then
		doutb <= RAM(conv_integer(addr_b));
		end if;
	end if;
end if;
end process;

dout_b <= doutb;

end Behavioral;
