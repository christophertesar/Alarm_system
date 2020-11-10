library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBlinkSystem IS
	port ( 
		SW: in std_logic_vector(0 downto 0);
		CLOCK_50: in std_logic;
		HEX7, HEX6, HEX5, HEX4: out std_logic_vector(6 downto 0);
		LEDG: out std_logic_vector(7 downto 0);
		LEDR: out std_logic_vector(17 downto 0)
	);
end TestBlinkSystem;

architecture structural oF TestBlinkSystem iS

component BlinkSystem IS
	port ( 
		enable, clock: in std_logic;
		Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
		green: out std_logic_vector(7 downto 0);
		red: out std_logic_vector(17 downto 0)
	);
end component;

component PreScale is
port(InClock: in std_logic;
	  OutClock: out std_logic);
end component;

signal clock: std_logic;


begin

obj1:PreScale port map(InClock => CLOCK_50, OutClock => clock); 

obj2:BlinkSystem port map(
	clock => clock, Seg3 => HEX7, Seg2 => HEX6, Seg1 => HEX5, 
	Seg0 => HEX4, green => LEDG, red => LEDR, enable => SW(0)
	); 

end structural;