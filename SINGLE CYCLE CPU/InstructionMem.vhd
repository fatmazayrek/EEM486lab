----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:57 05/17/2022 
-- Design Name: 
-- Module Name:    InstructionMem - Behavioral 
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

entity InstructionMem is
port(
		a: in std_logic_vector(5 downto 0);
		rd: out std_logic_vector(31 downto 0)
		);
end InstructionMem;

architecture Behavioral of InstructionMem is
	
	type register_file is array(0 to 63) of std_logic_vector(31 downto 0) ;
	signal reg: register_file := (
	  0 => "00000000000000000000000000000000",									
	  1 => x"2003000c",														
	  2 => x"2067fff7",														
	  3 => x"2067fff7",		             								
	  4 => x"00450820",	--00450820 rs=2, rt=5, rd=1 addition													
	  5 => x"00642824",														
	  6 => x"00a42820",														
	  7 => x"10a7000a",     												
	  8 => x"00648025",	--00648025 rs=3, rt=4, rd=10 or operation r type
	  9 => x"10800001",		
	  10 => x"20050000",		
	  11 => x"00e2202a",     							
	  12 => x"ACC70000",		--ACC70019 rs=6, rt=7, ımm=0 sw operation	
	  13 => x"00e23822",		
	  14 => x"ac670044",		
	  15 => x"8c020050",     
	  16 => x"08000011",		
	  17 => x"20020001",		
	  18 => x"ac020054",		
	  19 => x"00450820",     
	  20 => "00000000000000000000000000000000",		
	  21 => "00000000000000000000000000000000",		
	  22 => "00000000000000000000000000000000",		
	  23 => "00000000000000000000000000000000",     
	  24 => "00000000000000000000000000000000",		
	  25 => x"ACC70000",		
	  26 => "00000000000000000000000000000000",		
	  27 => "00000000000000000000000000000000",     
	  28 => x"00648025",	
	  29 => "00000000000000000000000000000000",		
	  30 => "00000000000000000000000000000000",		
	  31 => "00000000000000000000000000000000",  
	  32 => x"ACC70000",
	  33 => "00000000000000000000000000000000",		
	  34 => "00000000000000000000000000000000",		
	  35 => "00000000000000000000000000000000",
	  36 => x"ACC70000",
	  OTHERS => "11111111111111111111111111111111");	
	begin
	
	rd <= reg(to_integer(unsigned(a)));


end Behavioral;

