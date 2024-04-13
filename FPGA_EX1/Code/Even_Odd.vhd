----------------------------------------------------------------------------------

-- Create Date:    18:46:08 10/30/2023 
-- Design Name: 
-- Module Name:    Even_Odd - Behavioral 
-- Project Name: Ramin tavakoli
-- Target Devices: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Even_Odd is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  SIGNED (8 downto 0));
end Even_Odd;

architecture Behavioral of Even_Odd is

signal tmp: STD_LOGIC;
signal s1: STD_LOGIC_VECTOR(8 downto 0);
signal s2: STD_LOGIC_VECTOR(8 downto 0);

begin
tmp <= input(0)xor input(1)xor input(2)xor
input(3)xor input(4)xor input(5)xor input(6)xor input(7); 

s1 <= std_logic_vector((unsigned('0' & input) + 47)/2);
s2 <= std_logic_vector((signed('0' & input) - 37) + (signed('0' & input) - 37));
 

output <= signed(s1) when tmp ='0' else
signed(s2);

end Behavioral;

