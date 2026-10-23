-- Testbench: runs the Set 5 program of Appendix B and checks every cycle

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity cpu_tb is

end cpu_tb;



architecture sim of cpu_tb is

    signal clk   : std_logic := '0';

    signal reset : std_logic := '1';

    signal q     : std_logic_vector(7 downto 0);

    signal z     : std_logic;

    signal pc_o  : std_logic_vector(3 downto 0);

    signal done  : boolean := false;



    type byte_arr is array (0 to 7) of std_logic_vector(7 downto 0);

    type z_arr    is array (0 to 7) of std_logic;

    type pc_arr   is array (0 to 7) of std_logic_vector(3 downto 0);



    -- expected values AFTER each rising edge (cycle 0 = reset)

    constant EXP_ACC : byte_arr := (x"00", x"0F", x"AF", x"50", x"28", x"00", x"81", x"40");

    constant EXP_Z   : z_arr    := ('1', '0', '0', '0', '0', '1', '0', '0');

    constant EXP_PC  : pc_arr   := (x"0", x"1", x"2", x"3", x"4", x"5", x"6", x"7");

begin

    uut : entity work.cpu

        port map (clk => clk, reset => reset, q => q, z => z, pc_o => pc_o);



    clk <= not clk after 5 ns when not done else '0';



    stim : process

    begin

        -- cycle 0 : RESET = 1 for exactly one rising edge

        wait until rising_edge(clk);

        wait for 1 ns;

        reset <= '0';

        assert q = EXP_ACC(0) and z = EXP_Z(0) and pc_o = EXP_PC(0)

            report "Cycle 0 (reset) mismatch" severity error;



        -- cycles 1..7 : one instruction per clock

        for i in 1 to 7 loop

            wait until rising_edge(clk);

            wait for 1 ns;

            assert q = EXP_ACC(i) and z = EXP_Z(i) and pc_o = EXP_PC(i)

                report "Cycle " & integer'image(i) & " mismatch" severity error;

        end loop;



        report "Set 5 test finished: all cycles checked." severity note;

        done <= true;

        wait;

    end process;

end sim;
