----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:23 03/13/2022 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is
port(
		SIPOA : in std_logic_vector(3 downto 0);
		REGB : in std_logic_vector(3 downto 0);
		c0 : in std_logic;
		SUM : out std_logic_vector(3 downto 0);
		cout : out std_logic;
		overflow : out std_logic
 		);
end adder;

architecture Behavioral of adder is
	component full_adder
	port(
			A: in std_logic;
			B: in std_logic;
			cin: in std_logic;
			s: out std_logic;
			cout: out std_logic
			);
	end component;
	
	signal c : std_logic_vector(2 downto 0);
	signal s1, c1 : std_logic;
	
	begin
		add1: full_adder port map(SIPOA(0), REGB(0), c0, SUM(0), c(0));
		add2: full_adder port map(SIPOA(1), REGB(1), c(0), SUM(1), c(1));
		add3: full_adder port map(SIPOA(2), REGB(2), c(1), SUM(2), c(2));
		add4: full_adder port map(SIPOA(3), REGB(3), c(2), s1, c1 );
		
		process(s1, c1, SIPOA, REGB)
		begin
			overflow <= (SIPOA(3) xor REGB(3)) xor (s1 xor c1);
         SUM(3) <= s1;
         cout <= c1;
		end process;
end Behavioral;

