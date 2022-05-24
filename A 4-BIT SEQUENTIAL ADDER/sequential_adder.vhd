----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:11 03/13/2022 
-- Design Name: 
-- Module Name:    sequential_adder - Behavioral 
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

entity sequential_adder is
port( 
		CLK : in std_logic;
		RESET : in std_logic;
		A : in std_logic;
		STARTA : in std_logic;
		LOADB : in std_logic;
		B : in std_logic_vector(3 downto 0);
		STARTC : out std_logic;
		C : out std_logic
		);
end sequential_adder;
  
architecture Behavioral of sequential_adder is

	signal spA, regB, sum : std_logic_vector(3 downto 0);    
	signal latchB, shiftA, latchC, shiftC, c_out, overflow : std_logic;
	signal c_in : std_logic := '0';
	
	component sipo
	port( 
			A : in std_logic;
			SHIFTA : in std_logic;
			CLK : in std_logic;
			RESET : in std_logic;
			SIPOA : out std_logic_vector(3 downto 0)
			);
	end component;
	
	component reg
	port(
			CLK : in std_logic;
			RESET : in std_logic;
			B : in std_logic_vector(3 downto 0);
			LATCHB : in std_logic;
			REGB : out std_logic_vector(3 downto 0)
			);
	end component;
	
	component piso
	port(
			CLK :in std_logic;
			SUM : in std_logic_vector(3 downto 0);
			LATCHC : in std_logic;
			SHIFTC : in std_logic;
			RESET : in std_logic;
			C: out std_logic
			);
	end component;
	
	component adder
	port(
			SIPOA : in std_logic_vector(3 downto 0);
			REGB : in std_logic_vector(3 downto 0);
			c0 : in std_logic;
			SUM : out std_logic_vector(3 downto 0);
			cout : out std_logic;
			overflow : out std_logic
			);
	end component;
	
	component FSM
	port(
			CLK : in std_logic;
			RESET : in std_logic;
			STARTA : in std_logic;
			LOADB : in std_logic;
			SHIFTA : out std_logic;
			LATCHB : out std_logic;
			SHIFTC : out std_logic;
			LATCHC : out std_logic;
			STARTC : out std_logic
			); 
	end component;
	
begin
	u1 : FSM port map(CLK, RESET, STARTA, LOADB, shiftA, latchB, shiftC, latchC, STARTC);
	u2 : sipo port map(A, shiftA, CLK, RESET, spA);
	u3 : reg port map(CLK, RESET, B, latchB, regB);
	u4 : adder port map(spA, regB, c_in, sum, c_out, overflow);
	u5 : piso port map(CLK, sum, latchC, shiftC, RESET, C);
end Behavioral;

