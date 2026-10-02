library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity D_Latch_1_tb is

end D_Latch_1_tb;



architecture sim of D_Latch_1_tb is

    signal D, En, Q, Qn : STD_LOGIC := '0';

begin

    uut: entity work.D_Latch_1 port map (D => D, En => En, Q => Q, Qn => Qn);



    stim: process

    begin

        En <= '1'; D <= '0'; wait for 10 ns;

        D <= '1'; wait for 10 ns;

        En <= '0'; D <= '0'; wait for 10 ns;  -- hold 1

        D <= '1'; wait for 10 ns;

        En <= '1'; D <= '0'; wait for 10 ns;

        En <= '0'; D <= '1'; wait for 10 ns;  -- hold 0

        wait;

    end process;

end sim;
