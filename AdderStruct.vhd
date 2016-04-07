----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:57 04/01/2016 
-- Design Name: 
-- Module Name:    bit8Adder - Structural 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--AND GATE DECLARATION AND LOGIC
entity andGate is	
   port( A, B : in std_logic;
       output : out std_logic);
end andGate;

architecture Structural of andGate is
begin
		output <= A and B;
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--XOR GATE DECLARATION AND LOGIC
entity xorGate is	
   port( A, B : in std_logic;
       output : out std_logic);
end xorGate;

architecture Structural of xorGate is
begin
		output <= A xor B;
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--OR GATE DECLARATION AND LOGIC
entity orGate is	
   port( A, B : in std_logic;
       output : out std_logic);
end orGate;

architecture Structural of orGate is
begin
		output <= A or B;
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--HALF ADDER DECLARATION AND LOGIC
entity halfAdder is
	port (A,B : in std_logic;
			s: out std_logic;
			cout: out std_logic);
end halfAdder;

architecture Structural of halfAdder is
	component andGate is -- import AND Gate
      port( A, B : in std_logic;
               output : out std_logic);
   end component;

   component xorGate is -- import XOR Gate
      port( A, B : in std_logic;
               output : out std_logic);
   end component;
begin
	X1 : xorGate port map(A, B,s);
	A2 : andGate port map(A, B,cout);
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--FULL ADDER DECLARATION AND LOGIC
entity fullAdder is
	port (A,B,cin : in std_logic;
			sum: out std_logic;
			output: out std_logic);
end fullAdder;

architecture Structural of fullAdder is
	component halfAdder is -- import HalfAdder
      port( A, B : in std_logic;
          s,cout : out std_logic);
   end component;

   component orGate is -- import OR Gate
      port( A, B : in std_logic;
          output : out std_logic);
   end component;
	signal temp: std_logic_vector(2 downto 0);
begin
	H1: halfAdder port map(A,B,temp(2),temp(1));
	H2: halfAdder port map(temp(2),cin,sum,temp(0));
	O3: orGate port map(temp(1),temp(0),output);
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--N BIT ADDER DECLARATION AND LOGIC
entity bit8Adder is
	 generic (N: integer :=8);
    port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           sum : out  STD_LOGIC_VECTOR (N-1 downto 0);
           cf : out  STD_LOGIC);
end bit8Adder;

architecture Structural of bit8Adder is

	signal c: std_logic_vector(N downto 1);
	
	component halfAdder is -- import HalfAdder
      port( A, B : in std_logic;
          s,cout : out std_logic);
   end component;
	
	component fullAdder is -- import FullAdder
      port( A, B, cin : in std_logic;
          sum,output : out std_logic);
   end component;

begin
	
	H0: halfAdder port map(A(0),B(0),sum(0),c(1));
	generateProcess:
	for i in 1 to N-2 generate
		Fi: fullAdder port map (A(i),B(i),c(i),sum(i),c(i+1));
	end generate generateProcess;
	F8: fullAdder port map (A(N-1),B(N-1),c(N-1),sum(N-1),cf);

	

end Structural;

