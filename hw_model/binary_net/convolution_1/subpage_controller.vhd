-- Subpage controller: the circuit is used
-- to generate the control signal of the mux
-- of selection of the subpages in the rf.
-- The signal uph_dnl informs the control unit
-- if it is necessary to load a new row in the 
-- register file.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity subpage_controller is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		inc		: in 	std_logic;
		rst_l 	: in 	std_logic;
		tgle_ok	: in	std_logic;
		uph_dnl	: inout	std_logic;
		d_out 	: out 	std_logic_vector(4 downto 0)
	);
	
end subpage_controller;

architecture structure of subpage_controller is

	signal	cnt_out	:	std_logic_vector(3	downto	0);
	signal	dec_out	:	std_logic_vector(4	downto	0);
	signal	toggle	:	std_logic;

begin
	
	cnt_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				cnt_out <= (others => '0');
			elsif inc = '1' then
				if cnt_out = "1001" then
					cnt_out <= (others => '0');
				else
					cnt_out	<= std_logic_vector(unsigned(cnt_out)+1);
				end if;
			end if;
		end if;	
	end process;
	
	dec_process	: process(cnt_out)
	begin
		dec_out <= "00000";        
        case cnt_out is
            when "0000" 	=>	dec_out <= "00000";
            when "0001" 	=>	dec_out <= "10000";
            when "0010" 	=>	dec_out <= "11000";
            when "0011" 	=> 	dec_out <= "11100";
			when "0100" 	=>	dec_out <= "11110";
            when "0101" 	=>	dec_out <= "11111";
            when "0110" 	=>	dec_out <= "01111";
            when "0111" 	=> 	dec_out <= "00111";
			when "1000" 	=>	dec_out <= "00011";
            when "1001" 	=>	dec_out <= "00001";
            when others 	=> 	dec_out <= "00000";
        end case;
	end process;
	
	tgle_process: process(dec_out)
	begin
		toggle <= '0';
		case dec_out is
			when "00000"	=>	toggle <= '1';
			when "11111"	=>	toggle <= '1';
			when others 	=> 	toggle <= '0';
		end case;
	end process;
	
	tff_process : process(clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				uph_dnl <= '0';
			elsif tgle_ok	= '1' then 
				uph_dnl	<= toggle xor uph_dnl;
			end if;
		end if;	
	end process;
	
	d_out	<=	dec_out;
		
end structure;