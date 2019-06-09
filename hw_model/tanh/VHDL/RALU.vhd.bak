library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RALU is
    port (
        AD : in std_ulogic_vector(7 downto -8);
        OT : out std_ulogic_vector(7 downto -8);
    );
end entity;

architecture behavioral of RALU is
begin

    process (AD) is
    begin
        case AD is      
      
        when AD <= "0000000001100110" => OT <= "0000000000000000";    
        when AD <= "0000000010000000" => OT <= "0000000000000111";
        when AD <= "0000000010011001" => OT <= "0000000000001100";
        when AD <= "0000000010110011" => OT <= "0000000000010100";
        when AD <= "0000000011001100" => OT <= "0000000000011101";
        when AD <= "0000000011100110" => OT <= "0000000000101000";
        when AD <= "0000000100011001" => OT <= "0000000000110110";
        when AD <= "0000000100110011" => OT <= "0000000000101110";
        when AD <= "0000000101001100" => OT <= "0000000000100111";
        when AD <= "0000000101100110" => OT <= "0000000000100000";
        when AD <= "0000000110000000" => OT <= "0000000000011010";
        when AD <= "0000000110011001" => OT <= "0000000000010101";
        when AD <= "0000000110110011" => OT <= "0000000000010010";
        when AD <= "0000000111001100" => OT <= "0000000000001111";
        when AD <= "0000000111100110" => OT <= "0000000000001100";
		  when AD <= "0000001000000000" => OT <= "0000000000001001";
		  when AD <= "1111111111111111" => OT <= "0000000000000000";
     
        end case;
    end process;
end architecture; 