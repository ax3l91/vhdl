--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:59:05 04/06/2016
-- Design Name:   
-- Module Name:   D:/AlexFile/FullAdder/TB.vhd
-- Project Name:  FullAdder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: System
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
USE ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT System
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic_vector(3 downto 0);
         wei : IN  std_logic_vector(2 downto 0);
         Din1 : IN  std_logic_vector(7 downto 0);
         Din2 : IN  std_logic_vector(7 downto 0);
			ctro: out std_logic_vector(11 downto 0);
         dout : OUT  std_logic_vector(8 downto 0);
			dout1 : OUT  std_logic_vector(7 downto 0);
			dout2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '1';
   signal rst : std_logic_vector(3 downto 0) := "0000";
   signal wei : std_logic_vector(2 downto 0) := "000";
   signal Din1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Din2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
	signal dout1 : std_logic_vector(7 downto 0);
	signal dout2 : std_logic_vector(7 downto 0);
   signal dout : std_logic_vector(8 downto 0);
	signal ctro: std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: System PORT MAP (
          clk => clk,
          rst => rst,
          wei => wei,
			 ctro => ctro,
          Din1 => Din1,
          Din2 => Din2,
          dout => dout,
			 dout1 => dout1,
			 dout2 => dout2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

stim_ctrl: process
	begin
		rst <= "1000";
		wei <= "111";
		wait for clk_period*3;
		rst <= "0000";
		wait for clk_period * 10;
		wei <= "000";
		rst <= "1000";
		wait for clk_period;
		rst <= "0000";
		wait for clk_period * 10;
		rst <= "1000";
		wait;
	end process;
  
	-- Write stimulus
	stim_wr: process
	begin
		wait for clk_period * 3;
		for i in 0 to 10 loop
			din1 <= din1 + 3;
			din2 <= din2 + 1;
			wait for clk_period;
		end loop;
		din1 <= (others => '0');
		din2 <= (others => '0');
		wait;
	end process;
	

END;
