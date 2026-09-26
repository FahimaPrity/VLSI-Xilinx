library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity AND_gate is

    Port ( A : in  STD_LOGIC;

           B : in  STD_LOGIC;

           Y : out STD_LOGIC);

end AND_gate;



architecture Structural of AND_gate is



    component NAND_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



    signal n1 : STD_LOGIC;



begin



    NAND1: NAND_gate port map (A => A, B => B, Y => n1);

    NAND2: NAND_gate port map (A => n1, B => n1, Y => Y);



end Structural;
