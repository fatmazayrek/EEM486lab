----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:40:37 04/18/2022 
-- Design Name: 
-- Module Name:    Multiplier - Behavioral 
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

entity Multiplier is
port(	
		clk : in std_logic;
		InA: in std_logic_vector(7 downto 0);
		load: in std_logic;
		shiftRight: in std_logic;
		outA: out std_logic
		);
end Multiplier;

architecture Behavioral of Multiplier is

	signal signalA: std_logic_vector(7 downto 0) := "00000000";
	
	begin

		process(clk, load, shiftRight)
			begin

				if(clk'event and clk = '1' and load = '1') then	
						
						signalA <= InA;
				end if;
				
				if(clk'event and clk = '1' and shiftRight = '1') then
					
						signalA <= '0' & signalA(7 downto 1);
					
				end if;
		end process;
		
		outA <= signalA(0);
					
end Behavioral;

