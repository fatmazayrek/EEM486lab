----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:19 05/17/2022 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux is
port(
		s: in std_logic;
		d0: in std_logic_vector(31 downto 0);
		d1: in std_logic_vector(31 downto 0);
		y: out std_logic_vector(31 downto 0)
		);
end Mux;

architecture Behavioral of Mux is

	begin
	
	process(s, d0, d1)
		
		begin
		
		if(s ='0') then
			
			y <= d0;
		
		else
			
			y <= d1;
		
		end if;
	end process;

end Behavioral;

