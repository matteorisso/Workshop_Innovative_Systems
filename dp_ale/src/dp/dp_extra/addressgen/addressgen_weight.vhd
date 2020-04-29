library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;
use work.dp_pkg.all;

entity addressgen_weight is
    generic (N : natural := ADDR_WIDTH_INT_W);

    port(
        clk    : in  std_logic;
        rst_n  : in  std_logic;
        --
        cmd_i  : in  addressgen_weight_cmd_t;
        addr_o : out std_logic_vector(N-1 downto 0)

        );

end entity;

architecture beh of addressgen_weight is

    signal addr_int      : std_logic_vector(N-1 downto 0);
    signal addr_base_int : std_logic_vector(N-1 downto 0);
    signal addr_offs_int : std_logic_vector(N-1 downto 0);
begin
    
    addr_o   <= addr_int;
    addr_int <= std_logic_vector(unsigned(addr_base_int) + unsigned(addr_offs_int));


    process(clk, rst_n)
    begin
        
        if (rst_n = '0') then
            
            addr_base_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (cmd_i.clr_base = '1') then
                
                addr_base_int <= addr_int;

            elsif (cmd_i.en_base = '1') then

                addr_base_int <= addr_int;

            end if;

        end if;


    end process;





    process(clk, rst_n)
    begin
        
        if (rst_n = '0') then
            
            addr_offs_int <= (others => '0');
            
        elsif rising_edge(clk) then

            if (cmd_i.clr_offs = '1') then

                addr_offs_int <= (others => '0');
                
            elsif (cmd_i.en_offs = '1') then
                
                addr_offs_int <= std_logic_vector(unsigned(addr_offs_int) + 1);
                
            end if;

        end if;


    end process;


    

end architecture;
