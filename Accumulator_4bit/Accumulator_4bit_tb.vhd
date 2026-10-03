library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Accumulator_4bit_tb is

end Accumulator_4bit_tb;



architecture Behavioral of Accumulator_4bit_tb is

    component Accumulator_4bit

        Port ( A, B       : in  STD_LOGIC_VECTOR(3 downto 0);

               CLK, RESET : in  STD_LOGIC;

               Q          : out STD_LOGIC_VECTOR(3 downto 0));

    end component;

    signal A, B  : STD_LOGIC_VECTOR(3 downto 0) := "0000";

    signal CLK   : STD_LOGIC := '0';

    signal RESET : STD_LOGIC := '0';

    signal Q     : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Accumulator_4bit port map (A, B, CLK, RESET, Q);



    clk_proc: process

    begin

        CLK <= '0'; wait for 5 ns;

        CLK <= '1'; wait for 5 ns;

    end process;



    stim: process

    begin

        -- Step 1: Reset

        RESET <= '1'; A <= "0000"; B <= "0000";

        wait for 10 ns;

        assert Q = "0000" report "Step 1 failed" severity error;



        -- Step 2: 3 + 5

        RESET <= '0'; A <= "0011"; B <= "0101";

        wait for 10 ns;

        assert Q = "1000" report "Step 2 failed" severity error;



        -- Step 3: 2 + 1

        A <= "0010"; B <= "0001";

        wait for 10 ns;

        assert Q = "0011" report "Step 3 failed" severity error;



        -- Step 4: 15 + 1 (overflow)

        A <= "1111"; B <= "0001";

        wait for 10 ns;

        assert Q = "0000" report "Step 4 failed" severity error;



        -- Step 5: 10 + 5

        A <= "1010"; B <= "0101";

        wait for 10 ns;

        assert Q = "1111" report "Step 5 failed" severity error;



        wait;

    end process;

end Behavioral;
