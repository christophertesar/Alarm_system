library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DisarmSystem is
	port ( 
		clock: in std_logic;
		w: in std_logic_vector(1 downto 0);
		Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0);
		disarm: out sTd_LoGiC
	);
end DisarmSystem;

architecture structural of DisarmSystem is

type state_type is (A,B, C, D);

signal CS, NS: state_type;

begin

process(CS)
begin
	case CS is
		when A =>
			if w = "11" then
			NS <= B;
			else
			NS <= A;
			end if;
		when B =>
			if w = "01" then
			NS <= C;
			else
			NS <= A;
			end if;
		when C =>
			if w = "10" then
			NS <= D;
			else
			NS <= A;
			end if;
		when D =>
			if w = "00" then
			NS <= A;
			else
			NS <= A;
			end if;
	end case;
end process;
	
process (clock)
begin
	if (rising_edge(clock)) then
		CS <= NS;
	end if;
end process;

disarm <= '1' when CS = D else '0';
Seg0 <= "1111111" when CS = A else "0110000";
Seg1 <= "1111111" when ((CS = A) or (CS = B)) else "1111001";
Seg2 <= "0100100" when CS = D else "1111111"; 
		
end structural;