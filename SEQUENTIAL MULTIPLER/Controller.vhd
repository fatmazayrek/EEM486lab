----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:16 04/18/2022 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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

entity Controller is
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
end Controller;

architecture Behavioral of Controller is
	
	type state_type is (s0, s1, s2, s3);
	signal state_reg, state_next: state_type;
	signal count, next_count: integer range 0 to 8;
	
	begin
	
		process(clk, reset)
		begin
			
			if(reset = '1') then
				
				state_reg <= s0;
				count <= 0;
							
			elsif(clk'event and clk = '1') then
				
				state_reg <= state_next;
				count <= next_count;
				
			end if;
		end process;
		
		process(state_reg, count, start)
		begin
			
			load_mlier <= '0';
			load_mcand <= '0';
			shift_mlier <= '0';
			reset_p <= '0';
			load_p <= '0';
			shift_p <= '0';
			ready <= '0';
			state_next <= state_reg;
			next_count <= count;
			
			case state_reg is
				when s0 =>
					if(start = '0') then
					
						state_next <= s0;
					
					else
						
						state_next <= s1;
						load_mlier <= '1';
						load_mcand <= '1';
						reset_p <= '1';
						next_count <= 0;
					
					end if;
				
				when s1 =>
					
					state_next <= s2;
					load_p <= '1';
					next_count <= count + 1;
				
				when s2 =>
					if(count = 8) then
						
						shift_mlier <= '1';
						shift_p <= '1';
						state_next <= s3;
					
					else
					
						shift_mlier <= '1';
						shift_p <= '1';
						state_next <= s1;
					
					end if;
				
				when s3 =>
					
					state_next <= s0;
					ready <= '1';
				
				end case;
			end process;
				
end Behavioral;