library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity OR_gate is

    Port ( A : in  STD_LOGIC;

           B : in  STD_LOGIC;

           Y : out STD_LOGIC);

end OR_gate;



architecture Structural of OR_gate is



    component NAND_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



    signal n1, n2 : STD_LOGIC;



begin



    NAND1: NAND_gate port map (A => A,  B => A,  Y => n1);

    NAND2: NAND_gate port map (A => B,  B => B,  Y => n2);

    NAND3: NAND_gate port map (A => n1, B => n2, Y => Y);



end Structural;
