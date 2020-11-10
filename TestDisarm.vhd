library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestDisarm IS
	port ( 
		KEY: in std_logic_vector(0 downto 0);
		SW: in std_logic_vector(1 downto 0);
		HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0)
	);
end TestDisarm;

architecture structural oF TestDisarm iS

component DisarmSystem IS
	port ( 
		clock: in std_logic;
		w: in std_logic_vector(1 downto 0);
		Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0);
		disarm: out std_logic
	);
end component;

begin

obj1:DisarmSystem port map(
clock => KEY(0), w => SW, 
Seg0 => HEX2, Seg1 => HEX1, Seg2 => HEX0);

end structural;