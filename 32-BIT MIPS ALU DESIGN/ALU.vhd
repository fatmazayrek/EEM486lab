----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:01:49 03/27/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(5 downto 0);
		R : out std_logic_vector(31 downto 0)
		);
end ALU;

architecture Behavioral of ALU is
	
	component add_sub
	port(
			A : in std_logic_vector(31 downto 0);
			B : in std_logic_vector(31 downto 0);
			op : in std_logic;
			R : out std_logic_vector(31 downto 0);
			c : out std_logic;
			z : out std_logic
			);
	end component;
	
	component comparator
	port(
			A : in std_logic;
			B: in std_logic;
			diff : in std_logic;
			op : in std_logic_vector(2 downto 0);
			c : in std_logic;
			z : in std_logic;
			R : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component logic
	port(
			A : in std_logic_vector(31 downto 0);
			B : in std_logic_vector(31 downto 0);
			op : in std_logic_vector(1 downto 0);
			R : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component shift
	port(
			A : in std_logic_vector(31 downto 0);
			B : in std_logic_vector(4 downto 0);
			op : in std_logic_vector(2 downto 0);
			R : out std_logic_vector(31 downto 0)
			);
	end component;
	
	component multiplexer
	port(
			i0 : in std_logic_vector(31 downto 0);
			i1 : in std_logic_vector(31 downto 0);
			i2 : in std_logic_vector(31 downto 0);
			i3 : in std_logic_vector(31 downto 0);
			op : in std_logic_vector(1 downto 0);
			R : out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal R_add, R_comp, R_log, R_shift : std_logic_vector(31 downto 0);
	signal c, z : std_logic;
	
begin
unit1 : add_sub port map(A, B, op(3), R_add, c, z);
unit2 : comparator port map(A(31), B(31), R_add(31), op(2 downto 0), c, z, R_comp);
unit3: logic port map(A, B, op(1 downto 0), R_log);
unit4 : shift port map(A, B(4 downto 0), op(2 downto 0), R_shift);
unit5: multiplexer port map(R_add, R_comp, R_log, R_shift, op(5 downto 4), R); 

end Behavioral;

