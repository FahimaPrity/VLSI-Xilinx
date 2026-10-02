library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Register_1bit_tb is

end Register_1bit_tb;



architecture sim of Register_1bit_tb is

    signal D, Clk : STD_LOGIC := '0';

    signal Q      : STD_LOGIC;

begin

    uut: entity work.Register_1bit port map (D => D, Clk => Clk, Q => Q);



    clk_proc: process

    begin

        Clk <= '0'; wait for 10 ns;

        Clk <= '1'; wait for 10 ns;

    end process;



    stim: process

    begin

        D <= '0'; wait for 25 ns;

        D <= '1'; wait for 40 ns;

        D <= '0'; wait for 40 ns;

        D <= '1'; wait for 40 ns;

        wait;

    end process;

end sim;
