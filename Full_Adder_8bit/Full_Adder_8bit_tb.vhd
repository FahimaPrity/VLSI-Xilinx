library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Full_Adder_8bit is

    Port ( 

        A    : in  STD_LOGIC_VECTOR (7 downto 0);

        B    : in  STD_LOGIC_VECTOR (7 downto 0);

        Cin  : in  STD_LOGIC;

        Sum  : out STD_LOGIC_VECTOR (7 downto 0);

        Cout : out STD_LOGIC

    );

end Full_Adder_8bit;



architecture Structural of Full_Adder_8bit is



    component Full_adder is

        Port ( 

            A    : in  STD_LOGIC;

            B    : in  STD_LOGIC;

            Cin  : in  STD_LOGIC;

            Sum  : out STD_LOGIC;

            Cout : out STD_LOGIC

        );

    end component;



    signal C : STD_LOGIC_VECTOR (6 downto 0);



begin



    FA_0: Full_adder port map (

        A => A(0),

        B => B(0),

        Cin => Cin,

        Sum => Sum(0),

        Cout => C(0)

    );



    GEN_FA: for i in 1 to 6 generate

        FA_i: Full_adder port map (

            A => A(i),

            B => B(i),

            Cin => C(i-1),

            Sum => Sum(i),

            Cout => C(i)

        );

    end generate GEN_FA;



    FA_7: Full_adder port map (

        A => A(7),

        B => B(7),

        Cin => C(6),

        Sum => Sum(7),

        Cout => Cout

    );



end Structural;
