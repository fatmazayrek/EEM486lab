----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:52 03/21/2022 
-- Design Name: 
-- Module Name:    logic - Behavioral 
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

entity logic is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(1 downto 0);
		R : out std_logic_vector(31 downto 0)
		);
end logic;

architecture Behavioral of logic is

	begin

		with op select
			R <= (A nor B) when "00",
				  (A and B) when "01",
				  (A or B) when "10",
				  (A xor B) when others;
				  
end Behavioral;

