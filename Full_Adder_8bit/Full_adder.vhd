library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Full_adder is

    Port ( A    : in  STD_LOGIC;

           B    : in  STD_LOGIC;

           Cin  : in  STD_LOGIC;

           Sum  : out STD_LOGIC;

           Cout : out STD_LOGIC);

end Full_adder;



architecture Structural of Full_adder is



    component Half_adder

        Port ( A     : in  STD_LOGIC;

               B     : in  STD_LOGIC;

               Sum   : out STD_LOGIC;

               Carry : out STD_LOGIC);

    end component;



    component OR_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



    signal s1, c1, c2 : STD_LOGIC;



begin



    HA1: Half_adder port map (A => A,  B => B,   Sum => s1,  Carry => c1);

    HA2: Half_adder port map (A => s1, B => Cin, Sum => Sum, Carry => c2);

    OR1: OR_gate    port map (A => c1, B => c2,  Y => Cout);



end Structural;
