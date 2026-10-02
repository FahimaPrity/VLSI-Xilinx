library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Latch is

    Port ( S  : in  STD_LOGIC;

           R  : in  STD_LOGIC;

           Q  : out STD_LOGIC;

           Qn : out STD_LOGIC);

end Latch;



architecture Structural of Latch is

    component NAND_gate

        Port ( A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);

    end component;

    signal q_i, qn_i : STD_LOGIC;

begin

    N1: NAND_gate port map (A => S, B => qn_i, Y => q_i);

    N2: NAND_gate port map (A => R, B => q_i,  Y => qn_i);

    Q  <= q_i;

    Qn <= qn_i;

end Structural;
