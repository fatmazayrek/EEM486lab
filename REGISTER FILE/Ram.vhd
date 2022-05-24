----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:36 05/08/2022 
-- Design Name: 
-- Module Name:    Ram - Behavioral 
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

entity Ram is
port(
		clk: in std_logic;
		cs: in std_logic;
		read_ram: in std_logic;
		write_ram: in std_logic;
		addr_ram: in std_logic_vector(9 downto 0);
		wrdata: in std_logic_vector(31 downto 0);
		rdata: out std_logic_vector(31 downto 0)
		);
end Ram;

architecture Behavioral of Ram is
	
	type reg_type is array(0 to 1023) of std_logic_vector(31 downto 0);
	signal reg: reg_type;
	
	begin
	
	process(clk, cs, read_ram, write_ram, addr_ram, wrdata)
		
		begin
		
			if(clk'event and clk='1' and cs = '1') then 
				if(write_ram = '0' and read_ram = '1') then
					
					rdata <= reg(to_integer(unsigned(addr_ram)));
				
				elsif(write_ram = '1' and read_ram = '0') then
					
					reg(to_integer(unsigned(addr_ram))) <= wrdata;
				
				end if;
			end if;
	end process;

end Behavioral;

