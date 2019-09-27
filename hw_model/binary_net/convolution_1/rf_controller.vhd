-- 3 bit width's counter.
-- It is used to generate enable
-- signals for the register file.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity rf_controller is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_out 	: out 	std_logic_vector(4 downto 0)
	);
	
end rf_controller;

architecture structure of rf_controller is

	signal	cnt	:	std_logic_vector(2	downto	0);

begin
	
	cnt_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				cnt <= (others => '0');
			elsif en_h = '1' then
				if cnt = "101" then
					cnt <= (others => '0');
				else
					cnt	<= std_logic_vector(unsigned(cnt)+1);
				end if;
			end if;
		end if;	
	end process;
	
	dec_process	: process(cnt)
	begin
		d_out <= "00000";        
        case cnt is
            when "000" 	=>	d_out <= "00001";
            when "001" 	=>	d_out <= "00010";
            when "010" 	=>	d_out <= "00100";
            when "011" 	=> 	d_out <= "01000";
			when "100" 	=>	d_out <= "10000";
            when others => 	d_out <= "00000";
        end case;
	end process;
	
	
end structure;