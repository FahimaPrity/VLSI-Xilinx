library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity NAND_gate_tb is

end NAND_gate_tb;



architecture sim of NAND_gate_tb is

    signal A, B, Y : STD_LOGIC := '0';

begin

    uut: entity work.NAND_gate port map (A => A, B => B, Y => Y);



    stim: process

    begin

        A <= '0'; B <= '0'; wait for 10 ns;

        A <= '0'; B <= '1'; wait for 10 ns;

        A <= '1'; B <= '0'; wait for 10 ns;

        A <= '1'; B <= '1'; wait for 10 ns;

        wait;

    end process;

end sim;library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity NAND_gate_tb is

end NAND_gate_tb;



architecture sim of NAND_gate_tb is

    signal A, B, Y : STD_LOGIC := '0';

begin

    uut: entity work.NAND_gate port map (A => A, B => B, Y => Y);



    stim: process

    begin

        A <= '0'; B <= '0'; wait for 10 ns;

        A <= '0'; B <= '1'; wait for 10 ns;

        A <= '1'; B <= '0'; wait for 10 ns;

        A <= '1'; B <= '1'; wait for 10 ns;

        wait;

    end process;

end sim;
