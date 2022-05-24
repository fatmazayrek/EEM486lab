----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:34 05/17/2022 
-- Design Name: 
-- Module Name:    Maindec - Behavioral 
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

entity Maindec is
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
end Maindec;

architecture Behavioral of Maindec is
		
	begin
	
	process(op)
		
		begin 
		
		if (op = "000000") then
			
			aluop <= "10";
			regwrite <= '1';
			regdst <= '1';
			alusrc <= '0';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= '0';
		
		elsif (op = "100011") then

			aluop <= "00";
			regwrite <= '1';
			regdst <= '0';
			alusrc <= '1';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= '1';

		elsif (op = "101011") then

			aluop <= "00";
			regwrite <= '0';
			alusrc <= '1';
			branch <= '0';
			memwrite <= '1';

		elsif (op = "000100") then

			aluop <= "01";
			regwrite <= '0';
			alusrc <= '0';
			branch <= '1';
			memwrite <= '0';
		
		end if;
	end process;

end Behavioral;

