----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:28 05/17/2022 
-- Design Name: 
-- Module Name:    ProgramCounter - Behavioral 
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

entity ProgramCounter is
port(
		clk: in std_logic;
		reset: in std_logic;
		PC_in: in std_logic_vector(31 downto 0);
		rd: out std_logic_vector(31 downto 0)
		);
end ProgramCounter;

architecture Behavioral of ProgramCounter is
signal pc_reg : std_logic_vector(31 downto 0) := x"00000000";
	begin
	
	process(clk, reset)
		
		begin
		
		if(reset = '1') then
			
			pc_reg <= (others => '0');
		
		else
			if(clk'event and clk = '1') then
			
			pc_reg <= PC_in;
		
			end if; 
		end if;
	end process;

	rdproc: process(pc_reg)
	begin
		
	rd <= pc_reg;
	end process;
end Behavioral;

