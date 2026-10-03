library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Adder_4bit is

    Port ( A, B : in  STD_LOGIC_VECTOR(3 downto 0);

           Cin  : in  STD_LOGIC;

           S    : out STD_LOGIC_VECTOR(3 downto 0);

           Cout : out STD_LOGIC);

end Adder_4bit;



architecture Structural of Adder_4bit is

    component FA_1bit

        Port ( A, B, Cin : in  STD_LOGIC;

               Sum, Cout : out STD_LOGIC);

    end component;

    signal c : STD_LOGIC_VECTOR(4 downto 0);

begin

    c(0) <= Cin;

    FA0: FA_1bit port map (A(0), B(0), c(0), S(0), c(1));

    FA1: FA_1bit port map (A(1), B(1), c(1), S(1), c(2));

    FA2: FA_1bit port map (A(2), B(2), c(2), S(2), c(3));

    FA3: FA_1bit port map (A(3), B(3), c(3), S(3), c(4));

    Cout <= c(4);

end Structural;
