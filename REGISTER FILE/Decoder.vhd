----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:46 05/08/2022 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
port(
		address: in std_logic_vector(15 downto 0);
		cs_do: out std_logic;
		cs_di: out std_logic;
		cs_ram: out std_logic;
		cs_rom: out std_logic
		);
end Decoder;

architecture Behavioral of Decoder is
	
	signal addr: integer range 0 to 65635;
	
	begin
		
		addr <= to_integer(unsigned(address));

		process(addr) 
			begin   
					
				if(addr < 4092) then
					
					cs_rom <= '1';
					cs_do <= '0';
					cs_di <= '0';
					cs_ram <= '0';
				
				elsif(addr > 4096 and addr < 8188) then
					
					cs_ram <= '1';
					cs_do <= '0';
					cs_di <= '0';
					cs_rom <= '0';
				
				elsif(addr > 8192 and addr < 8204) then
				
					cs_di <= '1';
					cs_do <= '0';
					cs_ram <= '0';
					cs_rom <= '0';
					
				elsif(addr > 8208 and addr < 8245) then 
			
					cs_do <= '1';
					cs_di <= '0';
					cs_ram <= '0';
					cs_rom <= '0';
					
				else
					
					cs_do <= '0';
					cs_di <= '0';
					cs_ram <= '0';
					cs_rom <= '0';
					
				end if;
			
			end process;
			
	
end Behavioral;

