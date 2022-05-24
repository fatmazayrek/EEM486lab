----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:24 03/19/2022 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
port(
		A: in std_logic;
		B: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic
		);
end full_adder;

architecture Behavioral of full_adder is
	component half_adder
	port(
			A: in std_logic;
			B: in std_logic;
			s: out std_logic;
			c: out std_logic
			);
	end component;
	
	signal c1, c2, sum: std_logic;
	
	begin
		ha_1: half_adder port map(A, B, sum, c1);
		ha_2: half_adder port map(sum, cin, s, c2);
	
		process(c1, c2)
 		   	begin
 		       	cout <= c1 or c2;
		end process;
end Behavioral;

