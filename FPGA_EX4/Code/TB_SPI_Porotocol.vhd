LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY TB_SPI_Porotocol IS
END TB_SPI_Porotocol;
 
ARCHITECTURE behavior OF TB_SPI_Porotocol IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI_Protocol
    PORT(
         Clk : IN  std_logic;
         SPI_Clk : IN  std_logic;
         Data_Ready : IN  std_logic;
         Miso_in : IN  std_logic;
         Miso : IN  std_logic;
         Data_in : IN  std_logic_vector(7 downto 0);
         Data_out : OUT  std_logic_vector(7 downto 0);
         CS : OUT  std_logic;
         SCK : OUT  std_logic;
         Mosi : OUT  std_logic;
         Data_Out_Ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal SPI_Clk : std_logic := '0';
   signal Data_Ready : std_logic := '0';
   signal Miso_in : std_logic := '0';
   signal Miso : std_logic := '0';
   signal Data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Data_out : std_logic_vector(7 downto 0);
   signal CS : std_logic;
   signal SCK : std_logic;
   signal Mosi : std_logic;
   signal Data_Out_Ready : std_logic;

   -- Clock period definitions
   --constant Clk_period : time := 10 ns;
   --constant SPI_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI_Protocol PORT MAP (
          Clk => Clk,
          SPI_Clk => SPI_Clk,
          Data_Ready => Data_Ready,
          Miso_in => Miso_in,
          Miso => Miso,
          Data_in => Data_in,
          Data_out => Data_out,
          CS => CS,
          SCK => SCK,
          Mosi => Mosi,
          Data_Out_Ready => Data_Out_Ready
        );
 
CLK <= not CLK after 10 ns; 
SPI_CLK <= not SPI_CLK after 15 ns;  
Data_Ready <= '1' after 90 ns,'0' after 350 ns,'1' after 400 ns,'0' after 700 ns,'1' after 750 ns; 
Miso_in <= '1' after 400 ns, '0' after 950 ns, '1' after 1100 ns; 
Miso <= not Miso after 20 ns; 
Data_in <= x"79";

END;
