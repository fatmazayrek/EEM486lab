----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:06 04/18/2022 
-- Design Name: 
-- Module Name:    Multiplicand - Behavioral 
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

entity Multiplicand is
port( 
		clk: in std_logic;
		load: in std_logic;
		InB: in std_logic_vector(7 downto 0);
		outB: out std_logic_vector(7 downto 0)
		);
end Multiplicand;

architecture Behavioral of Multiplicand is
	
	signal signalB: std_logic_vector(7 downto 0);
	
	begin
		
		process(clk, load)
			begin
			
			if(clk'event and clk = '1') then 
				if(load = '1') then 
					signalB <= InB;
				end if;
			end if;
		end process;
		
		outB <= signalB;

end Behavioral;

