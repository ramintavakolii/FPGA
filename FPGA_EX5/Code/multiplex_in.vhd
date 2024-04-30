
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiplex_in is
port(
		clk:in std_logic;
		Din:in std_logic_vector(7 downto 0);
		A,B,C:out std_logic_vector(7 downto 0);
		clk_a,clk_b,clk_c:out std_logic
	  );
end multiplex_in;

architecture Behavioral of multiplex_in is

type state is (sa,sb,sc);
signal present_state:state:=sa;
signal clka,clkb,clkc:std_logic:='0';

begin

process(clk)
	variable count:integer range 0 to 2:=0;
	begin
	
if(clk'event and clk='1') then
		
case present_state is
		
	when sa=>
	A<=Din;  
	present_state<=sb;
								
	when sb=>
	B<=Din;  
	present_state<=sc;
								
	when sc=>
	C<=Din;  
	present_state<=sa;
			
	when others =>
end case;
		
count:=count+1;
			
if count=1 then   
	clka <=  not clka;
end if;
			
if count=3 then	
	clka <=  not clka;   
	count:=0;
end if;
		
clkb<=clka;
clkc<=clkb;
		
			
end if;
end process;
	
clk_a<=clka;
clk_b<=clkb;
clk_c<=clkc;
end Behavioral;

