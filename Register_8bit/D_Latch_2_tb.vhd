library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity D_Latch_2_tb is

end D_Latch_2_tb;



architecture sim of D_Latch_2_tb is

    signal D, En : STD_LOGIC := '0';

    signal Q, Qn : STD_LOGIC;

begin

    uut: entity work.D_Latch_2 port map (D => D, En => En, Q => Q, Qn => Qn);



    stim: process

    begin

        En <= '1'; D <= '0'; wait for 10 ns;  -- transparent, Q=0

        D <= '1'; wait for 10 ns;             -- transparent, Q=1

        En <= '0'; D <= '0'; wait for 10 ns;  -- hold, Q stays 1

        D <= '1'; wait for 10 ns;             -- hold

        En <= '1'; D <= '0'; wait for 10 ns;  -- transparent, Q=0

        En <= '0'; D <= '1'; wait for 10 ns;  -- hold, Q stays 0

        wait;

    end process;

end sim;
