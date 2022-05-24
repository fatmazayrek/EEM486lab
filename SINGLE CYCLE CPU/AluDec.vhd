----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:08:02 05/18/2022 
-- Design Name: 
-- Module Name:    AluDec - Behavioral 
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

entity AluDec is
port(
		aluop: in std_logic_vector(1 downto 0);
		func: in std_logic_vector(5 downto 0);
		alucontrol: out std_logic_vector(2 downto 0)
		);
end AluDec;

architecture Behavioral of AluDec is

	begin
	
	process(aluop, func)
		
		begin
		
		if(aluop = "00") then
			
			alucontrol <= "010";
		
		elsif(aluop(0) = '1') then
			
			alucontrol <= "110";
		
		elsif(aluop(1) = '1' and func = "100000") then
			
			alucontrol <= "010";
			
		elsif(aluop(1) = '1' and func = "100010") then
			
			alucontrol <= "110";
		
		elsif(aluop(1) = '1' and func = "100100") then
			
			alucontrol <= "000";

		elsif(aluop(1) = '1' and func = "100101") then
			
			alucontrol <= "001";

		elsif(aluop(1) = '1' and func = "101010") then
			
			alucontrol <= "111";
		end if;
	end process;

end Behavioral;

