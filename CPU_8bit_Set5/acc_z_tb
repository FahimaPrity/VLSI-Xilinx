-- Testbench for acc_z: reset, write enable, hold and Z flag
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_z_tb is
end acc_z_tb;

architecture sim of acc_z_tb is
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal we    : std_logic := '0';
    signal d     : std_logic_vector(7 downto 0) := x"00";
    signal acc   : std_logic_vector(7 downto 0);
    signal z     : std_logic;
    signal done  : boolean := false;
begin
    uut : entity work.acc_z
        port map (clk => clk, reset => reset, we => we, d => d, acc => acc, z => z);

    clk <= not clk after 5 ns when not done else '0';

    stim : process
    begin
        -- reset: ACC = 0x00, Z = 1
        wait until rising_edge(clk); wait for 1 ns;
        reset <= '0';
        assert acc = x"00" and z = '1' report "Reset failed" severity error;

        -- we = 0: nothing is written (NOP)
        d <= x"55"; we <= '0';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"00" and z = '1' report "Write happened with we = 0" severity error;

        -- write 0x0F: Z = 0
        d <= x"0F"; we <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"0F" and z = '0' report "Write 0x0F failed" severity error;

        -- hold with we = 0: ACC and Z keep their values
        d <= x"00"; we <= '0';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"0F" and z = '0' report "Hold failed" severity error;

        -- write 0x00: Z = 1
        d <= x"00"; we <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"00" and z = '1' report "Write 0x00 failed (Z should be 1)" severity error;

        -- write 0x81: Z = 0
        d <= x"81"; we <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"81" and z = '0' report "Write 0x81 failed" severity error;

        -- reset has priority over write
        reset <= '1'; d <= x"FF"; we <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        assert acc = x"00" and z = '1' report "Reset priority failed" severity error;

        report "acc_z_tb finished." severity note;
        done <= true;
        wait;
    end process;
end sim;
