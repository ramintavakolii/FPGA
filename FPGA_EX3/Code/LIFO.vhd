library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity LIFO is

generic(
SIZE : integer range 0 to 256 := 255
);

port(
datain: in std_logic_vector(7 downto 0);
dataout: out std_logic_vector(7 downto 0);

Clk, En, RW: in std_logic;
Empty, Full: out std_logic;

add: in integer range 0 to SIZE;
pointer: out integer range 0 to 255
);
end LIFO;

architecture Behavioral of LIFO is

type memory is array(0 to SIZE) of std_logic_vector(7 downto 0);
signal lifo: memory;

signal data: std_logic_vector(7 downto 0);
signal temp: integer range 0 to SIZE ;
signal E: std_logic := '1';
signal F: std_logic := '0';

begin

temp <= add + 1;

process(clk, En)

variable SP: integer range 0 to 255 := 1 ;

begin

if( En ='1') then
	if(clk' event and clk = '1') then
		if( Rw = '1' and F = '0') then	
			lifo(SP) <= datain;
			SP := SP + 1;
			pointer <= SP;
			E <= '0';
			
			if( SP = temp + 1 ) then F <= '1'; 
			end if;
			
		elsif (Rw = '0' and E = '0') then
			SP := SP - 1;
			data <= lifo(SP);
			pointer <= SP;
			F <= '0';
			
			if ( SP = 1 ) then E <= '1';
			end if;
		end if;
	end if;
end if;

end process;
Full <= F;
Empty <= E;
dataout <= data;

end Behavioral;

