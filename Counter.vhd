----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:15 04/06/2016 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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
use ieee.std_logic_unsigned.all; 


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
	 Port ( clk,rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(11 downto 0)
			  );
end Counter;

architecture Behavioral of Counter is
	signal tmp: std_logic_vector(11 downto 0);

begin
	
	process(clk,rst)
	begin
		if (rst = '1') then
			tmp <= (others => '0');
		elsif (clk'event and clk = '1') then
			tmp <= tmp + 1;
		end if;
	end process;
	
	q <= tmp;

end Behavioral;

