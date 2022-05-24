----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:18 05/23/2022 
-- Design Name: 
-- Module Name:    DataPath - Behavioral 
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

entity DataPath is
port(
		clk: in std_logic;
		reset: in std_logic;
		aluout: out std_logic_vector(31 downto 0)
		);
end DataPath;

architecture Behavioral of DataPath is
	
	component ControlUnit
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
	end component;
	
	component Mux
	port(
			s: in std_logic;
			d0: in std_logic_vector(31 downto 0);
			d1: in std_logic_vector(31 downto 0);
			y: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component ProgramCounter
	port(
			clk: in std_logic;
			reset: in std_logic;
			PC_in: in std_logic_vector(31 downto 0);
			rd: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component Adder
	port(
			a: in std_logic_vector(31 downto 0);
			b: in std_logic_vector(31 downto 0);
			y: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component InstructionMem
	port(
			a: in std_logic_vector(5 downto 0);
			rd: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component RegisterFile
	port(
			clk: in std_logic;
			we3: in std_logic;
			ra1: in std_logic_vector(4 downto 0);
			ra2: in std_logic_vector(4 downto 0);
			wa3: in std_logic_vector(4 downto 0);
			wd3: in std_logic_vector(31 downto 0);
			rd1: out std_logic_vector(31 downto 0);
			rd2: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component SignExtend
	port(
			a: in std_logic_vector(15 downto 0);
			y: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component ALU
	port(
			a: in std_logic_vector(31 downto 0);
			b: in std_logic_vector(31 downto 0);
			alucontrol: in std_logic_vector(2 downto 0);
			zero: out std_logic;
			result: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component ShiftModule
	port(
			a: in std_logic_vector(31 downto 0);
			y: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component DataMemory
	port(
			clk: in std_logic;
			we: in std_logic;
			a: in std_logic_vector(31 downto 0);
			wd: in std_logic_vector(31 downto 0);
			rd: out std_logic_vector(31 downto 0)
			);
	end component;
	
	component Mux_5
	port(
			s: in std_logic;
			d0: in std_logic_vector(4 downto 0);
			d1: in std_logic_vector(4 downto 0);
			y: out std_logic_vector(31 downto 0)
			);
	end component;
	
	signal Instrsig, PCPlus4, PCBranch, PCIn, PCOut, WriteReg, wd3in, SrcA, writedata, SignImm, SrcB, Aluresult: std_logic_vector(31 downto 0);
	signal zerosig, memwritesig, memtoregsig, pcsrcsig, alusrcsig, regdstsig, regwritesig: std_logic;
	signal alucontrolsig: std_logic_vector(2 downto 0);
	signal four: std_logic_vector(31 downto 0) := "00000000000000000000000000000100";
	signal shiftout, datamemout: std_logic_vector(31 downto 0);
	begin

	unit1: ControlUnit port map(Instrsig(31 downto 26), Instrsig(5 downto 0), zerosig, memwritesig, memtoregsig, pcsrcsig, alusrcsig, regdstsig, regwritesig, alucontrolsig);
	unit2: Mux port map(pcsrcsig, PCPlus4, PCBranch, PCIn);
	unit3: ProgramCounter port map(clk, reset, PCIn, PCOut);
	unit4: Adder port map(PCOut, four, PCPlus4);
	unit5: InstructionMem port map(PCOut(5 downto 0), Instrsig);
	unit6: RegisterFile port map(clk, regwritesig, Instrsig(25 downto 21), Instrsig(20 downto 16), WriteReg(4 downto 0), wd3in, SrcA, writedata);
	unit7: Mux_5 port map(regdstsig, Instrsig(20 downto 16), Instrsig(15 downto 11), WriteReg);
	unit8: SignExtend port map(Instrsig(15 downto 0), SignImm);
	unit9: Mux port map(alusrcsig, writedata, SignImm, SrcB);
	unit10: ALU port map(SrcA, SrcB, alucontrolsig, zerosig, Aluresult);
	unit11: ShiftModule port map(SignImm, shiftout);
	unit12: Adder port map(shiftout, PCPlus4, PCBranch);
	unit13: DataMemory port map(clk, memwritesig, Aluresult, writedata, datamemout);
	unit14: Mux port map(memtoregsig, Aluresult, datamemout, wd3in);
	
	aluout <= Aluresult;
	
end Behavioral;

