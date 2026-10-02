library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Register_8bit_tb is

end Register_8bit_tb;



architecture sim of Register_8bit_tb is

    signal D   : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

    signal Clk : STD_LOGIC := '0';

    signal Q   : STD_LOGIC_VECTOR (7 downto 0);

begin

    uut: entity work.Register_8bit port map (D => D, Clk => Clk, Q => Q);



    clk_proc: process

    begin

        Clk <= '0'; wait for 10 ns;

        Clk <= '1'; wait for 10 ns;

    end process;



    stim: process

    begin

        D <= x"A5"; wait for 25 ns;

        D <= x"3C"; wait for 40 ns;

        D <= x"FF"; wait for 40 ns;

        D <= x"00"; wait for 40 ns;

        D <= x"5A"; wait for 40 ns;

        wait;

    end process;

end sim;
