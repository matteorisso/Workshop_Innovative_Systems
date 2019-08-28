--
-- Multiplexer 2to1 with generic parallelism.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_mux2to1 is

	generic(n : integer := 4);
	port(
		sel : in std_logic;
		d_0, d_1 : in signed((n-1) downto 0);
		d_out : out signed((n-1) downto 0)
	);

end generic_mux2to1;

architecture behavior of generic_mux2to1 is

begin

	d_out <= d_0 when sel = '0' else
				d_1;

end behavior;