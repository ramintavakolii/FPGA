library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Stopwatch is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  start : in  STD_LOGIC;
           min : out  STD_LOGIC_VECTOR (6 downto 0);
           sec : out STD_LOGIC_VECTOR (6 downto 0);
           Hsec : out  STD_LOGIC_VECTOR (6 downto 0));
end Stopwatch;

architecture Behavioral of Stopwatch is

signal count1: std_logic_vector(6 downto 0):="0000000";
signal count2: std_logic_vector(6 downto 0):="0000000";
signal count3: std_logic_vector(6 downto 0):="0000000";

begin

process(clk, reset)
begin
if reset='1' then count1 <= "0000000"; count2 <= "0000000"; count3 <= "0000000";
elsif (clk' event and clk='1' and start = '1') then 
	count1 <= count1 + "0000001";
	if (count1 = "1100011")then 
	if (count2 = "0111011")then
	if (count3 = "0111011")then
		count1 <= "0000000";
		count2 <= "0000000";
		count3 <= "0000000";
	else
		count3 <= count3 + "0000001";
		count2 <= "0000000";
		count1 <= "0000000";
	end if;
	else
		count1 <= "0000000";
		count2 <= count2 + "0000001";
	end if;
	end if;
	
	
end if;
end process;
min <= count3;
sec <= count2;
Hsec <= count1;

end behavioral;






