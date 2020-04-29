library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all;

entity npu is
    
    port(
        clk         : in  std_logic;
        rst_n       : in  std_logic;
        fc_i        : in  std_logic;                   --! cfg
        en_i        : in  std_logic;
        ldh_v_ni    : in  std_logic;
        rd_pipe_i   : in  std_logic;
--
        ckg_rmask_i : in  std_logic_vector(0 to W-1);  --! guard
        ckg_cmask_i : in  std_logic_vector(0 to W-1);  --! guard
--
        data_fc_i   : in  std_logic_vector(N-1 downto 0);
        weight_fc_i : in  std_logic_vector(2*W*W-1 downto 0);
--
        weight_i    : in  std_logic_vector(1 downto 0);
        data_h_i    : in  std_logic_vector(W*N-1 downto 0);
        data_v_i    : in  std_logic_vector(W*N-1 downto 0);
        data_acc_i  : in  std_logic_vector(W*(N+BG)-1 downto 0);
        data_o      : out std_logic_vector(W*(N+BG)-1 downto 0)

        );

end entity;

architecture rtl of npu is

    --
    --// mesh
    --
    type weight_mat_t is array (0 to W, 0 to W-1) of std_logic_vector(1 downto 0);
    type clk_gate_mat_t is array (0 to W-1) of std_logic_vector(0 to W-1);
    type activation_mat_t is array (0 to W, 0 to W) of std_logic_vector(N-1 downto 0);
    type accumulate_mat_t is array (0 to W, 0 to W-1) of std_logic_vector(N+BG-1 downto 0);
    --
    signal weight_int   : weight_mat_t;
    signal clk_gate_int : clk_gate_mat_t;
    signal data_h_int   : activation_mat_t;
    signal data_v_int   : activation_mat_t;
    signal data_acc_int : accumulate_mat_t;
begin



    --// processing elements
    r : for i in 0 to W-1 generate
        
        c : for j in 0 to W-1 generate
            
            pe_i : entity work.pe
                
                port map (
                    clk         => clk,
                    rst_n       => rst_n,
                    fc_i        => fc_i,
                    en_i        => en_i,                --! input_buffer
                    clk_gate_i  => clk_gate_int(i)(j),  --! acc
                    ldh_v_ni    => ldh_v_ni,
                    rd_pipe_i   => rd_pipe_i,
                    data_fc_i   => data_fc_i,
                    weight_fc_i => weight_int(i, j),
                    weight_i    => weight_i,
                    data_h_i    => data_h_int(i, j+1),
                    data_v_i    => data_v_int(i+1, j),
                    data_acc_i  => data_acc_int(i+1, j),
                    data_h_o    => data_h_int(i, j),
                    data_v_o    => data_v_int(i, j),
                    data_o      => data_acc_int(i, j)

                    );

        end generate;

        
    end generate;




    --// rd input data_h
    gen_data_i_h : for i in 0 to W-1 generate
        
        data_h_int(i, W) <= data_h_i(data_h_i'high - (N*i) downto data_h_i'length - (N*(i+1)))
                            when fc_i = '0' else data_fc_i;
        
    end generate;




    --// rd input data_v
    gen_data_i_v : for i in 0 to W-1 generate
        
        data_v_int(W, i) <= data_v_i(data_v_i'high - (N*i) downto data_v_i'length - (N*(i+1)))
                            when fc_i = '0' else data_fc_i;
        
    end generate;




    --// rd input weights vec
    gen_weight_i : for i in 0 to W-1 generate
        
        gen_weight_j : for j in 0 to W-1 generate
            
            weight_int(i, j) <= weight_fc_i(weight_fc_i'high - 2*W*i - 2*j downto weight_fc_i'length - 2*W*i - 2*(j+1));
            
        end generate;

    end generate;




    --// rst accumulator value
    gen_data_acc_i : for i in 0 to W-1 generate
        
        data_acc_int(W, i) <= data_acc_i(data_acc_i'high - (N+BG)*i downto data_acc_i'length - (N+BG)*(i+1));
        
    end generate;





    --// clk gating mesh
    gen_ckg_r : for i in 0 to W-1 generate
        
        gen_ckg_c : for j in 0 to W-1 generate
            
            clk_gate_int(i)(j) <= ckg_rmask_i(i) or ckg_cmask_i(j);
            
        end generate;
        
    end generate;




    --// assign data_o
    gen_data_o : for i in 0 to W-1 generate
        
        data_o(data_o'high - i*(N+BG) downto data_o'length - (i+1)*(N+BG)) <= data_acc_int(0, i);

    end generate;




end architecture;
