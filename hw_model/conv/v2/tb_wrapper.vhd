library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tb_wrapper is
end entity;

architecture wrap of tb_wrapper is

begin
tb_inst: entity work.imem_w_tb (test_fc_rd);
	
end architecture; 