----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:18 03/20/2022 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

entity comparator is
port(
		A : in std_logic;
		B: in std_logic;
		diff : in std_logic;
		op : in std_logic_vector(2 downto 0);
		c : in std_logic;
		z : in std_logic;
		R : out std_logic_vector(31 downto 0)
		);
end comparator;

architecture Behavioral of comparator is

signal res : std_logic;
signal res_zero : std_logic_vector(30 downto 0);

	begin
		--control the equalization 
		res_zero <= (others=> '0');
		res <= '1' when (z = '1' and op = "100") else
				 '1' when (z = '0' and op = "011") else
				 --control the bigger or less than (unsigned)
				 '1' when (c = '1' and op = "110") else
				 '1' when (c = '0' and op = "101") else
				 --control the bigger or less than (signed)
				 '1' when (op = "001" and ((A = '0' and B = '1') or (diff = '0' and A = '0' and B = '0') or (diff = '0' and A = '1' and B ='1'))) else 
		       '1' when (op = "010" and ((A = '1' and B = '0') or (diff = '1' and A = '0' and B = '0') or (diff = '1' and A = '1' and B ='1'))) else
				 '0';
		
		R <= res_zero & res;


end Behavioral;

