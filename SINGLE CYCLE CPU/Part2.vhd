--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:26:58 05/24/2022
-- Design Name:   
-- Module Name:   C:/Users/Fatma/Desktop/KODLAR/Xilinx/LAB5_Part2/Part2.vhd
-- Project Name:  LAB5_Part2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataPath
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
 
ENTITY Part2 IS
END Part2;
 
ARCHITECTURE behavior OF Part2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataPath
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         aluout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal aluout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataPath PORT MAP (
          clk => clk,
          reset => reset,
          aluout => aluout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '1';
		
		wait for 100 ns;	
		reset <= '0';
      wait;

      -- insert stimulus here 

      wait;
   end process;

END;
