library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-- NOT 4 SYN

entity imem_if is
  port(
    i_data_v      : in  mem_data_t;
    i_data_h      : in  mem_data_t;
    rf_ptr        : in  unsigned(clog2W-1 downto 0);
    px_ptr        : in  unsigned(clog2K-1 downto 0);
    o_data_conv_v : out signed(N*W-1 downto 0);
    o_data_conv_h : out signed(N*W-1 downto 0);
    o_data_fc     : out signed(N-1 downto 0)
    );
end entity;

architecture beh of imem_if is

  signal int_data_conv_even : mem_data_t;
  signal int_data_conv_odd  : mem_data_t;

  signal int_o_data_conv_v : signed(o_data_conv_v'high downto 0);
  signal int_px_ptr        : integer;
  signal int_rf_ptr        : integer;

begin

-- CONV INTERFACE
  int_px_ptr <= to_integer(px_ptr);
  int_rf_ptr <= to_integer(rf_ptr);

-- V-mode
  int_o_data_conv_v <= i_data_v(to_integer(rf_ptr));
  o_data_conv_v     <= int_o_data_conv_v;

--  H-mode
  rd_col :
  for i in 0 to i_data_h'high generate
    o_data_conv_h(o_data_conv_h'length-1 - i*N downto o_data_conv_h'length - (i+1)*N)
      <= i_data_h(i)(o_data_conv_h'length-1 - int_px_ptr*N downto o_data_conv_h'length - (int_px_ptr+1)*N);
  end generate;

-- FC INTERFACE
  o_data_fc <= int_o_data_conv_v(
    int_o_data_conv_v'length-1 - int_px_ptr*N downto int_o_data_conv_v'length - (int_px_ptr+1)*N
    );


end architecture;

