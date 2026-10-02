library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Latch_tb is

end Latch_tb;



architecture sim of Latch_tb is

    signal S, R : STD_LOGIC := '1';

    signal Q, Qn : STD_LOGIC;

begin

    uut: entity work.Latch port map (S => S, R => R, Q => Q, Qn => Qn);



    stim: process

    begin

        S <= '0'; R <= '1'; wait for 10 ns;  -- set

        S <= '1'; R <= '1'; wait for 10 ns;  -- hold

        S <= '1'; R <= '0'; wait for 10 ns;  -- reset

        S <= '1'; R <= '1'; wait for 10 ns;  -- hold

        S <= '0'; R <= '1'; wait for 10 ns;  -- set

        wait;

    end process;

end sim;
