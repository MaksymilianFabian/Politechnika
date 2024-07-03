--155960, 155996
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity freq_div is 
    generic (
		m: integer:= 1
	);
	port(
		freq_in:  in std_logic;
		freq_out: out std_logic
	);
end entity freq_div;
		
architecture ttable of freq_div is
	signal n: integer:= 0;
	signal basic: std_logic:='0';
	signal counter:  integer:= 0;
begin
	process(freq_in)
    begin
        if rising_edge(freq_in) then
			if counter = 9 then
				counter <= 0;
				n <= n + 1;
			else
				counter <= counter + 1;
			end if;
			if n = m then
				basic <= not(basic);
				n <= 0;
			end if;
        end if;
    end process;

	freq_out <= basic;
end architecture ttable;
