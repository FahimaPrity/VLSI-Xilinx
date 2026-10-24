-- Testbench for alu: LDI, ADD (with carry discarded), OR, NOT, SHR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture sim of alu_tb is
    signal acc     : std_logic_vector(7 downto 0) := x"00";
    signal operand : std_logic_vector(7 downto 0) := x"00";
    signal sel     : std_logic_vector(2 downto 0) := "000";
    signal result  : std_logic_vector(7 downto 0);
begin
    uut : entity work.alu
        port map (acc => acc, operand => operand, sel => sel, result => result);

    stim : process
    begin
        -- LDI: result = operand
        acc <= x"55"; operand <= x"0F"; sel <= "000"; wait for 10 ns;
        assert result = x"0F" report "LDI failed" severity error;

        -- ADD: 0x0F + 0xA0 = 0xAF
        acc <= x"0F"; operand <= x"A0"; sel <= "001"; wait for 10 ns;
        assert result = x"AF" report "ADD failed (0x0F + 0xA0)" severity error;

        -- ADD with carry: 0x28 + 0xD8 = 0x100 -> 0x00
        acc <= x"28"; operand <= x"D8"; sel <= "001"; wait for 10 ns;
        assert result = x"00" report "ADD carry failed (0x28 + 0xD8)" severity error;

        -- OR: 0x0F or 0xA0 = 0xAF
        acc <= x"0F"; operand <= x"A0"; sel <= "010"; wait for 10 ns;
        assert result = x"AF" report "OR failed (0x0F, 0xA0)" severity error;

        -- OR: 0x00 or 0x81 = 0x81
        acc <= x"00"; operand <= x"81"; sel <= "010"; wait for 10 ns;
        assert result = x"81" report "OR failed (0x00, 0x81)" severity error;

        -- NOT: not 0xAF = 0x50 (operand ignored)
        acc <= x"AF"; operand <= x"FF"; sel <= "011"; wait for 10 ns;
        assert result = x"50" report "NOT failed" severity error;

        -- SHR: 0x50 -> 0x28
        acc <= x"50"; operand <= x"FF"; sel <= "100"; wait for 10 ns;
        assert result = x"28" report "SHR failed (0x50)" severity error;

        -- SHR: 0x81 -> 0x40
        acc <= x"81"; operand <= x"00"; sel <= "100"; wait for 10 ns;
        assert result = x"40" report "SHR failed (0x81)" severity error;

        -- SHR: 0x01 -> 0x00 (LSB is lost)
        acc <= x"01"; operand <= x"00"; sel <= "100"; wait for 10 ns;
        assert result = x"00" report "SHR failed (0x01)" severity error;

        report "alu_tb finished." severity note;
        wait;
    end process;
end sim;
