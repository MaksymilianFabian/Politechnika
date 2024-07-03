--------------------------------------------------------------------------------
-- lab VHDL
-- encoder 10b
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity encoder is
  generic (delay: time := 3 ns);
  port (s: in std_logic_vector(5 downto 0); 
	y: out std_logic_vector(3 downto 0) );
end entity encoder;

architecture with_delay of encoder is
	signal y_tmp: std_logic_vector(y'range);
begin
y <= y_tmp after delay;
p_enc : process (s) begin
	case s is
		when b"000001" => y_tmp <= b"0000";
		when b"000010" => y_tmp <= b"0001";
		when b"000100" => y_tmp <= b"0010";
		when b"001000" => y_tmp <= b"0011";
		when b"010000" => y_tmp <= b"0100";
		when b"100000" => y_tmp <= b"0101";
		when others => y_tmp <= x"0";		
	end case;
end process;

end architecture with_delay;
