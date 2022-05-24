----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:04 05/17/2022 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
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
end RegisterFile;

architecture Behavioral of RegisterFile is
	
	type register_file is array(0 to 31) of std_logic_vector(31 downto 0) ;
	signal reg: register_file := (
	0 => x"00000000",
	1 => x"000000FA", 
	2 => x"0FABC200",
	3 => x"A45B48C0",
	4 => x"502AF789",
	5 => x"2FA008DF",
	6 => x"000BAE00",
	7 => x"200ACF24",
	8 => x"457ABCD0",
	9 => x"00258075",
	10 => x"FE00BAC0",
	11 => "00000000000000000000000000000000",		
   12 => "00000000000000000000000000000000",		
	13=> x"000BAE00",		
	14 => x"502AF789",    
   15 => x"00450820",		
   16 => "00000000000000000000000000000000",		
   17 => x"457ABCD0",		
   18 => "00000000000000000000000000000000",     
   19 => x"00648025",	
   20 => "00000000000000000000000000000000",		
   21 => "00000000000000000000000000000000",		
   22 => "00000000000000000000000000000000",  
   23 => x"ACC70000",
	others=>x"00000000");
	
	begin
	
	process(clk, ra1, ra2, wa3, we3, wd3)
			
			begin
			
			if(we3 = '1') then
				if ((clk'event and clk='1')) then
					if (not(wa3 = "00000")) then
						reg(to_integer(unsigned(wa3))) <= wd3;
					
					else
						reg(to_integer(unsigned(wa3))) <= (others => '0');
					
					end if;
				end if;
			else
				rd1 <= reg(to_integer(unsigned(ra1)));
				rd2 <= reg(to_integer(unsigned(ra2)));
			end if;
		end process;


end Behavioral;

