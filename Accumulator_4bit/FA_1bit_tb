library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity FA_1bit_tb is

end FA_1bit_tb;



architecture Behavioral of FA_1bit_tb is

    component FA_1bit

        Port ( A, B, Cin : in  STD_LOGIC;

               Sum, Cout : out STD_LOGIC);

    end component;

    signal A, B, Cin : STD_LOGIC := '0';

    signal Sum, Cout : STD_LOGIC;

begin

    UUT: FA_1bit port map (A, B, Cin, Sum, Cout);



    stim: process

        procedure apply(a_v, b_v, c_v, s_e, co_e : STD_LOGIC) is

        begin

            A <= a_v; B <= b_v; Cin <= c_v;

            wait for 100 ns;

            assert (Sum = s_e and Cout = co_e)

                report "Full adder mismatch" severity error;

        end procedure;

    begin

        --      A    B    Cin  Sum  Cout

        apply('0', '0', '0', '0', '0');

        apply('0', '0', '1', '1', '0');

        apply('0', '1', '0', '1', '0');

        apply('0', '1', '1', '0', '1');

        apply('1', '0', '0', '1', '0');

        apply('1', '0', '1', '0', '1');

        apply('1', '1', '0', '0', '1');

        apply('1', '1', '1', '1', '1');

        wait;

    end process;

end Behavioral;
