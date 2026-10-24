-- Testbench for rom: reads all 16 addresses and compares with the Set 5 program
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom_tb is
end rom_tb;

architecture sim of rom_tb is
    signal addr  : std_logic_vector(3 downto 0) := "0000";
    signal instr : std_logic_vector(11 downto 0);

    type rom_t is array (0 to 15) of std_logic_vector(11 downto 0);
    constant EXPECTED : rom_t := (
        0      => x"10F",
        1      => x"5A0",
        2      => x"700",
        3      => x"900",
        4      => x"2D8",
        5      => x"581",
        6      => x"900",
        others => x"000"
    );
begin
    uut : entity work.rom
        port map (addr => addr, instr => instr);

    stim : process
    begin
        for i in 0 to 15 loop
            addr <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            assert instr = EXPECTED(i)
                report "ROM mismatch at address " & integer'image(i) severity error;
        end loop;
        report "rom_tb finished." severity note;
        wait;
    end process;
end sim;
