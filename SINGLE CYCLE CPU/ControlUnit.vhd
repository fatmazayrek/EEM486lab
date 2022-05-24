----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:28 05/23/2022 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
port(
		op: in std_logic_vector(5 downto 0);
		func: in std_logic_vector(5 downto 0);
		zero: in std_logic;
		memwrite: out std_logic;
		memtoreg: out std_logic;
		pcsrc: out std_logic;
		alusrc: out std_logic;
		regdst: out std_logic;
		regwrite: out std_logic;
		alucontrol: out std_logic_vector(2 downto 0)
		);
end ControlUnit;

architecture Behavioral of ControlUnit is

	component Maindec
	port(
			op: in std_logic_vector(5 downto 0);
			aluop: out std_logic_vector(1 downto 0);
			memwrite: out std_logic;
			memtoreg: out std_logic;
			branch: out std_logic;
			alusrc: out std_logic;
			regdst: out std_logic;
			regwrite: out std_logic
			);
	end component;
	
	component AluDec
	port(
			aluop: in std_logic_vector(1 downto 0);
			func: in std_logic_vector(5 downto 0);
			alucontrol: out std_logic_vector(2 downto 0)
			);
	end component;
	
	signal aluopsig: std_logic_vector(1 downto 0);
	signal branchsig: std_logic;
	
	begin
	
	unit1: Maindec port map(op, aluopsig, memwrite, memtoreg, branchsig, alusrc, regdst, regwrite);
	unit2: AluDec port map(aluopsig, func, alucontrol);
	
	pcsrc <= zero and branchsig;


end Behavioral;

