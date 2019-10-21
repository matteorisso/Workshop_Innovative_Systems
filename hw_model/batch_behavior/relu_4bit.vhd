library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity relu_4bit is

	port(
		d_in 	: in 	std_logic_vector(2*(N+G) downto 0);
		d_out 	: out 	std_logic_vector((N-1) 	 downto 0)
	);

end relu_4bit;

architecture structure of relu_4bit is
															   --iiiiiiiiiiiiiiiii.ffffffffff (Q17.10) 0001000000
constant	first_bound			:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"0001000000"; -- 0.125/2
constant	second_bound		:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"0011000000"; -- 0.125+0.125/2
constant	third_bound			:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"0101000000"; -- 0.250+0.125/2
constant	fourth_bound		:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"0111000000"; -- 0.375+0.125/2
constant	fifth_bound			:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"1001000000"; -- 0.500+0.125/2
constant	sixth_bound			:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"1011000000"; -- 0.625+0.125/2
constant	seventh_bound		:	signed(2*(N+G)	downto	0)	:=	(2*(N+G)	downto	10 => '0')&"1101000000"; -- 0.750+0.125/2

-- first_bound(2*(N+G)		downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- first_bound(9			downto	0)	:=	"0001000000";
-- second_bound(2*(N+G)	downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- second_bound(9			downto	0)	:=	"0011000000";
-- third_bound(2*(N+G)		downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- third_bound(9			downto	0)	:=	"0101000000";
-- fourth_bound(2*(N+G		downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- fourth_bound(9			downto	0)	:=	"0111000000";
-- fifth_bound(2*(N+G)		downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- fifth_bound(9			downto	0)	:=	"1001000000";
-- sixth_bound(2*(N+G)		downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- sixth_bound(9			downto	0)	:=	"1011000000";
-- seventh_bound(2*(N+G)	downto	10)	:=	(2*(N+G)	downto	10 => '0');
-- seventh_bound(9			downto	0)	:=	"1101000000";

begin

	quantization : process(d_in)
	begin
		if	(signed(d_in) <= first_bound) then
			d_out <= "0000";
		elsif (signed(d_in) < second_bound) and (signed(d_in) > first_bound) then
			d_out <= "0001";	
		elsif (signed(d_in) <= third_bound) and (signed(d_in) >= second_bound) then
			d_out <= "0010";
		elsif (signed(d_in) < fourth_bound) and (signed(d_in) > third_bound) then
			d_out <= "0011";
		elsif (signed(d_in) <= fifth_bound) and (signed(d_in) >= fourth_bound) then
			d_out <= "0100";
		elsif (signed(d_in) < sixth_bound) and (signed(d_in) > fifth_bound) then
			d_out <= "0101";	
		elsif (signed(d_in) <= seventh_bound) and (signed(d_in) >= sixth_bound) then
			d_out <= "0110";
		elsif (signed(d_in) > seventh_bound) then
			d_out <= "0111";
		end if;
	end process;

end structure;