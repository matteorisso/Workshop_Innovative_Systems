library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity act_if is
  port (
    i_data1      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data2      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data3      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data4      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data5      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data6      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data7      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_data8      : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_sel_rotate : in  unsigned(CLOG2W-1 downto 0);
    i_sel_column : in  unsigned(CLOG2K-1 downto 0);
    o_data1      : out signed(N-1 downto 0);
    o_data2      : out signed(N-1 downto 0);
    o_data3      : out signed(N-1 downto 0);
    o_data4      : out signed(N-1 downto 0);
    o_data5      : out signed(N-1 downto 0);
    o_data6      : out signed(N-1 downto 0);
    o_data7      : out signed(N-1 downto 0);
    o_data8      : out signed(N-1 downto 0)
    );
end entity;

architecture beh of act_if is

  signal int_data1 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data2 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data3 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data4 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data5 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data6 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data7 : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_data8 : std_logic_vector(N*(K-1)-1 downto 0);
  
begin

  rotate_1:
  process(
    i_data1,
    i_data2,
    i_data3,
    i_data4,
    i_data5,
    i_data6,
    i_data7,
    i_data8,
    i_sel_rotate)
  begin
    
    case (to_integer(i_sel_rotate)) is
      
      when 1 =>

        int_data1 <= i_data2;
        int_data2 <= i_data3;
        int_data3 <= i_data4;
        int_data4 <= i_data5;
        int_data5 <= i_data6;
        int_data6 <= i_data7;
        int_data7 <= i_data8;
        int_data8 <= i_data1;

      when 2 =>

        int_data1 <= i_data3;
        int_data2 <= i_data4;
        int_data3 <= i_data5;
        int_data4 <= i_data6;
        int_data5 <= i_data7;
        int_data6 <= i_data8;
        int_data7 <= i_data1;
        int_data8 <= i_data2;


      when 3 =>

        int_data1 <= i_data4;
        int_data2 <= i_data5;
        int_data3 <= i_data6;
        int_data4 <= i_data7;
        int_data5 <= i_data8;
        int_data6 <= i_data1;
        int_data7 <= i_data2;
        int_data8 <= i_data3;
        
      when 4 =>

        int_data1 <= i_data5;
        int_data2 <= i_data6;
        int_data3 <= i_data7;
        int_data4 <= i_data8;
        int_data5 <= i_data1;
        int_data6 <= i_data2;
        int_data7 <= i_data3;
        int_data8 <= i_data4;
        
      when 5 =>

        int_data1 <= i_data6;
        int_data2 <= i_data7;
        int_data3 <= i_data8;
        int_data4 <= i_data1;
        int_data5 <= i_data2;
        int_data6 <= i_data3;
        int_data7 <= i_data4;
        int_data8 <= i_data5;

      when 6 =>

        int_data1 <= i_data7;
        int_data2 <= i_data8;
        int_data3 <= i_data1;
        int_data4 <= i_data2;
        int_data5 <= i_data3;
        int_data6 <= i_data4;
        int_data7 <= i_data5;
        int_data8 <= i_data6;
        
      when 7 =>

        int_data1 <= i_data8;
        int_data2 <= i_data1;
        int_data3 <= i_data2;
        int_data4 <= i_data3;
        int_data5 <= i_data4;
        int_data6 <= i_data5;
        int_data7 <= i_data6;
        int_data8 <= i_data7;
        
      when others =>

        int_data1 <= i_data1;
        int_data2 <= i_data2;
        int_data3 <= i_data3;
        int_data4 <= i_data4;
        int_data5 <= i_data5;
        int_data6 <= i_data6;
        int_data7 <= i_data7;
        int_data8 <= i_data8;

    end case;
  end process;

  mux_1:
  process(int_data1,
          int_data2,
          int_data3,
          int_data4,
          int_data5,
          int_data6,
          int_data7,
          int_data8,
          i_sel_column)
  begin
    
    case (to_integer(i_sel_column)) is
      
      when 1 =>

        o_data1 <= signed(int_data1(int_data1'high - 1*N downto int_data1'length - 2*N));
        o_data2 <= signed(int_data2(int_data2'high - 1*N downto int_data2'length - 2*N));
        o_data3 <= signed(int_data3(int_data3'high - 1*N downto int_data3'length - 2*N));
        o_data4 <= signed(int_data4(int_data4'high - 1*N downto int_data4'length - 2*N));
        o_data5 <= signed(int_data5(int_data5'high - 1*N downto int_data5'length - 2*N));
        o_data6 <= signed(int_data6(int_data6'high - 1*N downto int_data6'length - 2*N));
        o_data7 <= signed(int_data7(int_data7'high - 1*N downto int_data7'length - 2*N));
        o_data8 <= signed(int_data8(int_data8'high - 1*N downto int_data8'length - 2*N));
        
      when 2 =>

        o_data1 <= signed(int_data1(int_data1'high - 2*N downto int_data1'length - 3*N));
        o_data2 <= signed(int_data2(int_data2'high - 2*N downto int_data2'length - 3*N));
        o_data3 <= signed(int_data3(int_data3'high - 2*N downto int_data3'length - 3*N));
        o_data4 <= signed(int_data4(int_data4'high - 2*N downto int_data4'length - 3*N));
        o_data5 <= signed(int_data5(int_data5'high - 2*N downto int_data5'length - 3*N));
        o_data6 <= signed(int_data6(int_data6'high - 2*N downto int_data6'length - 3*N));
        o_data7 <= signed(int_data7(int_data7'high - 2*N downto int_data7'length - 3*N));
        o_data8 <= signed(int_data8(int_data8'high - 2*N downto int_data8'length - 3*N));

      when 3 =>

        o_data1 <= signed(int_data1(int_data1'high - 3*N downto int_data1'length - 4*N));
        o_data2 <= signed(int_data2(int_data2'high - 3*N downto int_data2'length - 4*N));
        o_data3 <= signed(int_data3(int_data3'high - 3*N downto int_data3'length - 4*N));
        o_data4 <= signed(int_data4(int_data4'high - 3*N downto int_data4'length - 4*N));
        o_data5 <= signed(int_data5(int_data5'high - 3*N downto int_data5'length - 4*N));
        o_data6 <= signed(int_data6(int_data6'high - 3*N downto int_data6'length - 4*N));
        o_data7 <= signed(int_data7(int_data7'high - 3*N downto int_data7'length - 4*N));
        o_data8 <= signed(int_data8(int_data8'high - 3*N downto int_data8'length - 4*N));

      when others =>

        o_data1 <= signed(int_data1(int_data1'high - 0*N downto int_data1'length - 1*N));
        o_data2 <= signed(int_data2(int_data2'high - 0*N downto int_data2'length - 1*N));
        o_data3 <= signed(int_data3(int_data3'high - 0*N downto int_data3'length - 1*N));
        o_data4 <= signed(int_data4(int_data4'high - 0*N downto int_data4'length - 1*N));
        o_data5 <= signed(int_data5(int_data5'high - 0*N downto int_data5'length - 1*N));
        o_data6 <= signed(int_data6(int_data6'high - 0*N downto int_data6'length - 1*N));
        o_data7 <= signed(int_data7(int_data7'high - 0*N downto int_data7'length - 1*N));
        o_data8 <= signed(int_data8(int_data8'high - 0*N downto int_data8'length - 1*N));
        
    end case;
  end process;

end architecture;
