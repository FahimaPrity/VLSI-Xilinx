-- Testbench for control_unit: all 16 opcodes (5 valid + NOP for the rest)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit_tb is
end control_unit_tb;

architecture sim of control_unit_tb is
    signal opcode  : std_logic_vector(3 downto 0) := "0000";
    signal alu_sel : std_logic_vector(2 downto 0);
    signal acc_we  : std_logic;
begin
    uut : entity work.control_unit
        port map (opcode => opcode, alu_sel => alu_sel, acc_we => acc_we);

    stim : process
    begin
        for i in 0 to 15 loop
            opcode <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            case i is
                when 1 =>   -- LDI
                    assert alu_sel = "000" and acc_we = '1' report "LDI wrong" severity error;
                when 2 =>   -- ADD
                    assert alu_sel = "001" and acc_we = '1' report "ADD wrong" severity error;
                when 5 =>   -- OR
                    assert alu_sel = "010" and acc_we = '1' report "OR wrong" severity error;
                when 7 =>   -- NOT
                    assert alu_sel = "011" and acc_we = '1' report "NOT wrong" severity error;
                when 9 =>   -- SHR
                    assert alu_sel = "100" and acc_we = '1' report "SHR wrong" severity error;
                when others => -- NOP
                    assert acc_we = '0'
                        report "Opcode " & integer'image(i) & " should be NOP" severity error;
            end case;
        end loop;
        report "control_unit_tb finished." severity note;
        wait;
    end process;
end sim;
