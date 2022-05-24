----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:55:31 03/27/2022 
-- Design Name: 
-- Module Name:    multiplexer - Behavioral 
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

entity multiplexer is
port(
		i0 : in std_logic_vector(31 downto 0);
		i1 : in std_logic_vector(31 downto 0);
		i2 : in std_logic_vector(31 downto 0);
		i3 : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(1 downto 0);
		R : out std_logic_vector(31 downto 0)
		);

end multiplexer;

architecture Behavioral of multiplexer is

begin
	
	with op select
		R <= i0 when "00",
			  i1 when "01",
			  i2 when "10",
			  i3 when others;


end Behavioral;

