library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_right2 is

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

architecture structure of shift_right2 is

signal o_0  : signed(6 downto 0);
signal o_1  : signed(6 downto 0);
signal o_2  : signed(6 downto 0);
signal o_3  : signed(6 downto 0);

-- signal o_0_red  : signed(N-7 downto 0);
-- signal o_1_red  : signed(N-7 downto 0);
-- signal o_2_red  : signed(N-7 downto 0);
-- signal o_3_red  : signed(N-7 downto 0);

begin

o_0 <= "00"&in0(4 downto 0);
o_1 <= "00"&in1(4 downto 0);
o_2 <= "00"&in2(4 downto 0);
o_3 <= "00"&in3(4 downto 0);

-- o_0_red <= o_0(4 downto 0);
-- o_1_red <= o_1(4 downto 0);
-- o_2_red <= o_2(4 downto 0);
-- o_3_red <= o_3(4 downto 0);

out0(0) <= o_0(1) xor o_0(2);
out1(0) <= o_1(1) xor o_1(2);
out2(0) <= o_2(1) xor o_2(2);
out3(0) <= o_3(1) xor o_3(2);

out0(1) <= (o_0(1) and o_0(2)) xor o_0(3);
out1(1) <= (o_1(1) and o_1(2)) xor o_1(3);
out2(1) <= (o_2(1) and o_2(2)) xor o_2(3);
out3(1) <= (o_3(1) and o_3(2)) xor o_3(3);

out0(2) <= (o_0(1) and o_0(2) and o_0(3)) xor o_0(4);
out1(2) <= (o_1(1) and o_1(2) and o_1(3)) xor o_1(4);
out2(2) <= (o_2(1) and o_2(2) and o_2(3)) xor o_2(4);
out3(2) <= (o_3(1) and o_3(2) and o_3(3)) xor o_3(4);

out0((N-8) downto 3) <= ((N-8) downto 3 => '0');
out1((N-8) downto 3) <= ((N-8) downto 3 => '0');
out2((N-8) downto 3) <= ((N-8) downto 3 => '0');
out3((N-8) downto 3) <= ((N-8) downto 3 => '0');

 
end architecture;  

	
		