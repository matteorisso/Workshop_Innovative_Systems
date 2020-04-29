library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity addsub is
    generic (N : natural := N+BG);
    
    port(
        a_i        : in  std_logic_vector(N-1 downto 0);
        b_i        : in  std_logic_vector(N-1 downto 0);
        add_sub_ni : in  std_logic;
        s_i        : out std_logic_vector(N-1 downto 0)

        );

end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library synopsys;                       -- DW
use synopsys.attributes.all;

architecture beh_attribute of addsub is
    
    signal int_s_i : signed(N-1 downto 0);
begin
    
    s_i <= std_logic_vector(int_s_i);

    process(a_i, b_i, add_sub_ni)
        constant r_addsub : resource := 0;

        attribute ops of r_addsub            : constant is "a1";
        attribute map_to_module of r_addsub  : constant is "DW01_addsub";
        attribute implementation of r_addsub : constant is "cla";
        
    begin
        
        if add_sub_ni = '0' then
            
            int_s_i <= signed(a_i) + signed(b_i);  -- pragma label a1
            
        else
            
            int_s_i <= signed(a_i) - signed(b_i);  -- pragma label a1
            
        end if;
        
    end process;

end architecture;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;


--library DWARE;
--use DWARE.DWpackages.all;
--use DWARE.DW_foundation_comp.all;


--architecture dw of addsub is
--begin
    
--    a1 : DW01_addsub
--        generic map (width => N)
        
--        port map (
--            A       => a_i,
--            B       => b_i,
--            CI      => '0',
--            ADD_SUB => add_sub_ni,
--            SUM     => s_i

--            );

--end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

architecture beh of addsub is
    
    signal int_s_i : signed(N-1 downto 0);
begin
    
    s_i <= std_logic_vector(int_s_i);

    process(a_i, b_i, add_sub_ni)
    begin
        
        if add_sub_ni = '0' then
            
            int_s_i <= signed(a_i) + signed(b_i);
            
        else
            
            int_s_i <= signed(a_i) - signed(b_i);
            
        end if;
        
    end process;

    
end architecture;
