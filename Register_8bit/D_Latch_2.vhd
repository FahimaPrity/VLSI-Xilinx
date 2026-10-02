library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity D_Latch_2 is

    Port ( D  : in  STD_LOGIC;

           En : in  STD_LOGIC;

           Q  : out STD_LOGIC;

           Qn : out STD_LOGIC);

end D_Latch_2;



architecture Structural of D_Latch_2 is

    component NOT_gate

        Port ( A : in STD_LOGIC; Y : out STD_LOGIC);

    end component;

    component NAND_gate

        Port ( A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);

    end component;

    component Latch

        Port ( S : in STD_LOGIC; R : in STD_LOGIC; Q : out STD_LOGIC; Qn : out STD_LOGIC);

    end component;

    signal d_n, s_n, r_n : STD_LOGIC;

begin

    U1: NOT_gate  port map (A => D,   Y => d_n);

    U2: NAND_gate port map (A => D,   B => En, Y => s_n);

    U3: NAND_gate port map (A => d_n, B => En, Y => r_n);

    U4: Latch     port map (S => s_n, R => r_n, Q => Q, Qn => Qn);

end Structural;
