----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:24 03/13/2022 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
port(
	   CLK : in std_logic;
		RESET : in std_logic;
		STARTA : in std_logic;
		LOADB : in std_logic;
		SHIFTA : out std_logic;
		LATCHB : out std_logic;
		SHIFTC : out std_logic;
		LATCHC : out std_logic;
		STARTC : out std_logic
		);
end FSM;

architecture Behavioral of FSM is

	type state_type is (WaitB, WaitA, TakeA, SendC);
	signal state_reg, state_next : state_type;
	signal COUNT, Next_COUNT : integer range 0 to 3;
	
	begin
		process(CLK, RESET)
		begin 
			if (RESET = '1') then
				state_reg <= WaitB;
				COUNT <= 0;
			elsif (CLK'event and CLK = '1') then
				state_reg <= state_next;
				COUNT <= Next_COUNT;
				
			end if;
		end process;
		
		process(state_reg, COUNT, STARTA, LOADB)
		begin
			 SHIFTA <= '0';
			 LATCHB <= '0';
			 LATCHC <= '0';
			 SHIFTC <= '0';
			 STARTC <= '0';
			 state_next <= state_reg;
			 Next_COUNT <= COUNT;
			 
			case state_reg is
			
				when WaitB =>
					if (LOADB = '1') then
						state_next <= WaitA;
						LATCHB <= '1';
					else
						state_next <= WaitB;
					end if;
					
				when WaitA =>
					if (STARTA = '1') then
						state_next <= TakeA;
						SHIFTA <= '1';
						Next_COUNT <= 0;
					else
						state_next <= WaitA;
					end if;
					
				when TakeA =>
					if (COUNT = 3) then
						state_next <= SendC;
						LATCHC <= '1';
						Next_COUNT <= 0;
					else 
						state_next <= TakeA;
						SHIFTA <= '1';
						Next_COUNT <= COUNT + 1;
					end if;
					
				when SendC =>
					if (COUNT = 0) then
						state_next <= SendC;
						STARTC <= '1';
						SHIFTC <= '1';
						Next_COUNT <= COUNT + 1;
					elsif (COUNT = 3) then
						state_next <= WaitB;
					else
						state_next <= SendC;
						SHIFTC <= '1';
						Next_COUNT <= COUNT + 1;
					end if;
				end case;
		end process;
end Behavioral;

