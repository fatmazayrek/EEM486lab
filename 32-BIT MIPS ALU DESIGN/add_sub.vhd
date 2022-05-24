----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:16 03/20/2022 
-- Design Name: 
-- Module Name:    add_sub - Behavioral 
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

entity add_sub is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		op : in std_logic;
		R : out std_logic_vector(31 downto 0);
		c : out std_logic;
		z : out std_logic
		);
end add_sub;

architecture Behavioral of add_sub is

	signal btwos : signed(32 downto 0);
	signal r_add, r_sub : std_logic_vector(32 downto 0);
	
	begin
	
		btwos <= signed(not('0' & B)) + 1;
		r_add <= std_logic_vector(signed('0' & A) + signed('0' & B));
		r_sub <= std_logic_vector(signed('0' & A) + btwos);
	
		with op select
			R <= r_add(31 downto 0) when '0',
				  r_sub(31 downto 0) when others;
			  
		with op select
			c <= r_add(32) when '0',
				  r_sub(32) when others;
				  
		z <= '1' when (op = '1' and r_sub = "000000000000000000000000000000000") else
			  '1' when (op = '0' and r_add = "000000000000000000000000000000000" ) else
			  '0';

end Behavioral;

