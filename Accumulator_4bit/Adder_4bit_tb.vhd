library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Adder_4bit_tb is

end Adder_4bit_tb;



architecture Behavioral of Adder_4bit_tb is

    component Adder_4bit

        Port ( A, B : in  STD_LOGIC_VECTOR(3 downto 0);

               Cin  : in  STD_LOGIC;

               S    : out STD_LOGIC_VECTOR(3 downto 0);

               Cout : out STD_LOGIC);

    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := "0000";

    signal Cin  : STD_LOGIC := '0';

    signal S    : STD_LOGIC_VECTOR(3 downto 0);

    signal Cout : STD_LOGIC;

begin

    UUT: Adder_4bit port map (A, B, Cin, S, Cout);



    stim: process

        procedure apply(a_v, b_v : STD_LOGIC_VECTOR(3 downto 0);

                        c_v      : STD_LOGIC;

                        s_e      : STD_LOGIC_VECTOR(3 downto 0);

                        co_e     : STD_LOGIC) is

        begin

            A <= a_v; B <= b_v; Cin <= c_v;

            wait for 100 ns;

            assert (S = s_e and Cout = co_e)

                report "4-bit adder mismatch" severity error;

        end procedure;

    begin

        apply("0000", "0000", '0', "0000", '0');  -- 0 + 0

        apply("0011", "0101", '0', "1000", '0');  -- 3 + 5

        apply("0010", "0001", '0', "0011", '0');  -- 2 + 1

        apply("1001", "0110", '0', "1111", '0');  -- 9 + 6

        apply("1010", "0101", '0', "1111", '0');  -- 10 + 5

        apply("1111", "0001", '0', "0000", '1');  -- 15 + 1 (overflow)

        apply("0111", "1000", '1', "0000", '1');  -- 7 + 8 + 1

        wait;

    end process;

end Behavioral;
