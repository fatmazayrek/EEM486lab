----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:36 04/18/2022 
-- Design Name: 
-- Module Name:    Product - Behavioral 
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

entity Production is
port(
		clk: in std_logic;
		reset: in std_logic;
		load: in std_logic;		
		datain: in std_logic_vector(8 downto 0);
		shiftRight: in std_logic;
		dataout: out std_logic_vector(15 downto 0)
		);
end Production;

architecture Behavioral of Production is
	
	signal productout: std_logic_vector(16 downto 0); 
	
	begin
		
		process(clk, reset, load, shiftRight)
		begin
			
			if(reset = '1') then
				
				productout <= (others => '0');
			
			end if;
			
			if(clk'event and clk = '1' and load = '1') then
			
				productout <= datain & productout(7 downto 0);
			
			end if;
			
			if(clk'event and clk = '1' and shiftRight = '1') then
				
				productout <= '0' & productout(16 downto 1);
			
			end if;
		end process;
		
		dataout <= productout(15 downto 0);

end Behavioral;

