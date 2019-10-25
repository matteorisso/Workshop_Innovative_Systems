library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tb_imem is
end entity;

architecture test of tb_imem is

  signal ck_tb     : std_logic := '0';
  signal rst_tb    : std_logic := '1';
  signal cs_enc_tb : unsigned(CLOG2W-1 downto 0);
  signal wr_tb     : std_logic_vector(0 to W-1);
  
  
begin


end architecture;
