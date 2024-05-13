library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Freq_div is
    Port ( clk : in  STD_LOGIC;
           duty_cycle : in  STD_LOGIC_VECTOR (3 downto 0);
           out_clk : out  STD_LOGIC);
end Freq_div;

architecture Behavioral of Freq_div is

signal dcycle: STD_LOGIC_VECTOR (7 downto 0);
signal count: integer range 0 to 255:= 0;
signal output: STD_LOGIC:= '0';

begin
dcycle <= ( duty_cycle) * "1010" when (duty_cycle < "1010");
--count <= 100 - (conv_integer(dcycle))

process(clk)
begin
if (clk' event and clk='0') then
	count <= count + 1;
	if( count = 99 and output = '1' ) then
		count <= 0;
		output <= '0';
	elsif((99 - CONV_INTEGER(dcycle)) <= count ) then
		output <= '1';

	end if;
end if;

end process;
out_clk <= output;
end Behavioral;



