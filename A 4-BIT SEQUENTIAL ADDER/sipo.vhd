----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:06 03/13/2022 
-- Design Name: 
-- Module Name:    sipo - Behavioral 
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

entity sipo is
port( 
		A : in std_logic;
		SHIFTA : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		SIPOA : out std_logic_vector(3 downto 0)
		);		
end sipo;

architecture Behavioral of sipo is

	signal sipA : std_logic_vector(3 downto 0);
	
	begin
		process(CLK, RESET, SHIFTA, A)
		begin
			if (RESET = '1') then
				sipA <= "0000";
			elsif (CLK'event and CLK = '1') then
				if (SHIFTA = '1') then
					sipA <= sipA(2 downto 0) & A;
					--SIPOA <= sipA;
				end if;
			end if;
		end process;
		SIPOA <= sipA;
end Behavioral;

