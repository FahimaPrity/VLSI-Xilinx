library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Half_adder is

    Port ( A     : in  STD_LOGIC;

           B     : in  STD_LOGIC;

           Sum   : out STD_LOGIC;

           Carry : out STD_LOGIC);

end Half_adder;



architecture Structural of Half_adder is



    component XOR_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



    component AND_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



begin



    X1: XOR_gate port map (A => A, B => B, Y => Sum);

    A1: AND_gate port map (A => A, B => B, Y => Carry);



end Structural;
