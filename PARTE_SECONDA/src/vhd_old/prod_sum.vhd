library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library DWARE;
--use DWARE.DWpackages.all;
--use DWARE.DW_foundation_comp.all;

--// multiplier-adder

entity prod_sum is
  port(
    ck      : in  std_logic;
    rst     : in  std_logic;
    en      : in  std_logic;
    i_gamma : in  signed(7 downto 0);   --//Q2.6
    i_beta  : in  signed(7 downto 0);   --//Q2.6
    i_data  : in  signed(7 downto 0);   --//Q6.2
    o_data  : out signed(15 downto 0)   --//Q8.8
    );
end entity;

architecture beh_comb of prod_sum is

  signal int_beta  : signed(15 downto 0);
  signal int_prod1 : signed(15 downto 0);
begin
  o_data    <= int_prod1;
  int_beta  <= (to_signed(to_integer(i_beta), int_beta'length)) sll 2;  --// align data from Q2.6 to Q8.8
  int_prod1 <= i_data * i_gamma + int_beta when en = '1' else (others => '0');
  
end architecture;
architecture beh_seq of prod_sum is

  signal int_beta  : signed(15 downto 0);
  signal int_prod1 : signed(15 downto 0);
begin
  o_data   <= int_prod1;
  int_beta <= (to_signed(to_integer(i_beta), int_beta'length)) sll 2;  --// align data from Q2.6 to Q8.8
  process(ck, rst)
  begin
    if rst = '1' then
      int_prod1 <= (others => '0');
    elsif rising_edge(ck) then
      if en = '1' then
        int_prod1 <= i_data * i_gamma + int_beta;
      else
        int_prod1 <= (others => '0');
      end if;
    end if;
  end process;
  
end architecture;
--architecture dw_inst of prod_sum is
  
--  signal int_beta : signed(15 downto 0);
--begin
  
--  int_beta <= (to_signed(to_integer(i_beta), int_beta'length)) sll 2;  --// align data from Q2.6 to Q8.8

--  U1 : DW02_prod_sum1
--    generic map (
--      A_width   => 8,
--      B_width   => 8,
--      SUM_width => 16)
--    port map (
--      A           => std_logic_vector(i_data),
--      B           => std_logic_vector(i_gamma),
--      C           => std_logic_vector(int_beta),
--      TC          => en,
--      signed(SUM) => o_data);
  
--end architecture;
