----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:41 05/08/2022 
-- Design Name: 
-- Module Name:    Regfile - Behavioral 
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

entity Regfile is
port(
		clk: in std_logic;
		aa: in std_logic_vector(4 downto 0);
		ab: in std_logic_vector(4 downto 0);
		aw: in std_logic_vector(4 downto 0);
		wren: in std_logic;
		wdata: in std_logic_vector(31 downto 0);
		a: out std_logic_vector(31 downto 0);
		b: out std_logic_vector(31 downto 0)
		);
end Regfile;

architecture Behavioral of Regfile is
	
	type register_file is array(0 to 31) of std_logic_vector(31 downto 0) ;
	signal reg: register_file := (x"00000000", x"000000FA", others=>x"00000000");

	begin
		
		process(clk, aa, ab, aw, wren, wdata)
			
			begin
			
			if(wren = '1') then
				if ((clk'event and clk='1')) then
					if (not(aw = "00000")) then
						reg(to_integer(unsigned(aw))) <= wdata;
					
					else
						reg(to_integer(unsigned(aw))) <= (others => '0');
					
					end if;
				end if;
			else
				a <= reg(to_integer(unsigned(aa)));
				b <= reg(to_integer(unsigned(ab)));
			end if;
		end process;
					
				
				


end Behavioral;

