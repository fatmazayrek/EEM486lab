----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:00 03/13/2022 
-- Design Name: 
-- Module Name:    piso - Behavioral 
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

entity piso is
port(
		CLK :in std_logic;
		SUM : in std_logic_vector(3 downto 0);
		LATCHC : in std_logic;
		SHIFTC : in std_logic;
		RESET : in std_logic;
		C: out std_logic
		);
end piso;

architecture Behavioral of piso is

	signal pisoC: std_logic_vector(3 downto 0);
	
	begin
		process(CLK, RESET, LATCHC, SHIFTC)
		begin
		
		--C <= '0';
		
			if (RESET = '1') then
				pisoC <= "0000";
			elsif (CLK'event and CLK ='1') then
				if(LATCHC = '1') then
					pisoC <= SUM;
				elsif (SHIFTC = '1') then
					pisoC <= '0' & pisoC(3 downto 1);
				end if;
			end if;
		end process;
		C <= pisoC(0);
end Behavioral;

