library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AlarmSystem IS
	port ( 
		CLOCK_50: in std_logic;
		HEX7, HEX6, HEX5, HEX4: out STD_LOGIC_VECTOR (6 downto 0);
		LEDG: out std_logic_vector (7 downto 0);
		LEDR: out std_logic_vector (17 downto 0);
		KEY: in std_logic_vector(0 downto 0);
		SW: in std_logic_vector(17 downto 0);
		HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0)
	);
end AlarmSystem;

architecture structural oF AlarmSystem iS

component PreScale is
port(InClock: in std_logic;
	  OutClock: out std_logic);
end component;

Component BlinkSystem IS
	port ( 
		enable, clock: in std_logic;
		Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
		green: out std_logic_vector(7 downto 0);
		red: out std_logic_vector(17 downto 0)
	);
end component;

component DisarmSystem IS
	port ( 
		clock: in std_logic;
		w: in std_logic_vector(1 downto 0);
		Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0);
		disarm: out std_logic
	);
end component;

SIGNAL clock, trigger, disarm: std_logic;


begin

obj4:PreScale port map(InClock => CLOCK_50, OutClock =>clock);

obj1:DisarmSystem port map(
clock => KEY(0), w(1 downto 0) => SW(2 downto 1), 
Seg0 => HEX2, Seg1 => HEX1, Seg2 => HEX0, disarm => disarm
);

obj2:BlinkSystem port map(
	clock => clock, Seg3 => HEX7, Seg2 => HEX6, Seg1 => HEX5, 
	Seg0 => HEX4, green => LEDG, red => LEDR, enable => trigger
	); 
	
process (disarm, SW(17),SW(16),SW(15), SW(0))
begin

	if disarm = '1' then
	trigger <= '0';
	end if;
	
	if SW(0) = '1' then
	
	elsif	SW(17) = '1' then
	trigger <= '1';
	elsif SW(16) = '1' then
	trigger <= '1';
	elsif SW(15) = '1' then
	trigger <= '1';
	end if;

end process;

end structural;