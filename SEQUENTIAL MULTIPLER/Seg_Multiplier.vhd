----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:58 04/18/2022 
-- Design Name: 
-- Module Name:    Seq_Multiplier - Behavioral 
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

entity Seq_Multiplier is
port(
		clk: in std_logic;
		start: in std_logic;
		reset: in std_logic;
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		ready: out std_logic;
		productout: out std_logic_vector(15 downto 0)
		);
end Seq_Multiplier;

architecture Behavioral of Seq_Multiplier is
	
	signal lmlier, lmcand, smlier, rp, lp, sp: std_logic;
	signal dataoutA: std_logic;
	signal dataoutB, dataoutAnd: std_logic_vector(7 downto 0);
	signal dataoutAdder: std_logic_vector(8 downto 0);
	signal dataoutProduct: std_logic_vector(15 downto 0);

	component Controller
	port(
			clk: in std_logic;
			reset: in std_logic;
			start: in std_logic;
			load_mlier: out std_logic;
			load_mcand: out std_logic;
			shift_mlier: out std_logic;
			reset_p: out std_logic;
			load_p: out std_logic;
			shift_p: out std_logic;
			ready: out std_logic
			);
			
	end component;
	
	component Multiplier
	port(
			clk : in std_logic;
			InA: in std_logic_vector(7 downto 0);
			load: in std_logic;
			shiftRight: in std_logic;
			outA: out std_logic
			);
	
	end component;
	
	component Multiplicand 
	port(
			clk: in std_logic;
			load: in std_logic;
			InB: in std_logic_vector(7 downto 0);
			outB: out std_logic_vector(7 downto 0)
			);
	
	end component;
	
	component AndModule
	port(
			multiplier: in std_logic;
			multiplicand: in std_logic_vector(7 downto 0);
			outAnd: out std_logic_vector(7 downto 0)
			);
	
	end component;
	
	component Production
	port(
			clk: in std_logic;
			reset: in std_logic;
			load: in std_logic;		
			datain: in std_logic_vector(8 downto 0);
			shiftRight: in std_logic;
			dataout: out std_logic_vector(15 downto 0)
			);
	
	end component;
	
	component Adder
	port(
			multp: in std_logic_vector(7 downto 0);
			product: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(8 downto 0)
			);
	
	end component; 
	
	begin
		
		unit1: Controller port map(clk, reset, start, lmlier, lmcand, smlier, rp, lp, sp, ready);
		unit2: Multiplier port map(clk, A, lmlier, smlier, dataoutA);
		unit3: Multiplicand port map(clk, lmcand, B, dataoutB);
		unit4: AndModule port map(dataoutA, dataoutB, dataoutAnd);
		unit5: Production port map(clk, rp, lp, dataoutAdder, sp, dataoutProduct); 
		unit6: Adder port map(dataoutAnd, dataoutProduct(15 downto 8), dataoutAdder);
		
		productout <= dataoutProduct;
		
end Behavioral;

