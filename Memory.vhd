----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:08:59 04/05/2016 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
	generic(
		ADDR_W: integer :=12;
		DATA_W: integer :=8
		);
	port(
		clk: in std_logic;
		rst: in std_logic;
		we: in std_logic;
		addr: in std_logic_vector(ADDR_W-1 downto 0);
		din: in std_logic_vector(DATA_W-1 downto 0);
		dout: out std_logic_vector(DATA_W-1 downto 0)
		);
end Memory;

architecture Behavioral of Memory is
	type ram_type is array (2**ADDR_W-1 downto 0)
		of std_logic_vector (DATA_W-1 downto 0);
	signal ram: ram_type;
	signal addr_reg: std_logic_vector(ADDR_W-1 downto 0);
begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (we='1') then
				ram(to_integer(unsigned(addr))) <= din;
			end if;
			addr_reg <= addr;
		end if;
	end process;
	dout <= ram(to_integer(unsigned(addr_reg)));
end Behavioral;

