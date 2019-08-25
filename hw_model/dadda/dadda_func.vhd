library ieee;
use ieee.std_logic_1164.all;

package dadda_func is

	type and_matrix is array(0 to 7) of std_logic_vector(7 downto 0);
	function and_8b(word_a: std_logic_vector; word_b: std_logic_vector) return and_matrix;

end;

package body dadda_utils is

	function and_8b(word_a: std_logic_vector; word_b: std_logic_vector) return and_matrix is
	variable res	:	and_matrix;
	begin
		for i in 0 to 7 loop
			for j in 0 to 7 loop
				if i = '7' then
					if j = '7' then
						res(i)(j) := word_a(j) or word_b(i);
					else
						res(i)(j) := (not word_a(j)) and word_b(i);
					end if;
				elsif j = '7' then
					res(i)(j) := word_a(j) and (not word_b(i));
				else 
					res(i)(j) := word_a(j) and word_b(i);
				end if;
			end loop;
		end loop;
		return res;
	end function;

end package body;


