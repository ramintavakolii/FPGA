library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
USE ieee.numeric_std.ALL; 
use ieee.std_logic_unsigned.all;

entity Mat_Mul is
	PORT(vector_in : in std_logic_vector(7 downto 0);
		vector1 : out std_logic_vector(17 downto 0);
		vector2 : out std_logic_vector(17 downto 0);
		vector3 : out std_logic_vector(17 downto 0);
		clk : in std_logic
		--dataReady : out std_logic
	);
end Mat_Mul;

architecture Behavioral of Mat_Mul is

	type memory is array (1 to 4) of std_logic_vector (3 downto 0);

	signal ROM1: memory := ("0001","0001","0001","0001");		
	signal ROM2: memory := ("0000","0001","0010","0011");		
	signal ROM3: memory := ("0011","0010","0001","0000");

	signal multi1: std_logic_vector(11 downto 0):= X"000";
	signal multi2: std_logic_vector(11 downto 0):= X"000";
	signal multi3: std_logic_vector(11 downto 0):= X"000";
	signal sum1: std_logic_vector(17 downto 0):= X"0000" & "00";
	signal sum2: std_logic_vector(17 downto 0):= X"0000" & "00";
	signal sum3: std_logic_vector(17 downto 0):= X"0000" & "00";
	signal input: std_logic_vector(7 downto 0);

begin

-------------------------------------------------------
	process(clk)
	variable counter : integer range 0 to 4 := 0;
	variable counter_plus : integer range 0 to 6 := 0;
	
	begin 
	if(clk'event and clk = '1') then
		--dataReady <= '0';
		counter := counter + 1;
		counter_plus := counter_plus + 1;
		multi1 <= vector_in * ROM1(counter);
		sum1 <= sum1 + ("000000" & multi1);
	
		multi2 <= vector_in * ROM2(counter);
		sum2 <= sum2 + ("000000" & multi2);

		multi3 <= vector_in * ROM3(counter);
		sum3 <= sum3 + ("000000" & multi3);
	
		if(counter = 4)then 
			counter := 0;
		end if;
	if (counter_plus = 6) then
		counter_plus := 0;
		--dataReady <= '1';
		counter := 0;
		vector1 <= sum1;
		vector2 <= sum2;
		vector3 <= sum3;
		sum1 <= X"0000" & "00";
		sum2 <= X"0000" & "00";
		sum3 <= X"0000" & "00";
	end if;
	end if;
	end process;
	-------------------------------------------------
end Behavioral;

