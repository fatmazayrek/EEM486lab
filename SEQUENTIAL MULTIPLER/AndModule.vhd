----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:42 04/18/2022 
-- Design Name: 
-- Module Name:    AndModule - Behavioral 
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

entity AndModule is
port(
		multiplier: in std_logic;
		multiplicand: in std_logic_vector(7 downto 0);
		outAnd: out std_logic_vector(7 downto 0)
		);
end AndModule;

architecture Behavioral of AndModule is
	
	signal multipliertemp: std_logic_vector(7 downto 0);
	
	begin
	
	multipliertemp <= (others => multiplier);

	outAnd <= multipliertemp and multiplicand;

end Behavioral;

