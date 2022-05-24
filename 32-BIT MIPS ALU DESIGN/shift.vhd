----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:23 03/21/2022 
-- Design Name: 
-- Module Name:    shift - Behavioral 
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

entity shift is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(4 downto 0);
		op : in std_logic_vector(2 downto 0);
		R : out std_logic_vector(31 downto 0)
		);
end shift;

architecture Behavioral of shift is
	
	signal b_intu, b_int: integer range 0 to 31;
	signal r_sll, r_sra, r_srl, r_rol, r_ror : std_logic_vector(31 downto 0);
	signal r_zero : std_logic_vector(31 downto 0); 
	
	begin
	
	b_intu <= to_integer(unsigned(B));
	r_zero <= (others => '0');   
	
	r_sll <= std_logic_vector(unsigned(A) sll b_intu);
	r_srl <= std_logic_vector(unsigned(A) srl b_intu);

	r_sra <= std_logic_vector(shift_right(signed(A), b_intu));
	r_rol <= std_logic_vector(unsigned(A) rol b_intu);
	r_ror <= std_logic_vector(unsigned(A) ror b_intu);
	
	with op select 
		R <= r_rol when "000",
			  r_ror when "001",
			  r_sll when "010",
			  r_srl when "011",
			  r_sra when "111",
			  r_zero when others;
	

end Behavioral;

