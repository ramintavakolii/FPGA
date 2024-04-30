
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Output_Block is
generic( N: integer range 0 to 15:= 10);
port(
		Din1,Din2,Din3:in std_logic_vector(17 downto 0);
		clk:in std_logic;
		Dout:out std_logic_vector(17 downto 0)
		);
end Output_Block;

architecture Behavioral of Output_Block is
begin 

process(clk)

variable count:integer range 0 to 15:=0;

begin
	
if (clk'event and clk='1') then	
	count:=count+1;
	
	if count= N  then 
		Dout<=Din1; 
	elsif count=N+1  then 
		Dout<=Din2; 
	elsif count=N+2 then 
		Dout<=Din3; 
		count:= N - 8;
	end if;
			
end if;
end process;

end Behavioral;

