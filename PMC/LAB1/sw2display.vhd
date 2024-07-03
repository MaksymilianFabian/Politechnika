library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity sw2display is
	port(
		sw: in std_logic_vector(9 downto 0);
		hex5,hex4,hex3,hex2,hex1,hex0: out std_logic_vector(6 downto 0)
	);
end entity sw2display;

architecture structural of sw2display is
	component encoder is
		port(
			s: in std_logic_vector(5 downto 0);
			y: out std_logic_vector(3 downto 0)
		);
	end component;

	component demux3x6 is
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
	end component ;

	component dec7seg is
		port(
			bcd: in std_logic_vector(3 downto 0);
			seg: out std_logic_vector(6 downto 0)
		);
	end component;
	

	signal enc_out: std_logic_vector(3 downto 0);
	signal demux_out1: std_logic_vector(3 downto 0);
	signal demux_out2: std_logic_vector(3 downto 0);
	signal demux_out3: std_logic_vector(3 downto 0);
	signal demux_out4: std_logic_vector(3 downto 0);
	signal demux_out5: std_logic_vector(3 downto 0);
	signal demux_out6: std_logic_vector(3 downto 0);

begin
	enc: encoder port map(s=>sw(5 downto 0), y=>enc_out);