library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PreScale is
port(InClock: in std_logic;
	  OutClock: out std_logic);
end PreScale;

architecture behavior of Prescale is

signal counter: unsigned(24 downto 0);

begin

process(InClock)

begin

if rising_edge(InClock) then

	counter <= counter + 1;

end if;

end process; 

process(counter)

begin

if counter(24) = '1' then

	OutClock <= '1';
	
else
	
	OutClock <= '0';
	
end if;

end process; 

end behavior;