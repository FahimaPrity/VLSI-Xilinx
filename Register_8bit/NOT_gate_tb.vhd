library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity NOT_gate_tb is

end NOT_gate_tb;



architecture sim of NOT_gate_tb is

    signal A, Y : STD_LOGIC := '0';

begin

    uut: entity work.NOT_gate port map (A => A, Y => Y);



    stim: process

    begin

        A <= '0'; wait for 10 ns;

        A <= '1'; wait for 10 ns;

        wait;

    end process;

end sim;
