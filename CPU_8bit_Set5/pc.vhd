-- 4-bit Program Counter (Set 5 has no JZ, so PC <- PC + 1 every clock)

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity pc is

    port (

        clk    : in  std_logic;

        reset  : in  std_logic;                     -- synchronous, active-high

        pc_out : out std_logic_vector(3 downto 0)

    );

end pc;



architecture rtl of pc is

    signal pc_reg : unsigned(3 downto 0) := (others => '0');

begin

    process (clk)

    begin

        if rising_edge(clk) then

            if reset = '1' then

                pc_reg <= (others => '0');

            else

                pc_reg <= pc_reg + 1;

            end if;

        end if;

    end process;



    pc_out <= std_logic_vector(pc_reg);

end rtl;
