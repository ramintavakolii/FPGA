library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity main is
port(
		clk:in std_logic;
		Din:in std_logic_vector(7 downto 0);
		YA,YB,YC:out std_logic_vector(17 downto 0)
		);
end main;

architecture Behavioral of main is

component multiplex_in
port(
		clk:in std_logic;
		Din:in std_logic_vector(7 downto 0);
		A,B,C:out std_logic_vector(7 downto 0);
		clk_a,clk_b,clk_c:out std_logic
	  );
end component;
	
component Mat_Mul
port(
		clk : in std_logic;
	   vector_in : in std_logic_vector(7 downto 0);
		vector1 : out std_logic_vector(17 downto 0);
		vector2 : out std_logic_vector(17 downto 0);
		vector3 : out std_logic_vector(17 downto 0)
		--dataReady : out std_logic
		);
end component;
	
component Output_Block
generic( N: integer range 0 to 15:= 10);
port(
		Din1,Din2,Din3:in std_logic_vector(17 downto 0);
		clk:in std_logic;
		Dout:out std_logic_vector(17 downto 0)
		);
end component;

signal C1, C2, C3:std_logic;
signal ai, bi, ci:std_logic_vector(7 downto 0); -- matrix data such that a0 to a3 and b0 to b3 and c0 to c3
signal M1, M2, M3, M4, M5, M6, M7, M8, M9:std_logic_vector(17 downto 0); -- Multiplier of Vector(A,B,C) to Mutrix_4_3

begin

u1:multiplex_in port map(clk => clk, Din => Din, A => ai, B => bi, C => ci, clk_a => C1, clk_b => C2, clk_c => C3);

u2:Mat_Mul port map(clk => C1, vector_in => ai, vector1 => M1, vector2 => M2, vector3 => M3);

u3:Mat_Mul port map(clk => C2, vector_in => bi, vector1 => M4, vector2 => M5, vector3 => M6);

u4:Mat_Mul port map(clk => C3, vector_in => ci, vector1 => M7, vector2 => M8, vector3 => M9);

u5:Output_Block 	generic map (N => 10)
						port map(Din1 => M1, Din2 => M2, Din3 => M3, clk => clk, Dout => YA);

u6:Output_Block 	generic map (N => 11)
						port map(Din1 => M4, Din2 => M5, Din3 => M6, clk => clk, Dout => YB);

u7:Output_Block 	generic map (N => 11)
						port map(Din1 => M7, Din2 => M8, Din3 => M9, clk => clk, Dout => YC);

end Behavioral;

