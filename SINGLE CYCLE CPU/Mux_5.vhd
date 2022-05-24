----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:58 05/24/2022 
-- Design Name: 
-- Module Name:    Mux_5 - Behavioral 
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

entity Mux_5 is
port(
		s: in std_logic;
		d0: in std_logic_vector(4 downto 0);
		d1: in std_logic_vector(4 downto 0);
		y: out std_logic_vector(31 downto 0)
		);
end Mux_5;

architecture Behavioral of Mux_5 is
	
	signal extend: std_logic_vector(26 downto 0):= (others => '0');
	begin
	
	process(s, d0, d1)
		
		begin
		
		if(s ='0') then
			
			y <= extend & d0;
		
		else
			
			y <= extend & d1;
		
		end if;
	end process;


end Behavioral;

