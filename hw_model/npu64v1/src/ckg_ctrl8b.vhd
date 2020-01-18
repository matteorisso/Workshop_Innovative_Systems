library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ckg_ctrl8b is
  port(
    arv_npu   : in  unsigned(2 downto 0);
    arv_ckg   : in  unsigned(2 downto 0);
    en_ckgr   : in  std_logic;
    en_ckgc   : in  std_logic;
    arv_res   : out unsigned(2 downto 0);
    ckg_rmask : out std_logic_vector(0 to 7);
    ckg_cmask : out std_logic_vector(0 to 7)
    );
end entity;

architecture rtl of ckg_ctrl8b is

  signal int_mask : std_logic_vector(0 to 7);
  
begin
  arv_res   <= arv_ckg  when en_ckgr = '1' else arv_npu;
  ckg_rmask <= int_mask when en_ckgr = '1' else (others => '0');
  ckg_cmask <= int_mask when en_ckgc = '1' else (others => '0');

  process(arv_ckg)
  begin
    case (to_integer(arv_ckg)) is
      when 0      => int_mask <= "01111111";
      when 1      => int_mask <= "00111111";
      when 2      => int_mask <= "00011111";
      when 3      => int_mask <= "00001111";
      when 4      => int_mask <= "00000111";
      when 5      => int_mask <= "00000011";
      when 6      => int_mask <= "00000001";
      when others => int_mask <= (others => '0');
                     
    end case;
  end process;
  
end architecture;
