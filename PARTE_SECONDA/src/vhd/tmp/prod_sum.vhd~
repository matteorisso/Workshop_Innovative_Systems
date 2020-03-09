library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

architecture beh of prod_sum is

  signal int_beta   : signed(15 downto 0);
  signal int_ps_en1 : std_logic;
  signal int_ps_en2 : std_logic;
  signal int_ps_en3 : std_logic;
  signal int_ps_en4 : std_logic;
  signal int_ps_en5 : std_logic;
  signal int_ps_en6 : std_logic;
  signal int_ps_en7 : std_logic;
  signal int_prod1  : signed(15 downto 0);
  signal int_prod2  : signed(15 downto 0);
  signal int_prod3  : signed(15 downto 0);
  signal int_prod4  : signed(15 downto 0);
  signal int_prod5  : signed(15 downto 0);
  signal int_prod6  : signed(15 downto 0);
  signal int_prod7  : signed(15 downto 0);
  signal int_prod8  : signed(15 downto 0);
begin
  o_data   <= int_prod8;
  --// align data from Q2.6 to Q8.8
  int_beta <= (to_signed(to_integer(i_beta), int_beta'length)) sll 2;

  process(ck, rst)
  begin
    if rst = '1' then
      int_ps_en1 <= '0';
      int_ps_en2 <= '0';
      int_ps_en3 <= '0';
      int_ps_en4 <= '0';
      int_ps_en5 <= '0';
      int_ps_en6 <= '0';
      int_ps_en7 <= '0';
    elsif rising_edge(ck) then
      int_ps_en1 <= int_ps_en2;
      int_ps_en2 <= int_ps_en1;
      int_ps_en3 <= int_ps_en2;
      int_ps_en4 <= int_ps_en3;
      int_ps_en5 <= int_ps_en4;
      int_ps_en6 <= int_ps_en5;
      int_ps_en7 <= int_ps_en6;
    end if;
  end process;

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

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod2 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en1 = '1' then
        int_prod2 <= int_prod1;
      else
        int_prod2 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod3 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en2 = '1' then
        int_prod3 <= int_prod2;
      else
        int_prod3 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod4 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en3 = '1' then
        int_prod4 <= int_prod3;
      else
        int_prod4 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod4 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en3 = '1' then
        int_prod4 <= int_prod3;
      else
        int_prod4 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod5 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en4 = '1' then
        int_prod5 <= int_prod4;
      else
        int_prod5 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod6 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en5 = '1' then
        int_prod6 <= int_prod6;
      else
        int_prod6 <= (others => '0');
      end if;
    end if;
  end process;
  process(ck, rst)
  begin
    if rst = '1' then
      int_prod6 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en5 = '1' then
        int_prod6 <= int_prod5;
      else
        int_prod6 <= (others => '0');
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      int_prod7 <= (others => '0');
    elsif rising_edge(ck) then
      if int_ps_en6 = '1' then
        int_prod7 <= int_prod6;
      else
        int_prod7 <= (others => '0');
      end if;
    end if;
  end process;
  
end architecture;
