-- Testbench for pc: reset, count up 0..15 and wrap-around to 0
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc_tb is
end pc_tb;

architecture sim of pc_tb is
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '1';
    signal pc_out : std_logic_vector(3 downto 0);
    signal done   : boolean := false;
begin
    uut : entity work.pc
        port map (clk => clk, reset => reset, pc_out => pc_out);

    clk <= not clk after 5 ns when not done else '0';

    stim : process
        variable exp : integer;
    begin
        -- reset for one rising edge
        wait until rising_edge(clk);
        wait for 1 ns;
        reset <= '0';
        assert pc_out = "0000" report "PC is not 0 after reset" severity error;

        -- count 1..17 (wraps 15 -> 0 -> 1)
        for i in 1 to 17 loop
            wait until rising_edge(clk);
            wait for 1 ns;
            exp := i mod 16;
            assert to_integer(unsigned(pc_out)) = exp
                report "PC mismatch at cycle " & integer'image(i) severity error;
        end loop;

        -- reset in the middle of counting
        reset <= '1';
        wait until rising_edge(clk);
        wait for 1 ns;
        assert pc_out = "0000" report "PC is not 0 after second reset" severity error;

        report "pc_tb finished." severity note;
        done <= true;
        wait;
    end process;
end sim;
