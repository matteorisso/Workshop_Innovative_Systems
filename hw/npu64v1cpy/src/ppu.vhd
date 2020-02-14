library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity ppu is
  port(
    ck                : in  std_logic;
    rst               : in  std_logic;
    ctrl_cfg          : in  std_logic;
    ctrl_en_pool      : in  std_logic;
    ctrl_data_wrh_l_n : in  std_logic;
    i_data            : in  std_logic_vector((N+BG)*W-1 downto 0);
    o_data            : out std_logic_vector(N*W-1 downto 0)
    );
end entity;

architecture rtl of ppu is

  constant H_W : integer := W/2;

  signal int_o_data_relu    : std_logic_vector(N*W-1 downto 0);
  signal int_o_data_pool    : std_logic_vector((N+2)*H_W-1 downto 0);
  signal int_o_data_round_p : std_logic_vector(N*H_W-1 downto 0);
  signal int_o_data         : std_logic_vector(N*W-1 downto 0);
begin

  --// activation

  qrelu_inst :
  for i in 0 to W-1 generate
    qrelu_i:
      entity work.relu (sat)
        generic map (
          i_N => N+BG,
          o_N => N)                     
        port map (
          i_data                   => signed(i_data(i_data'high - i*(N+BG) downto i_data'length - (N+BG)*(i+1))),
          std_logic_vector(o_data) => int_o_data_relu(int_o_data_relu'high - i*N downto int_o_data_relu'length - N*(i+1)));
  end generate;

  --// subsampling K=2, S=2

  p_unit_inst:
  for i in 0 to H_W-1 generate
    p_unit_i :
      entity work.pool
        port map (
          ck                       => ck,
          rst                      => rst,
          en                       => ctrl_en_pool,
          i_data_1                 => unsigned(int_o_data_relu(int_o_data_relu'high - i*2*N downto int_o_data_relu'length - N*(i*2+1))),
          i_data_2                 => unsigned(int_o_data_relu(int_o_data_relu'high - (i*2+1)*N downto int_o_data_relu'length - N*(i*2+2))),
          std_logic_vector(o_data) => int_o_data_pool(int_o_data_pool'high - i*(N+2) downto int_o_data_pool'length - (i+1)*(N+2)));
  end generate;

  --// quantize pooling res

  quantize_p_inst:
  for i in 0 to H_W-1 generate
    round_i : entity work.round
      generic map (
        i_N => N+2,
        o_N => N)
      port map (
        i_data => std_logic_vector(int_o_data_pool(int_o_data_pool'high - i*(N+2) downto int_o_data_pool'length - (i+1)*(N+2))),
        o_data => int_o_data_round_p(int_o_data_round_p'high - i*N downto int_o_data_round_p'length - (i+1)*N));
  end generate;

  --// skip pool

  process (ctrl_cfg, ctrl_data_wrh_l_n, int_o_data_round_p, int_o_data_relu)
  begin
    if ctrl_cfg = '0' then
      if ctrl_data_wrh_l_n = '1' then                   --// pad msb
        int_o_data(N*W-1 downto N*H_W) <= (others => '0');
        int_o_data(N*H_W-1 downto 0)   <= int_o_data_round_p;
      else
        int_o_data(N*W-1 downto N*H_W) <= int_o_data_round_p;
        int_o_data(N*H_W-1 downto 0)   <= (others => '0');
      end if;
    else
      int_o_data <= std_logic_vector(int_o_data_relu);  --round_relu);
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      o_data <= (others => '0');
    elsif rising_edge(ck) then
      o_data <= int_o_data;
    end if;
  end process;
  
end architecture;
