-- ACC (8-bit) and Z flag. Set 5 has no STA/LDR so register R is not needed.

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity acc_z is

    port (

        clk   : in  std_logic;

        reset : in  std_logic;                       -- synchronous, active-high

        we    : in  std_logic;

        d     : in  std_logic_vector(7 downto 0);

        acc   : out std_logic_vector(7 downto 0);

        z     : out std_logic

    );

end acc_z;



architecture rtl of acc_z is

    signal acc_reg : std_logic_vector(7 downto 0) := (others => '0');

    signal z_reg   : std_logic := '1';

begin

    process (clk)

    begin

        if rising_edge(clk) then

            if reset = '1' then

                acc_reg <= (others => '0');

                z_reg   <= '1';

            elsif we = '1' then

                acc_reg <= d;

                if d = "00000000" then

                    z_reg <= '1';

                else

                    z_reg <= '0';

                end if;

            end if;

        end if;

    end process;



    acc <= acc_reg;

    z   <= z_reg;

end rtl;
