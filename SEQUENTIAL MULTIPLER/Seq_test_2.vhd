--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:43:25 04/19/2022
-- Design Name:   
-- Module Name:   C:/Users/Fatma/Desktop/KODLAR/Xilinx/LAB_3_P2/Seq_test_2.vhd
-- Project Name:  LAB_3_P2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Seq_Multiplier
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
 
ENTITY Seq_test_2 IS
END Seq_test_2;
 
ARCHITECTURE behavior OF Seq_test_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Seq_Multiplier
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         reset : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ready : OUT  std_logic;
         productout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal reset : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal productout : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Seq_Multiplier PORT MAP (
          clk => clk,
          start => start,
          reset => reset,
          A => A,
          B => B,
          ready => ready,
          productout => productout
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
      wait for 10 ns;

		start <= '1';
		reset <= '0';
		A <= "00000011";
		B <= "00000010";

		wait for 10 ns;

		start <= '0';
		
		wait for 100 ns;
		
		start <= '1';
		reset <= '0';
		A <= "00000111";
		B <= "00000011";		
		
		
		
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
