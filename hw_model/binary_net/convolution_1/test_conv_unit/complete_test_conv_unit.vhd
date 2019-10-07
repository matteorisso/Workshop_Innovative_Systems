library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_textio.all;

library std;
	use std.textio.all;

entity tb_conv_unit is

end tb_conv_unit;

architecture test of tb_conv_unit is

	component conv_unit is
		port(
			reset	:	in	std_logic;
			start	:	in	std_logic;
			done	:	in	std_logic;
			clk		:	in	std_logic;
			en_clk	:	in	std_logic;
			
			rf_in 	: 	in 	std_logic_vector(83	downto 0);
			spw0_in	: 	in 	std_logic_vector(4	downto 0);
			spw1_in	: 	in 	std_logic_vector(4	downto 0);
			spw2_in	: 	in 	std_logic_vector(4	downto 0);
			spw3_in	: 	in 	std_logic_vector(4	downto 0);
			spw4_in	: 	in 	std_logic_vector(4	downto 0);
			spw5_in	: 	in 	std_logic_vector(4	downto 0);
			
			sign_a_0:	in	std_logic;
			sign_a_1:	in	std_logic;
			sign_a_2:	in	std_logic;
			sign_a_3:	in	std_logic;
			sign_a_4:	in	std_logic;
			sign_a_5:	in	std_logic;
			sign_b_0:	in	std_logic;
			sign_b_1:	in	std_logic;
			sign_b_2:	in	std_logic;
			sign_b_3:	in	std_logic;
			sign_b_4:	in	std_logic;
			sign_b_5:	in	std_logic;
			coeff_0	:	in	std_logic_vector(9	downto	0);
			coeff_1	:	in	std_logic_vector(9	downto	0);
			coeff_2	:	in	std_logic_vector(9	downto	0);
			coeff_3	:	in	std_logic_vector(9	downto	0);
			coeff_4 :	in	std_logic_vector(9	downto	0);
			coeff_5	:	in	std_logic_vector(9	downto	0);
		
			bn_out_0: 	out std_logic;
			bn_out_1: 	out std_logic;
			bn_out_2: 	out	std_logic;
			bn_out_3: 	out	std_logic;
			bn_out_4: 	out std_logic;
			bn_out_5: 	out std_logic
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_done		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_rf_in		:	std_logic_vector(0	to		83);
	signal tb_spw0_in	:	std_logic_vector(4	downto	0);
	signal tb_spw1_in	:	std_logic_vector(4	downto	0);
	signal tb_spw2_in	:	std_logic_vector(4	downto	0);
	signal tb_spw3_in	:	std_logic_vector(4	downto	0);
	signal tb_spw4_in	:	std_logic_vector(4	downto	0);
	signal tb_spw5_in	:	std_logic_vector(4	downto	0);
	
	signal tb_sign_a_0	:	std_logic;
	signal tb_sign_a_1	:	std_logic;
	signal tb_sign_a_2	:	std_logic;
	signal tb_sign_a_3	:	std_logic;
	signal tb_sign_a_4	:	std_logic;
	signal tb_sign_a_5	:	std_logic;
	signal tb_sign_b_0	:	std_logic;
	signal tb_sign_b_1	:	std_logic;
	signal tb_sign_b_2	:	std_logic;
	signal tb_sign_b_3	:	std_logic;
	signal tb_sign_b_4	:	std_logic;
	signal tb_sign_b_5	:	std_logic;
	signal tb_coeff_0	:	std_logic_vector(9	downto	0);
	signal tb_coeff_1	:	std_logic_vector(9	downto	0);
	signal tb_coeff_2	:	std_logic_vector(9	downto	0);
	signal tb_coeff_3	:	std_logic_vector(9	downto	0);
	signal tb_coeff_4 	:	std_logic_vector(9	downto	0);
	signal tb_coeff_5	:	std_logic_vector(9	downto	0);
	
	signal tb_bn_out_0	:	std_logic;
	signal tb_bn_out_1	:	std_logic;
	signal tb_bn_out_2	:	std_logic;
	signal tb_bn_out_3	:	std_logic;
	signal tb_bn_out_4	:	std_logic;
	signal tb_bn_out_5	:	std_logic;
	
	file file_input	: text;
	
	file file_k_0	: text;	
	file file_k_1	: text;	
	file file_k_2	: text;	
	file file_k_3	: text;	
	file file_k_4	: text;	
	file file_k_5	: text;	
	
	file file_res_0	: text;
	file file_res_1	: text;
	file file_res_2	: text;
	file file_res_3	: text;
	file file_res_4	: text;
	file file_res_5	: text;
	

begin

	dut : conv_unit
		port map(
			reset	=>	tb_reset,
			clk		=>	tb_clk,
			start	=>	tb_start,
			done	=>	tb_done,
			en_clk	=>	tb_en_clk,
			
			rf_in	=>	tb_rf_in,
			spw0_in	=>	tb_spw0_in,
			spw1_in	=>	tb_spw1_in,
			spw2_in	=>	tb_spw2_in,
			spw3_in	=>	tb_spw3_in,
			spw4_in	=>	tb_spw4_in,
			spw5_in	=>	tb_spw5_in,
			
			sign_a_0=>	tb_sign_a_0,
			sign_a_1=>	tb_sign_a_1,
			sign_a_2=>	tb_sign_a_2,
			sign_a_3=>	tb_sign_a_3,
			sign_a_4=>	tb_sign_a_4,
			sign_a_5=>	tb_sign_a_5,
			sign_b_0=>	tb_sign_b_0,
			sign_b_1=>	tb_sign_b_1,
			sign_b_2=>	tb_sign_b_2,
			sign_b_3=>	tb_sign_b_3,
			sign_b_4=>	tb_sign_b_4,
			sign_b_5=>	tb_sign_b_5,
			coeff_0	=>	tb_coeff_0,
			coeff_1	=>	tb_coeff_1,
			coeff_2	=>	tb_coeff_2,
			coeff_3	=>	tb_coeff_3,
			coeff_4	=>	tb_coeff_4,
			coeff_5	=>	tb_coeff_5,
			
			bn_out_0=>	tb_bn_out_0,
			bn_out_1=>	tb_bn_out_1,
			bn_out_2=>	tb_bn_out_2,
			bn_out_3=>	tb_bn_out_3,
			bn_out_4=>	tb_bn_out_4,
			bn_out_5=>	tb_bn_out_5
		);
	
	process -- clock generation at 500mhz.
	begin
		tb_clk <= '1';
		wait for 1 ns;
		tb_clk <= '0';
		wait for 1 ns;
	end process;
	
	process -- reset generation 
	begin
		tb_reset <= '0';
		wait for 4 ns;
		tb_reset <= '1';
		wait;
	end process;
	
	process -- write output
	
		variable v_oline_0	: line;	
		variable v_oline_1	: line;	
		variable v_oline_2	: line;	
		variable v_oline_3	: line;	
		variable v_oline_4	: line;	
		variable v_oline_5	: line;
	
	begin
	
		-- opening output files in write mode
		file_open(file_res_0,	"out_0.txt",	write_mode);	
		file_open(file_res_1,	"out_1.txt",	write_mode);	
		file_open(file_res_2,	"out_2.txt",	write_mode);	
		file_open(file_res_3,	"out_3.txt",	write_mode);	
		file_open(file_res_4,	"out_4.txt",	write_mode);	
		file_open(file_res_5,	"out_5.txt",	write_mode);
		
		wait for 31 ns;
		
		for i in 0 to 5 loop
			for j in 0 to 27 loop 
				write(v_oline_0, tb_bn_out_0, right, 1);
				write(v_oline_1, tb_bn_out_1, right, 1);
				write(v_oline_2, tb_bn_out_2, right, 1);
				write(v_oline_3, tb_bn_out_3, right, 1);
				write(v_oline_4, tb_bn_out_4, right, 1);
				write(v_oline_5, tb_bn_out_5, right, 1);
				if j<27 then
					wait for 2 ns;
				end if;
				
			end loop;
					
			writeline(file_res_0, v_oline_0);
			writeline(file_res_1, v_oline_1);
			writeline(file_res_2, v_oline_2);
			writeline(file_res_3, v_oline_3);
			writeline(file_res_4, v_oline_4);
			writeline(file_res_5, v_oline_5);
			--if iter < 4 then
				wait for 12 ns;
				--iter := iter+1;
			--elsif iter = 5 then
			--	wait for 10 ns;
				--iter := iter+1;
			--end if;
		end loop;
		
		wait for 2 ns;
		
		for i in 0 to 5 loop
			for j in 0 to 27 loop 
				write(v_oline_0, tb_bn_out_0, right, 1);
				write(v_oline_1, tb_bn_out_1, right, 1);
				write(v_oline_2, tb_bn_out_2, right, 1);
				write(v_oline_3, tb_bn_out_3, right, 1);
				write(v_oline_4, tb_bn_out_4, right, 1);
				write(v_oline_5, tb_bn_out_5, right, 1);
				if j<27 then
					wait for 2 ns;
				end if;
				
			end loop;
					
			writeline(file_res_0, v_oline_0);
			writeline(file_res_1, v_oline_1);
			writeline(file_res_2, v_oline_2);
			writeline(file_res_3, v_oline_3);
			writeline(file_res_4, v_oline_4);
			writeline(file_res_5, v_oline_5);
			--if iter < 4 then
				wait for 14 ns;
				--iter := iter+1;
			--elsif iter = 5 then
			--	wait for 10 ns;
				--iter := iter+1;
			--end if;
		end loop;
		
		
		
		file_close(file_res_0);
		file_close(file_res_1);
		file_close(file_res_2);
		file_close(file_res_3);
		file_close(file_res_4);
		file_close(file_res_5);
		wait;
		
	end process;
	
	process -- read input
	
		variable v_iline	: line;
		
		
		variable v_row_in	: std_logic_vector(31	downto 0);
		
		variable cnt		: integer range 0 to 6 := 0;
		variable iter		: integer range 0 to 5 := 0;
	 
	begin
	
		-- opening input file in read mode
		file_open(file_input,	"input_7.txt",	read_mode);	
		
		tb_start	<=	'0';
		tb_done		<=	'0';
		tb_en_clk	<=	'1';
	
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		
		wait for 1 ns;
		
		while not endfile(file_input) loop
			if cnt = 0 then
				for i in 0 to 4 loop
				
					readline(file_input, v_iline);
					read(v_iline, v_row_in);
					
					tb_rf_in(52	to		83)	<=	v_row_in; --I0
					
					readline(file_input, v_iline);
					read(v_iline, v_row_in);
					
					tb_rf_in(20	to		51)	<=	v_row_in; --I5
					tb_rf_in(0	to		19)	<=	(others	=> '0'); 
					
					wait for 2 ns;
				
				end loop;
				
				cnt	:= cnt+1;
				
				wait for 392 ns;
			
			elsif (cnt > 0) and (cnt < 6) and (iter <= 1) then
				readline(file_input, v_iline);
				read(v_iline, v_row_in);
				
				tb_rf_in(52	to		83)	<=	v_row_in; --I(j)
				
				readline(file_input, v_iline);
				read(v_iline, v_row_in);
				
				tb_rf_in(20	to		51)	<=	v_row_in; --I(j+5)
				tb_rf_in(0	to		19)	<=	(others	=> '0');
				
				cnt	:= cnt+1;
				
				wait for 66 ns;
				
			elsif (cnt = 6) then
				
				cnt := 1;
				iter := iter+1;
				wait for 316 ns;
			else
				readline(file_input, v_iline);
				read(v_iline, v_row_in);
				
				tb_rf_in(52	to		83)	<=	v_row_in; --I30
				tb_rf_in(20	to		51)	<=	(others	=> '0'); 
				tb_rf_in(0	to		19)	<=	(others	=> '0'); 
				
				wait for 66 ns;
				
				readline(file_input, v_iline);
				read(v_iline, v_row_in);
				
				tb_rf_in(52	to		83)	<=	v_row_in; --I31
				tb_rf_in(20	to		51)	<=	(others	=> '0'); 
				tb_rf_in(0	to		19)	<=	(others	=> '0'); 
				
				wait for 66 ns;
				
				tb_done	<=	'1';
			
			end if;
		end loop;
		
		file_close(file_input);
		
		
		wait;
	end process;
	
	process
		
		variable v_ilinek_0	: line;	
		variable v_ilinek_1	: line;	
		variable v_ilinek_2	: line;	
		variable v_ilinek_3	: line;	
		variable v_ilinek_4	: line;	
		variable v_ilinek_5	: line;

		variable v_k_0		: std_logic_vector(4	downto 0);
		variable v_k_1		: std_logic_vector(4	downto 0);
		variable v_k_2		: std_logic_vector(4	downto 0);
		variable v_k_3		: std_logic_vector(4	downto 0);
		variable v_k_4		: std_logic_vector(4	downto 0);
		variable v_k_5		: std_logic_vector(4	downto 0);
	
	begin
		
		file_open(file_k_0,		"k_0.txt",		read_mode);	
		file_open(file_k_1,		"k_1.txt",		read_mode);	
		file_open(file_k_2,		"k_2.txt",		read_mode);	
		file_open(file_k_3,		"k_3.txt",		read_mode);	
		file_open(file_k_4,		"k_4.txt",		read_mode);	
		file_open(file_k_5,		"k_5.txt",		read_mode);
		
		wait for 9 ns;
		
		while not endfile(file_k_0) loop
		
		readline(file_k_0, v_ilinek_0);
		read(v_ilinek_0, v_k_0);
		
		tb_spw0_in	<=	v_k_0;
		
		readline(file_k_1, v_ilinek_1);
		read(v_ilinek_1, v_k_1);
		
		tb_spw1_in	<=	v_k_1;
		
		readline(file_k_2, v_ilinek_2);
		read(v_ilinek_2, v_k_2);
		
		tb_spw2_in	<=	v_k_2;
		
		readline(file_k_3, v_ilinek_3);
		read(v_ilinek_3, v_k_3);
		
		tb_spw3_in	<=	v_k_3;
		
		readline(file_k_4, v_ilinek_4);
		read(v_ilinek_4, v_k_4);
		
		tb_spw4_in	<=	v_k_4;
		
		readline(file_k_5, v_ilinek_5);
		read(v_ilinek_5, v_k_5);
		
		tb_spw5_in	<=	v_k_5;
		
		wait for 2 ns;
		
		end loop;
		
		file_close(file_k_0);
		file_close(file_k_1);
		file_close(file_k_2);
		file_close(file_k_3);
		file_close(file_k_4);
		file_close(file_k_5);
		
		wait;
		
	end process;
	
	process -- read batch norm coeff
	begin
	
		wait for 9 ns;
	
		tb_sign_a_0				<=	'1';
		tb_sign_b_0				<=	'0';
		tb_coeff_0				<=	"0000011010";
		
		wait for 2 ns;
		
		tb_sign_a_1				<=	'1';
		tb_sign_b_1				<=	'1';
		tb_coeff_1				<=	"0000011001";
		
		wait for 2 ns;
		
		tb_sign_a_2				<=	'1';
		tb_sign_b_2				<=	'1';
		tb_coeff_2				<=	"0000010100";
		
		wait for 2 ns;
		
		tb_sign_a_3				<=	'1';
		tb_sign_b_3				<=	'1';
		tb_coeff_3				<=	"0000010110";
		
		wait for 2 ns;
		
		tb_sign_a_4				<=	'1';
		tb_sign_b_4				<=	'0';
		tb_coeff_4				<=	"0000011010";
		
		wait for 2 ns;
		
		tb_sign_a_5				<=	'1';
		tb_sign_b_5				<=	'1';
		tb_coeff_5				<=	"0000011001";
		
		wait;
	
	end process;
	
	-- process 
	-- begin
		-- tb_start	<=	'0';
		-- tb_done		<=	'0';
		-- tb_en_clk	<=	'1';
		
		
		-- wait for 6 ns;
		
		-- tb_start	<=	'1';
		
		-- wait for 2 ns;
		
		-- tb_start	<=	'0';
		
		-- wait for 1 ns;
		
		-- --load I5+I0 and row 0 of each filters.
		-- tb_rf_in(52	to		83)	<=	(others	=> '0'); --I0
		-- --tb_rf_in(52	to		83)	<=	"10101010111111000001100110000100";
		-- tb_rf_in(20	to		51)	<=	(others	=> '0'); --I5
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		-- tb_spw0_in				<=	"01000";
		-- tb_spw1_in				<=	"10000";
		-- tb_spw2_in				<=	"11001";
		-- tb_spw3_in				<=	"10010";
		-- tb_spw4_in				<=	"10000";
		-- tb_spw5_in				<=	"11111";
		
		-- tb_sign_a_0				<=	'1';
		-- tb_sign_b_0				<=	'0';
		-- tb_coeff_0				<=	"0000011010";
		
		-- wait for 2 ns;
		-- --load I6+I1 and row 1 of each filters.
		-- tb_rf_in(52	to		83)	<=	(others	=> '0'); --I1
		-- tb_rf_in(20	to		51)	<=	(others	=> '0'); --I6
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		-- tb_spw0_in				<=	"10000";
		-- tb_spw1_in				<=	"10001";
		-- tb_spw2_in				<=	"10001";
		-- tb_spw3_in				<=	"00001";
		-- tb_spw4_in				<=	"11111";
		-- tb_spw5_in				<=	"11101";
		
		-- tb_sign_a_1				<=	'1';
		-- tb_sign_b_1				<=	'1';
		-- tb_coeff_1				<=	"0000011001";
		
		-- wait for 2 ns;
		-- --load I7+I2 and row 2 of each filters.
		-- tb_rf_in(52	to		83)	<=	(others	=> '0'); --I2
		-- tb_rf_in(20	to		51)	<=	(others	=> '0'); --I7
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		-- tb_spw0_in				<=	"11100";
		-- tb_spw1_in				<=	"10011";
		-- tb_spw2_in				<=	"00000";
		-- tb_spw3_in				<=	"00000";
		-- tb_spw4_in				<=	"11111";
		-- tb_spw5_in				<=	"00001";
		
		-- tb_sign_a_2				<=	'1';
		-- tb_sign_b_2				<=	'1';
		-- tb_coeff_2				<=	"0000010100";
		
		-- wait for 2 ns;
		-- --load I8+I3 and row 3 of each filters.
		-- tb_rf_in(52	to		83)	<=	(others	=> '0'); --I3
		-- tb_rf_in(20	to		51)	<=	(others	=> '0'); --I8
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		-- tb_spw0_in				<=	"11111";
		-- tb_spw1_in				<=	"00001";
		-- tb_spw2_in				<=	"00000";
		-- tb_spw3_in				<=	"00001";
		-- tb_spw4_in				<=	"10111";
		-- tb_spw5_in				<=	"00000";
		
		-- tb_sign_a_3				<=	'1';
		-- tb_sign_b_3				<=	'1';
		-- tb_coeff_3				<=	"0000010110";
		
		-- wait for 2 ns;
		-- --load I9+I4 and row 4 of each filters.
		-- tb_rf_in(52	to		83)	<=	(others	=> '0'); --I4
		-- tb_rf_in(20	to		51)	<=	"00000000111111000000000000000000"; --I9
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		-- tb_spw0_in				<=	"11110";
		-- tb_spw1_in				<=	"00011";
		-- tb_spw2_in				<=	"00001";
		-- tb_spw3_in				<=	"11111";
		-- tb_spw4_in				<=	"00001";
		-- tb_spw5_in				<=	"00000";
		
		-- tb_sign_a_4				<=	'1';
		-- tb_sign_b_4				<=	'0';
		-- tb_coeff_4				<=	"0000011010";
		
		-- wait for 2 ns;
		-- tb_sign_a_5				<=	'1';
		-- tb_sign_b_5				<=	'1';
		-- tb_coeff_5				<=	"0000011001";
		
		-- wait for 382 ns;
		-- --load I15+I10.
		-- tb_rf_in(52	to		83)	<=	"00000000111111111111111100000000"; --I10
		-- tb_rf_in(20	to		51)	<=	"00000000000000000001111000000000"; --I15
		-- tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		
		
		-- wait;
	-- end process;
	
end test;








