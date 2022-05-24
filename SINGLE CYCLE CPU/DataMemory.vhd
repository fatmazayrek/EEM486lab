----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:06 05/17/2022 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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

entity DataMemory is
port(
		clk: in std_logic;
		we: in std_logic;
		a: in std_logic_vector(31 downto 0);
		wd: in std_logic_vector(31 downto 0);
		rd: out std_logic_vector(31 downto 0)
		);
end DataMemory;

architecture Behavioral of DataMemory is
	
	type register_file is array(0 to 255) of std_logic_vector(31 downto 0) ;
	signal reg: register_file := (x"00000000", x"000000FA", others=>x"00000000");
	signal address: std_logic_vector(7 downto 0);

	begin
	
	address <= a(9 downto 2);
	
	process(clk, we, address, wd)
		
		begin
		
		if(we = '1') then
			if(clk'event and clk = '1') then
				reg(to_integer(unsigned(address))) <= wd;
			end if;
		
		else
			rd <= reg(to_integer(unsigned(address)));
		end if;
	end process;

end Behavioral;

