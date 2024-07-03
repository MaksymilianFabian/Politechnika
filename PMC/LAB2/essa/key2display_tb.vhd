--155960, 155996
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity key2display_tb is
end key2display_tb;

architecture behav of key2display_tb is 
    component key2display
		Port(
			max10_clk1_50 : in std_logic;
			key : in std_logic_vector(1 downto 0);
			ledr : out std_logic;
			hex5,hex4,hex3,hex2,hex1,hex0 : out std_logic_vector(6 downto 0)
		);
    end component;
	signal max10_clk1_50 : std_logic;
	signal key : std_logic_vector(1 downto 0);
	signal ledr : std_logic;
    signal hex5 : std_logic_vector(6 downto 0);
    signal hex4 : std_logic_vector(6 downto 0);
    signal hex3 : std_logic_vector(6 downto 0);
    signal hex2 : std_logic_vector(6 downto 0);
    signal hex1 : std_logic_vector(6 downto 0);
    signal hex0 : std_logic_vector(6 downto 0);

begin
    UUT: key2display port map(
          max10_clk1_50 => max10_clk1_50,
		  key => key,
		  ledr => ledr,
          hex5 => hex5,
          hex4 => hex4,
          hex3 => hex3,
          hex2 => hex2,
          hex1 => hex1,
          hex0 => hex0
        );

    stim_proc: process
		variable start_time: time;
		variable idk: std_logic:='0';
		variable idk1: string (1 to 6);
	begin		
		key(1) <= '0';
		key(0) <= '0';
		for i in 1 to 1000 loop
			max10_clk1_50 <= '0'; 
			wait for 10 ns;	
			max10_clk1_50 <= '1'; 
			wait for 10 ns;	
		end loop;
		key(1) <= '1';
		for i in 1 to 1000 loop
			max10_clk1_50 <= '0'; 
			wait for 10 ns;	
			max10_clk1_50 <= '1'; 
			wait for 10 ns;	
		end loop;
		key(0) <= '1';
		for i in 1 to 1000 loop
			max10_clk1_50 <= '0'; 
			wait for 10 ns;	
			max10_clk1_50 <= '1'; 
			wait for 10 ns;	
		end loop;
		key(0) <= '0';
		
		for i in 1 to 1000000000 loop
			if ledr = '1' and idk = '0' then
				idk:='1';
				start_time := now;	
				with hex0 select
				idk1(1) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
				with hex1 select
				idk1(2) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
				with hex2 select
				idk1(3) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
				with hex3 select
				idk1(4) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
				with hex4 select
				idk1(5) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
				with hex5 select
				idk1(6) :=  '1' when "1111001",
							'2' when "0100100",
							'3' when "0110000",
							'4' when "0011001",
							'5' when "0010010",
							'6' when "0000010",
							'7' when "1111000",
							'8' when "0000000",
							'9' when "0010000",
							'0' when "1000000",
							' ' when others;
			end if;
			if ledr = '0' and idk = '1' then
				report "Impuls: " & time'image(now - start_time);
				report "Wyjscie: " & idk1;
				idk:='0';
			end if;
			max10_clk1_50 <= '0'; 
			wait for 10 ns;	
			max10_clk1_50 <= '1'; 
			wait for 10 ns;	
		end loop;
		wait;
    end process;
end architecture behav;

