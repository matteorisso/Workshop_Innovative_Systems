library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen is
  port (
    CLK     : out std_logic;
    RST_fsm : out std_logic);
end clk_gen;

architecture beh of clk_gen is

  constant Ts : time := 2 ns;
  
  signal CLK_i : std_logic;
  
begin  -- beh

	process -- clock generation at 500mhz.
	begin
		CLK_i <= '1';
		wait for 1 ns;
		CLK_i <= '0';
		wait for 1 ns;
	end process;

  CLK <= CLK_i;

  process
  begin  -- process
    RST_fsm <= '1';
    wait for 3*Ts/2;
    RST_fsm <= '0';
    wait;
  end process;

end beh;
