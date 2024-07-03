--155960, 155996
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity key2display is
	Port(
			max10_clk1_50 : in std_logic;
			key : in std_logic_vector(1 downto 0);
			ledr : out std_logic;
			hex5,hex4,hex3,hex2,hex1,hex0 : out std_logic_vector(6 downto 0)
		);
end entity key2display;

architecture structural of key2display is
    component d_cntr4ceo is
		Port(    
			clk : in std_logic;
            rst : in std_logic;
            ce : in std_logic;
            tc : out std_logic;
            ceo : out std_logic;
            q : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component dec7seg is
		port(
			bcd: in std_logic_vector(3 downto 0);
			seg : out std_logic_vector(6 downto 0)
		);
    end component;
	
	component freq_div is
		port(
			freq_in:  in std_logic;
			freq_out: out std_logic
		);
    end component;
	
	signal mod_out0: std_logic_vector(23 downto 0);

	signal clk_aft_div: std_logic;
	
	signal ceo: std_logic_vector(5 downto 0);
	
begin

    div1: freq_div port map(freq_in => max10_clk1_50, freq_out => clk_aft_div);
	
	mod_counter0: d_cntr4ceo port map(
            clk => clk_aft_div,
            rst => key(0),
            ce => key(1),
            q => mod_out0(3 downto 0),
			ceo => ceo(0)
    );
	
    counter_gen: for i in 1 to 5 generate
       mod_counter: d_cntr4ceo port map(
            clk => clk_aft_div,
            rst => key(0),
			ce => ceo(i-1),
            q => mod_out0((((i+1)*4)-1) downto (i*4)),
			ceo => ceo(i)
		);

    end generate counter_gen; 
	
	w0:dec7seg port map(bcd => mod_out0(3 downto 0), seg => hex0);
	w1:dec7seg port map(bcd => mod_out0(7 downto 4), seg => hex1);
	w2:dec7seg port map(bcd => mod_out0(11 downto 8), seg => hex2);
	w3:dec7seg port map(bcd => mod_out0(15 downto 12), seg => hex3);
	w4:dec7seg port map(bcd => mod_out0(19 downto 16), seg => hex4);
	w5:dec7seg port map(bcd => mod_out0(23 downto 20), seg => hex5);
	
	ledr <= ceo(5);
	
end architecture structural;

