----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:20:12 05/17/2022 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(
		a: in std_logic_vector(31 downto 0);
		b: in std_logic_vector(31 downto 0);
		alucontrol: in std_logic_vector(2 downto 0);
		zero: out std_logic;
		result: out std_logic_vector(31 downto 0)
		);
end ALU;

architecture Behavioral of ALU is
	signal tempresult: std_logic_vector(31 downto 0) := (others => '0');
	begin
	
	process(alucontrol)
		
		begin
		
		if(alucontrol = "000") then
			tempresult <= a and b;
			
		elsif(alucontrol = "001") then
			tempresult <= a or b;

		elsif(alucontrol = "010") then
			 tempresult <= std_logic_vector(unsigned(a) + unsigned(b));

		elsif(alucontrol = "100") then
			 tempresult <= a and not(b);			 

		elsif(alucontrol = "101") then
			 tempresult <= a or not(b);

		elsif(alucontrol = "110") then
			 tempresult <= std_logic_vector(unsigned(a) - unsigned(b));
			 
			 if(tempresult = "00000000000000000000000000000000") then
				zero <= '1';
			 else
				zero <= '0';
			end if;
			 
		elsif(alucontrol = "111") then
			if(unsigned(a) < unsigned(b)) then
				tempresult <= (others => '1');
			 else
				tempresult <= (others => '0');
			end if;
		end if;
	end process;
	
	rdproc: process(tempresult)
	begin
		
		result <= tempresult;

	end process;
	
	
end Behavioral;

