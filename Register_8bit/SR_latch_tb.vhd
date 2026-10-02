library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity SR_latch_tb is

end SR_latch_tb;



architecture sim of SR_latch_tb is

    signal S_n, R_n : STD_LOGIC := '1';

    signal Q, Qn    : STD_LOGIC;

begin

    uut: entity work.SR_latch port map (S_n => S_n, R_n => R_n, Q => Q, Qn => Qn);



    stim: process

    begin

        S_n <= '0'; R_n <= '1'; wait for 10 ns;  -- set

        S_n <= '1'; R_n <= '1'; wait for 10 ns;  -- hold

        S_n <= '1'; R_n <= '0'; wait for 10 ns;  -- reset

        S_n <= '1'; R_n <= '1'; wait for 10 ns;  -- hold

        S_n <= '0'; R_n <= '1'; wait for 10 ns;  -- set

        wait;

    end process;

end sim;
