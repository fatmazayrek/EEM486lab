--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:54:53 03/13/2022
-- Design Name:   
-- Module Name:   C:/Users/Fatma/Desktop/KODLAR/Xilinx/LAB_1/sequential_adder_test.vhd
-- Project Name:  LAB_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sequential_adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sequential_adder_test IS
END sequential_adder_test;
 
ARCHITECTURE behavior OF sequential_adder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequential_adder
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         A : IN  std_logic;
         STARTA : IN  std_logic;
         LOADB : IN  std_logic;
         B : IN  std_logic_vector(3 downto 0);
         STARTC : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal A : std_logic := '0';
   signal STARTA : std_logic := '0';
   signal LOADB : std_logic := '0';
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal STARTC : std_logic;
   signal C : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequential_adder PORT MAP (
          CLK => CLK,
          RESET => RESET,
          A => A,
          STARTA => STARTA,
          LOADB => LOADB,
          B => B,
          STARTC => STARTC,
          C => C
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
			 wait for 5 ns; 
			 reset <= '0';
			 wait for 10 ns;
			 loadb <= '1';
			 wait for 10 ns;
			 b <= "0110";
			 wait for 10 ns;
			 starta <= '1';
			 a <= '1';
			 wait for 10 ns;
			 starta <= '1';
			 wait for 10 ns;
			 a <= '1';
			 wait for 10 ns;
			 a <= '0';
			 wait for 10 ns;
			 a <= '0';
			 wait for 10 ns;
			 a <= '1';
			 wait for 10 ns;
			 a <= '1';

			

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
