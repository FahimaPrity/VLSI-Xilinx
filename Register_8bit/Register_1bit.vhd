library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Register_1bit is

    Port ( D   : in  STD_LOGIC;

           Clk : in  STD_LOGIC;

           Q   : out STD_LOGIC);

end Register_1bit;



architecture Structural of Register_1bit is

    component Master_Slave_d_FlipFlop

        Port ( D   : in  STD_LOGIC;

               Clk : in  STD_LOGIC;

               Q   : out STD_LOGIC;

               Qn  : out STD_LOGIC);

    end component;

begin

    FF0: Master_Slave_d_FlipFlop port map (D => D, Clk => Clk, Q => Q, Qn => open);

end Structural;
