----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:06 05/17/2022 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use ieee.numeric_Std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
port(
		a: in std_logic_vector(31 downto 0);
		b: in std_logic_vector(31 downto 0);
		y: out std_logic_vector(31 downto 0)
		);
end Adder;

architecture Behavioral of Adder is
	
	signal sum: std_logic_vector(32 downto 0);
	begin
	
	sum <= std_logic_vector(unsigned('0' & a) + unsigned('0' & b));
	y <= sum(31 downto 0);

end Behavioral;

