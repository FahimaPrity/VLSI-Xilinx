library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Register_4bit_tb is

end Register_4bit_tb;



architecture Behavioral of Register_4bit_tb is

    component Register_4bit

        Port ( CLK, RESET : in  STD_LOGIC;

               D          : in  STD_LOGIC_VECTOR(3 downto 0);

               Q          : out STD_LOGIC_VECTOR(3 downto 0));

    end component;

    signal CLK   : STD_LOGIC := '0';

    signal RESET : STD_LOGIC := '0';

    signal D     : STD_LOGIC_VECTOR(3 downto 0) := "0000";

    signal Q     : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Register_4bit port map (CLK, RESET, D, Q);



    clk_proc: process

    begin

        CLK <= '0'; wait for 5 ns;

        CLK <= '1'; wait for 5 ns;

    end process;



    stim: process

    begin

        -- Reset clears Q (D is ignored)

        RESET <= '1'; D <= "1010";

        wait for 10 ns;

        assert Q = "0000" report "Reset failed" severity error;



        -- Load D on rising edge

        RESET <= '0'; D <= "0101";

        wait for 10 ns;

        assert Q = "0101" report "Load failed" severity error;



        -- D changes between edges: Q must hold

        D <= "1111";

        wait for 2 ns;

        assert Q = "0101" report "Hold failed" severity error;

        wait for 8 ns;

        assert Q = "1111" report "Second load failed" severity error;



        -- Reset has priority over load

        RESET <= '1'; D <= "1010";

        wait for 10 ns;

        assert Q = "0000" report "Reset priority failed" severity error;



        wait;

    end process;

end Behavioral;
