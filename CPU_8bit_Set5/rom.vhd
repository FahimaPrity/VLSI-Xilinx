-- Program ROM: 16 x 12 bits, combinational read. Set 5 program (Appendix B)

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity rom is

    port (

        addr  : in  std_logic_vector(3 downto 0);

        instr : out std_logic_vector(11 downto 0)

    );

end rom;



architecture rtl of rom is

    type rom_t is array (0 to 15) of std_logic_vector(11 downto 0);

    constant PROG : rom_t := (

        0      => x"10F",   -- LDI 0x0F

        1      => x"5A0",   -- OR  0xA0

        2      => x"700",   -- NOT

        3      => x"900",   -- SHR

        4      => x"2D8",   -- ADD 0xD8

        5      => x"581",   -- OR  0x81

        6      => x"900",   -- SHR

        others => x"000"    -- NOP

    );

begin

    instr <= PROG(to_integer(unsigned(addr)));

end rtl;
