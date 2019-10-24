library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity cgu is

	port(
		clk			: 	in 	std_logic;
		size_1 		: 	in 	std_logic_vector(4 downto 0);
		size_2 		: 	in 	std_logic_vector(4 downto 0);
		pool_sel	:	in	std_logic;
		tc			:	in	std_logic;
		ld_h		:	in	std_logic;
		rst_h		:	in	std_logic;
		--en_tc_c		:	in	std_logic;
		--en_tc_r		:	in	std_logic;
		rst_cnt_c	:	in	std_logic;
		rst_cnt_r	:	in	std_logic;
		ckg_rmask	: 	out	std_logic_vector(0 to W-1);
		ckg_cmask	: 	out	std_logic_vector(0 to W-1)
	);

end cgu;

architecture structure of cgu is

	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	signed((n-1) downto 0);
			d_1 	: in 	signed((n-1) downto 0);
			d_out	: out 	signed((n-1) downto 0)
		);
	end component;
	
	-- component generic_register is
		-- generic(n : integer := 8);
		-- port(
			-- clk		: in 	std_logic;
			-- en_h	: in 	std_logic;
			-- rst_h 	: in 	std_logic;
			-- d_in 	: in 	std_logic_vector((n-1) downto 0);
			-- d_out 	: out 	std_logic_vector((n-1) downto 0)
		-- );
	-- end component;
	
	signal	pool_size	:	signed(4	downto	0);
	signal	horz_slide	:	std_logic_vector(4	downto	0);
	
	--signal 	tc_vect		:	std_logic_vector(0	downto	0);
	signal 	del_0_tc	:	std_logic;
	signal 	del_1_tc	:	std_logic;
	
	signal 	del_tc_c	:	std_logic;
	signal 	del_tc_r	:	std_logic;
	signal 	del_tc_r_1	:	std_logic;
	
	signal	s_size_1 	: 	 signed(4 downto 0);
	signal	s_size_2 	: 	 signed(4 downto 0);
	signal	s_ckg_cmask : 	 signed(3 downto 0);
	signal	s_ckg_rmask	: 	 signed(3 downto 0);
	
	signal	cnt_c_out	:	std_logic_vector(1	downto	0);
	signal 	tc_c		:	std_logic;
	signal 	tc_c_en_r	:	std_logic;
	
	signal	cnt_r_out	:	std_logic_vector(1	downto	0);
	signal 	tc_r		:	std_logic;
	
	signal 	dec_out		:	signed(3	downto	0);

begin
	
	s_size_1	<=	signed(size_1);
	s_size_2	<=	signed(size_2);
	
	mux_pool	:	generic_mux2to1	generic map(
										n	=>	5
									)
									port map(
										sel		=>	pool_sel,
										d_0		=>	s_size_1,
										d_1		=>	s_size_2,
										d_out	=>	pool_size
									);
	
	dec_process	: process(pool_size)
	begin
		dec_out <= "0000";        
        case pool_size(2 downto 0) is
            when "001" 	=>	dec_out <= "0111";
            when "011" 	=>	dec_out <= "0011";
            when "101" 	=>	dec_out <= "0001";
            when others => 	dec_out <= "0000";
        end case;
	end process;
	
	horz_slide	<=	"000"&std_logic_vector(pool_size(4	downto	3));
	
	ff_0	:	process(clk)
		begin
			if clk'event and clk = '1' then
				if rst_h = '1' then
					del_0_tc <= '0';
				else 
					del_0_tc <= tc;
				end if;
			end if;
	end process;
	
	ff_1	:	process(clk)
		begin
			if clk'event and clk = '1' then
				if rst_h = '1' then
					del_1_tc <= '0';
				else 
					del_1_tc <= del_0_tc;
				end if;
			end if;
	end process;
	
	count_c : process(clk,del_1_tc)
	begin
		if clk'event and clk = '1' then
			if (rst_cnt_c = '0') then --or (tc_c = '1')then
				cnt_c_out <= "11";
				tc_c  <= '0';
			elsif ld_h = '1' then
				cnt_c_out	<=	horz_slide(1 downto 0);
			elsif del_1_tc = '1' then
				cnt_c_out	<= std_logic_vector(unsigned(cnt_c_out)-1);
			end if;
		end if;	
		tc_c	<=	(not cnt_c_out(1)) and ( not cnt_c_out(0));
	end process;
	
	mux_cmask	:	generic_mux2to1	generic map(
										n	=>	4
									)
									port map(
										sel		=>	tc_c,
										d_0		=>	"0000",
										d_1		=>	dec_out,
										d_out	=>	s_ckg_cmask
									);
									
	count_r : process(clk,tc_c)
	begin
		if clk'event and clk = '1' then
			if (rst_cnt_r = '0') then --or (tc_r = '1')then
				cnt_r_out <= "11";
				tc_r  <= '0';
			elsif ld_h = '1' then
				cnt_r_out	<=	horz_slide(1 downto 0);
			elsif (tc_c = '1') and (tc = '1') then
				cnt_r_out	<= std_logic_vector(unsigned(cnt_r_out)-1);
			end if;
		end if;	
		tc_r	<=	(not cnt_r_out(1)) and ( not cnt_r_out(0));
	end process;
	
	ff_tc_r_0	:	process(clk)
		begin
			if clk'event and clk = '1' then
				if rst_h = '1' then
					del_tc_r <= '0';
				else--if en_tc_r = '1' then 
					del_tc_r <= tc_r;
				end if;
			end if;
	end process;
	
	ff_tc_r_1	:	process(clk)
		begin
			if clk'event and clk = '1' then
				if rst_h = '1' then
					del_tc_r_1 <= '0';
				else--if en_tc_r = '1' then 
					del_tc_r_1 <= del_tc_r;
				end if;
			end if;
	end process;
	
	mux_rmask	:	generic_mux2to1	generic map(
										n	=>	4
									)
									port map(
										sel		=>	del_tc_r_1,
										d_0		=>	"0000",
										d_1		=>	dec_out,
										d_out	=>	s_ckg_rmask
									);
	
	ckg_cmask	<=	std_logic_vector(s_ckg_cmask);
	ckg_rmask	<=	std_logic_vector(s_ckg_rmask);
	
end structure;