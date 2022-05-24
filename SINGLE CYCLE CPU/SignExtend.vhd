----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:14:27 05/17/2022 
-- Design Name: 
-- Module Name:    SignExtend - Behavioral 
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

entity SignExtend is
port(
		a: in std_logic_vector(15 downto 0);
		y: out std_logic_vector(31 downto 0)
		);
end SignExtend;

architecture Behavioral of SignExtend is
	
	signal msb: std_logic_vector(15 downto 0);
	
	begin
	
	msb <= (others => a(15));
	
	y <= msb & a;


end Behavioral;

