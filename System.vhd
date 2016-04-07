----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:01 04/06/2016 
-- Design Name: 
-- Module Name:    System - Behavioral 
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

entity System is
	port (clk:in std_logic;
			rst:in std_logic_vector(3 downto 0);
			wei:in std_logic_vector(2 downto 0);
			Din1,din2:in std_logic_vector(7 downto 0);
			ctro: out std_logic_vector(11 downto 0);
			dout:out std_logic_vector(8 downto 0);
			dout1 : OUT  std_logic_vector(7 downto 0);
			dout2 : OUT  std_logic_vector(7 downto 0)
			);
end System;

architecture Structural of System is
	component memory is
		generic(
		ADDR_W: integer :=12;
		DATA_W: integer :=8
		);
		port (clk,rst,we: in std_logic;
				addr:in std_logic_vector(Addr_W-1 downto 0);
				din:in std_logic_vector(DATA_W-1 downto 0);
				dout:out std_logic_vector(DATA_W-1 downto 0)
				);
	end component;
	
	component memory9 is
		generic(
		ADDR_W: integer :=12;
		DATA_W: integer :=9
		);
		port (clk,rst,we: in std_logic;
				addr:in std_logic_vector(Addr_W-1 downto 0);
				din:in std_logic_vector(DATA_W-1 downto 0);
				dout:out std_logic_vector(DATA_W-1 downto 0)
				);
	end component;
	
	component bit8Adder is
		generic (N: integer :=8);
		port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
				 B : in  STD_LOGIC_VECTOR (N-1 downto 0);
				 sum : out  STD_LOGIC_VECTOR (N-1 downto 0);
				 cf : out  STD_LOGIC
				 );
	end component;
	
	component Controller is
		Port (rst : in  STD_LOGIC_VECTOR(3 downto 0);
            wei : in  STD_LOGIC_vector(2 downto 0);
            weo : out  STD_LOGIC_vector(2 downto 0);
           rsto : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
	end component;
	
	component counter is
		Port (clk,rst : in  STD_LOGIC;
                  q : out  STD_LOGIC_VECTOR(11 downto 0)
			  );
	end component;
	
	signal Ai,Bi: std_logic_vector(7 downto 0);
	signal     s: std_logic_vector(7 downto 0);
	signal     c: std_logic;
	signal      addr: std_logic_vector(11 downto 0);
	signal     final: std_logic_vector(8 downto 0);
	signal  weo: std_logic_vector(2 downto 0);
	signal  rsto: std_logic_vector(3 downto 0);

		

begin
	cont: controller port map(rst,wei,weo,rsto);
	CTR: counter port map(clk,rsto(3),addr);
	ctro <= addr;
	M0: memory port map(clk,rsto(0),weo(0),addr,Din1,Ai);
	dout1 <= ai;
	M1: memory port map(clk,rsto(1),weo(1),addr,Din2,Bi);
	dout2 <= bi;
	ADDER: bit8Adder port map(Ai,Bi,s,c);
	final(7 downto 0) <= s;
	final(8) <= c;
	M2: memory9 port map(clk,rsto(2),weo(2),addr,final,dout);



end Structural;

