library ieee;
use ieee.std_logic_1164.all;

package wallace_func is

	type and_matrix 	is array(0 to 12) 	of 	std_logic_vector(12 downto 0);
	
	type first_level 	is array(0 to 51) 	of 	std_logic_vector(1 downto 0);
	type second_level 	is array(0 to 40) 	of 	std_logic_vector(1 downto 0);
	type third_level 	is array(0 to 30) 	of 	std_logic_vector(1 downto 0);
	type fourth_level 	is array(0 to 16) 	of 	std_logic_vector(1 downto 0);
	type fifth_level 	is array(0 to 19) 	of 	std_logic_vector(1 downto 0);
	type sixth_level 	is array(0 to 19) 	of 	std_logic_vector(1 downto 0);
	
	function and_13b(word_a: std_logic_vector; word_b: std_logic_vector) return and_matrix;

end;

package body wallace_func is

	function and_13b(word_a: std_logic_vector; word_b: std_logic_vector) return and_matrix is
	variable res	:	and_matrix;
	begin
		for i in 0 to 12 loop
			for j in 0 to 12 loop
				if i = 12 then
					if j = 12 then
						res(i)(j) := word_a(i) or word_b(j);
					else
						res(i)(j) := (not word_a(j)) and word_b(i);
					end if;
				elsif j = 12 then
					res(i)(j) := word_a(j) and (not word_b(i));
				else 
					res(i)(j) := word_a(j) and word_b(i);
				end if;
			end loop;
		end loop;
		return res;
	end function;

end package body;