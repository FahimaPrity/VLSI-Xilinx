-- Control Unit: decodes opcode[11:8]

-- Set 5 : LDI(0001) ADD(0010) OR(0101) NOT(0111) SHR(1001). Anything else = NOP

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity control_unit is

    port (

        opcode  : in  std_logic_vector(3 downto 0);

        alu_sel : out std_logic_vector(2 downto 0);

        acc_we  : out std_logic                      -- load enable for ACC and Z

    );

end control_unit;



architecture rtl of control_unit is

begin

    process (opcode)

    begin

        alu_sel <= "000";

        acc_we  <= '1';

        case opcode is

            when "0001" => alu_sel <= "000";   -- LDI

            when "0010" => alu_sel <= "001";   -- ADD

            when "0101" => alu_sel <= "010";   -- OR

            when "0111" => alu_sel <= "011";   -- NOT

            when "1001" => alu_sel <= "100";   -- SHR

            when others => acc_we  <= '0';     -- NOP

        end case;

    end process;

end rtl;
