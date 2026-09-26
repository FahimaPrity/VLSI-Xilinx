library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity XOR_gate is

    Port ( A : in  STD_LOGIC;

           B : in  STD_LOGIC;

           Y : out STD_LOGIC);

end XOR_gate;



architecture Structural of XOR_gate is



    component NAND_gate

        Port ( A : in  STD_LOGIC;

               B : in  STD_LOGIC;

               Y : out STD_LOGIC);

    end component;



    signal n1, n2, n3 : STD_LOGIC;



begin



    NAND1: NAND_gate port map (A => A,  B => B,  Y => n1);

    NAND2: NAND_gate port map (A => A,  B => n1, Y => n2);

    NAND3: NAND_gate port map (A => B,  B => n1, Y => n3);

    NAND4: NAND_gate port map (A => n2, B => n3, Y => Y);



end Structural;
