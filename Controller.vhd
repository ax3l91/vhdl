----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:36:06 04/06/2016 
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
    Port ( rst : in  STD_LOGIC_VECTOR(3 downto 0);
           wei : in  STD_LOGIC_vector(2 downto 0);
           weo : out  STD_LOGIC_vector(2 downto 0);
           rsto : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end Controller;

architecture Behavioral of Controller is

begin
	weo <= wei;
	rsto <= rst;

end Behavioral;

