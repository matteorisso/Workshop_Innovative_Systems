--
-- Testbench of the: fully connected layer 400 to 120.
--
library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

package IFMAP_OFMAP_type is

	--constant IFMAP_size : natural := 400;
	--constant OFMAP_size : natural := 120;
	constant PE_number : natural := 20;
	constant qi : natural := 8;
	constant qf : natural := 8;
	
	type IFMAP_type is array(0 to PE_number-1) of sfixed(qi-1 downto -qf);
	
end package IFMAP_OFMAP_type;


LIBRARY IEEE;
LIBRARY STD;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
use work.fixed_pkg.all; 

use work.IFMAP_OFMAP_type.all;

ENTITY TB_FC IS
	
	

END TB_FC;

ARCHITECTURE Test OF TB_FC IS

	COMPONENT fully_connected IS
		PORT(	
		CLK, RST_N : in std_logic;
		IFMAP, WEIGHTS : in IFMAP_type;
		OFMAP : out IFMAP_type
		);
	END COMPONENT;
	
	
	SIGNAL TB_CLK, TB_RST : STD_LOGIC;
	SIGNAL TB_IFMAP, TB_WEIGTHS, TB_OFMAP : IFMAP_type;
	
	
BEGIN
	
	PROCESS -- Clock generation at 50MHz.
	BEGIN
		TB_CLK <= '1';
		WAIT FOR 10 ns;
		TB_CLK <= '0';
		WAIT FOR 10 ns;
	END PROCESS;
	
	process
	begin
	TB_RST <= '1';
	
	WAIT FOR 40 ns; 
	TB_RST <= '0';
	FOR i IN TB_IFMAP'RANGE LOOP
    TB_IFMAP(i) <= "";
  END LOOP;
	TB_WEIGTHS <= (OTHERS => (OTHERS => '0'));
	
	WAIT FOR 800 ns;
	
	wait;
	end process;

	FC : fully_connected
		PORT MAP(
			CLK => TB_CLK, 
			RST_N => TB_RST, 
			IFMAP => TB_IFMAP, 
			WEIGHTS => TB_WEIGTHS,
			OFMAP => TB_OFMAP
			);
		 
END Test;
