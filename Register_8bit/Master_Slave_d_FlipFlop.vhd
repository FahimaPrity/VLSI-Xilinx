library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Master_Slave_d_FlipFlop is

    Port ( D   : in  STD_LOGIC;

           Clk : in  STD_LOGIC;

           Q   : out STD_LOGIC;

           Qn  : out STD_LOGIC);

end Master_Slave_d_FlipFlop;



architecture Structural of Master_Slave_d_FlipFlop is

    component NOT_gate

        Port ( A : in STD_LOGIC; Y : out STD_LOGIC);

    end component;

    component D_Latch_1

        Port ( D : in STD_LOGIC; En : in STD_LOGIC; Q : out STD_LOGIC; Qn : out STD_LOGIC);

    end component;

    component D_Latch_2

        Port ( D : in STD_LOGIC; En : in STD_LOGIC; Q : out STD_LOGIC; Qn : out STD_LOGIC);

    end component;

    signal clk_n, qm, qm_n : STD_LOGIC;

begin

    U1: NOT_gate  port map (A => Clk, Y => clk_n);

    U2: D_Latch_1 port map (D => D,  En => clk_n, Q => qm, Qn => qm_n);   -- master

    U3: D_Latch_2 port map (D => qm, En => Clk,   Q => Q,  Qn => Qn);     -- slave

end Structural;
