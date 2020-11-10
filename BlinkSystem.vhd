library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BlinkSystem IS
	port ( 
		enable, clock: in std_logic;
		Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
		green: out std_logic_vector(7 downto 0);
		red: out std_logic_vector(17 downto 0)
	);
end BlinkSystem;

architecture structural oF BlinkSystem iS

signal blink: std_logic;

begin

process(blink, enable)
	BEGIN
	iF (enable = '0') then
		Seg0 <= "1111111";
		Seg1 <= "1111111";
		Seg2 <= "1111111";
		Seg3 <= "1111111";
	elsif (enable = '1') then
		if (blink = '0') then
		
		Seg0 <= "1111111";
		Seg1 <= "1111111";
		Seg2 <= "1111111";
		Seg3 <= "1111111";
		
		else
		
		Seg0 <= "0001100";
		Seg1 <= "1000111";
		Seg2 <= "0000110";
		Seg3 <= "0001001";
		
		end if;
	end if;
end process;

Process(clock)
begin
	if (rising_edge(clock)) then 
	blink <= '1' xor blink;
	end if; 
end process;

end structural;