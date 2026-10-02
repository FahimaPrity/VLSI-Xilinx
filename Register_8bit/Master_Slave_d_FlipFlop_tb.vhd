library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Master_Slave_d_FlipFlop_tb is

end Master_Slave_d_FlipFlop_tb;



architecture sim of Master_Slave_d_FlipFlop_tb is

    signal D, Clk : STD_LOGIC := '0';

    signal Q, Qn  : STD_LOGIC;

begin

    uut: entity work.Master_Slave_d_FlipFlop port map (D => D, Clk => Clk, Q => Q, Qn => Qn);



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

        D <= '1'; wait for 20 ns;

        D <= '0'; wait for 20 ns;

        wait;

    end process;

end sim;
