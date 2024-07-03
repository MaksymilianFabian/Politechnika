library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity demux3x6 is
	port (
		sel: in std_logic_vector(3 downto 0);
		din: in std_logic_vector(3 downto 0);
		dout1: out std_logic_vector(3 downto 0);
		dout2: out std_logic_vector(3 downto 0);
		dout3: out std_logic_vector(3 downto 0);
		dout4: out std_logic_vector(3 downto 0);
		dout5: out std_logic_vector(3 downto 0);
		dout6: out std_logic_vector(3 downto 0)
	);
end entity demux3x6;

architecture behavior of demux3x6 is
begin
	process(sel, din)
	begin
		dout1 <= (others => '0');
		dout2 <= (others => '0');
		dout3 <= (others => '0');
		dout4 <= (others => '0');
		dout5 <= (others => '0');
		dout6 <= (others => '0');

		case sel is
			when "0000" =>
				dout1 <= din;
			when "0001" =>
				dout2 <= din;
			when "0010" =>
				dout3 <= din;
			when "0011" =>
				dout4 <= din;
			when "0100" =>
				dout5 <= din;
			when "0101" =>
				dout6 <= din;
			when others =>
				null;
		end case;
	end process;
end behavior;