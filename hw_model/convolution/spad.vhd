library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity spad is
  port(
    ck      : in  std_logic;
    rst     : in  std_logic;
    wr      : in  std_logic;
    cs_enc  : in  unsigned(clog2W-1 downto 0);
    rd_ptr  : in  unsigned(clog2W-1 downto 0);
    wr_addr : in  unsigned(CLOG2M_SP-1 downto 0);
    rd_addr : in  unsigned(CLOG2M_SP-1 downto 0);
    i_data  : in  signed((N+BG2)*W-1 downto 0);
    o_data  : out signed((N+BG2)*W-1 downto 0)
    );
end entity;


architecture rtl of spad is
  
  signal int_data_spad_even : spad_data_t;
  signal int_data_spad_odd  : spad_data_t;
  signal int_o_data         : spad_data_t;
  signal int_cs             : std_logic_vector(0 to W-1);
  
begin
  
  o_data <= int_o_data(to_integer(rd_ptr));

  cs_dec:
  process(cs_enc, rst)
  begin
    if rst = '1' then
      int_cs <= (others => '0');
    else
      case (to_integer(cs_enc)) is
        when 1      => int_cs <= "0100";
        when 2      => int_cs <= "0010";
        when 3      => int_cs <= "0001";
        when others => int_cs <= "1000";
      end case;
    end if;
  end process;


  -- spad inst

  scratch:
  for i in 0 to W-1 generate rfi:
                               
                               entity work. dual_port_rf
                                 generic map (n_word => (N+BG2)*W, n_addr => CLOG2M_SP, width => CL_MEM_WIDTH_SP)
                                 port map (
                                   ck      => ck,
                                   rst     => rst,
                                   cs      => int_cs(i),
                                   wr      => wr,
                                   rd_addr => rd_addr,
                                   wr_addr => wr_addr,
                                   i_data  => i_data,
                                   o_data  => int_o_data(i)
                                   );

  end generate;

end architecture;
