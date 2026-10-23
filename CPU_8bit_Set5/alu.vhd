-- 8-bit combinational ALU (LDI, ADD, OR, NOT, SHR)

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity alu is

    port (

        acc     : in  std_logic_vector(7 downto 0);

        operand : in  std_logic_vector(7 downto 0);

        sel     : in  std_logic_vector(2 downto 0);

        result  : out std_logic_vector(7 downto 0)

    );

end alu;



architecture rtl of alu is

begin

    process (acc, operand, sel)

    begin

        case sel is

            when "000"  => result <= operand;                                              -- LDI

            when "001"  => result <= std_logic_vector(unsigned(acc) + unsigned(operand));  -- ADD (carry discarded)

            when "010"  => result <= acc or operand;                                       -- OR

            when "011"  => result <= not acc;                                              -- NOT

            when "100"  => result <= '0' & acc(7 downto 1);                                -- SHR (0 enters MSB)

            when others => result <= acc;

        end case;

    end process;

end rtl;
