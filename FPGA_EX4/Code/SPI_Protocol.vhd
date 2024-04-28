library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.std_logic_unsigned.all;

entity SPI_Protocol is
port(
		Clk, SPI_Clk: in std_logic;
		Data_Ready, Miso_in, Miso: in std_logic;
		Data_in: in std_logic_vector(7 downto 0);
		Data_out: out std_logic_vector(7 downto 0);
		CS, SCK, Mosi, Data_Out_Ready: out std_logic
);
end SPI_Protocol;

architecture Behavioral of SPI_Protocol is

type state is (idle,send,transceive);
signal pr_state,nx_state: state:=idle;
--signal bit_counter : integer range -1 to 7 := 7;  -- counter for bits sent and received

signal Datain: std_logic_vector(7 downto 0);
signal Dataout: std_logic_vector(7 downto 0);

begin

p1: process(clk)
begin

if(clk'event and clk='1') then
	pr_state <= nx_state;
	--Datain <= Data_in;
end if; 
end process;

p2:process(Data_Ready, pr_state, Miso_in, miso, clk)
	begin
		case pr_state is
		when idle =>
			if (Data_Ready = '1' and Miso_in = '0') then
				nx_state <= send;
			elsif (Data_Ready = '1' and Miso_in = '1') then
				nx_state <= transceive;
			else 
				nx_state <= idle;
			end if;
			CS <= '1'; 
			--SCK <= '1';

		when send =>
			if (Data_Ready = '0') then
				nx_state <= idle;
			elsif (Miso_in = '1') then
				nx_state <= transceive;
			else 
				nx_state <= send;
			end if;
			CS <= '0'; 
			--SCK <= SPI_CLK;
			
		when transceive =>
			if (Data_Ready = '0') then
				nx_state <= idle;
			elsif (Miso_in = '0') then
				nx_state <= send;
			else 
				nx_state <= transceive;
			end if;
			CS <= '0';
			--SCK <= SPI_CLK;
		when others=>
			nx_state<=idle;
		end case;

end process; 

p3: process(SPI_CLK)
variable bit_counter : integer range -1 to 7 := 7;  -- counter for bits sent and received
	begin
		case pr_state is
		when idle =>
			SCK <= '1';
		when send =>
			SCK <= SPI_CLK;
		when transceive =>
			SCK <= SPI_CLK;
		when others=>
			SCK <= SPI_CLK;
		end case;	
		if	(SPI_CLK'event and SPI_clk='1') then
			if(pr_state = idle)then
				--CS <= '1';
				--SCK <= '1';
				Mosi <= '1';
				Data_Out_Ready <= '0';
				Dataout <= X"FF";
			elsif(pr_state = send)then
				--SCK <= SPI_CLK;
				--CS <= '0';
				Mosi <= Data_in(bit_counter);
				Dataout <= X"FF";
				bit_counter := bit_counter - 1; -- Decrement bit_counter after shifting out each bit	
				if( bit_counter = -1) then
					bit_counter := 7;
				end if;
			elsif(pr_state = transceive) then
				--SCK <= SPI_CLK;
				Dataout(7 - bit_counter) <= Miso; 
				Data_out <= "UUUUUUUU"; 
				bit_counter := bit_counter - 1;
				--CS <= '0';
				if( bit_counter = -1 ) then
					Data_Out_Ready <= '1';
					Data_out <= Dataout;
					bit_counter := 7;
				else
				Data_Out_Ready <= '0';
				end if;
			end if;
	
		end if;
end process;
end Behavioral;


