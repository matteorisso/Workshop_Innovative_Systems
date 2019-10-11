library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_left2 is

 generic( N : natural:= 11 );
 
port(
		in0      : in signed(N-1 downto 0);
		in1      : in signed(N-1 downto 0);
        in2      : in signed(N-1 downto 0);
		in3	     : in signed(N-1 downto 0);
	    out0     : out signed(N-8 downto 0);    -- the out has to be on 3 bits
	    out1     : out signed(N-8 downto 0);
	    out2     : out signed(N-8 downto 0);
	    out3     : out signed(N-8 downto 0)
    );
	
end entity;

architecture structure of shift_left2 is

signal o_0  : signed(N-1 downto 0);
signal o_1  : signed(N-1 downto 0);
signal o_2  : signed(N-1 downto 0);
signal o_3  : signed(N-1 downto 0);

begin

o_0 <= shift_left(in0,2);
o_1 <= shift_left(in1,2);
o_2 <= shift_left(in2,2);
o_3 <= shift_left(in3,2);

out0 <= o_0(N-8 downto 0);
out1 <= o_1(N-8 downto 0);
out2 <= o_2(N-8 downto 0);
out3 <= o_3(N-8 downto 0);

 
end architecture;  

	
		