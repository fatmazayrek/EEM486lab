----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:53 05/09/2022 
-- Design Name: 
-- Module Name:    SevenSegment - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegment is
port(
		cs: in std_logic;
		reset: in std_logic;
		clk: in std_logic;
		read_seven: in std_logic;
		write_seven: in std_logic;
		wrdata: in std_logic_vector(31 downto 0);
		addr: in std_logic;
		data_out: out std_logic_vector(11 downto 0)
		);
		
end SevenSegment;

architecture Behavioral of SevenSegment is
	
	type reg_type is array(0 to 1023) of std_logic_vector(31 downto 0);
	signal reg: reg_type;
	signal sel: std_logic_vector(3 downto 0);
	signal dp: std_logic;
	signal segment: std_logic_vector(6 downto 0);
	signal address: std_logic_vector(1 downto 0);
	
	begin
		
		address <= '0' & addr;
		
		process(clk, reset, cs, read_seven, write_seven, address, wrdata)
			
			begin
				
				if(reset = '1') then
					
					data_out <= (others => '0');
				
				elsif(clk'event and clk = '1' and cs = '1') then
					
					if(read_seven = '1' and write_seven = '0') then
						
						segment <= reg(to_integer(unsigned(address)))(6 downto 0);
						dp <= reg(to_integer(unsigned(address)))(7);
						sel <= reg(to_integer(unsigned(address)))(11 downto 8);
					
					elsif(read_seven = '0' and write_seven = '1') then
						
						reg(to_integer(unsigned(address))) <= wrdata;
					
					end if;
				end if;
		end process;
		
		data_out <= sel & dp & segment;
		
end Behavioral;

