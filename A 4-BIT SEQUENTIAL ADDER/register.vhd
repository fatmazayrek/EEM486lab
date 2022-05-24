----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:36 03/13/2022 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity reg is
port( 
		CLK : in std_logic;
		RESET : in std_logic;
		B : in std_logic_vector(3 downto 0);
		LATCHB : in std_logic;
		REGB : out std_logic_vector(3 downto 0)
		);
end reg;

architecture Behavioral of reg is
	begin
		process(CLK, RESET, LATCHB, B)
		begin 
			if (RESET = '1') then
				REGB <= "0000";
			elsif(CLK'event and CLK ='1') then
				if(LATCHB = '1') then
					REGB <= B;
				end if;
			end if;
		end process;
end Behavioral;

