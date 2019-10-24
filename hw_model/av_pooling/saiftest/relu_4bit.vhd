library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity relu_4bit is

	port(
		d_in 	: in 	std_logic_vector(3 downto 0);
		d_out 	: out 	std_logic_vector(3 downto 0)
	);

end relu_4bit;

architecture structure of relu_4bit is
															   
constant	first_bound			:	signed(3	downto	0)	:=	"0001"; -- 0.125/2
constant	second_bound		:	signed(3	downto	0)	:=	"0011"; -- 0.125+0.125/2
constant	third_bound			:	signed(3	downto	0)	:=	"0101"; -- 0.250+0.125/2
constant	fourth_bound		:	signed(3	downto	0)	:=	"0111"; -- 0.375+0.125/2
constant	fifth_bound			:	signed(3	downto	0)	:=	"1001"; -- 0.500+0.125/2
constant	sixth_bound			:	signed(3	downto	0)	:=	"1011"; -- 0.625+0.125/2
constant	seventh_bound		:	signed(3	downto	0)	:=	"1101"; -- 0.750+0.125/2


begin

	quantization : process(d_in)
	begin
		if	(signed(d_in) <= first_bound) then
			d_out <= "000";
		elsif (signed(d_in) < second_bound) and (signed(d_in) > first_bound) then
			d_out <= "001";	
		elsif (signed(d_in) <= third_bound) and (signed(d_in) >= second_bound) then
			d_out <= "010";
		elsif (signed(d_in) < fourth_bound) and (signed(d_in) > third_bound) then
			d_out <= "011";
		elsif (signed(d_in) <= fifth_bound) and (signed(d_in) >= fourth_bound) then
			d_out <= "100";
		elsif (signed(d_in) < sixth_bound) and (signed(d_in) > fifth_bound) then
			d_out <= "101";	
		elsif (signed(d_in) <= seventh_bound) and (signed(d_in) >= sixth_bound) then
			d_out <= "110";
		elsif (signed(d_in) > seventh_bound) then
			d_out <= "111";
		end if;
	end process;

end structure;