library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Accumulator_4bit is

    Port ( A, B       : in  STD_LOGIC_VECTOR(3 downto 0);

           CLK, RESET : in  STD_LOGIC;

           Q          : out STD_LOGIC_VECTOR(3 downto 0));

end Accumulator_4bit;



architecture Structural of Accumulator_4bit is

    component Adder_4bit

        Port ( A, B : in  STD_LOGIC_VECTOR(3 downto 0);

               Cin  : in  STD_LOGIC;

               S    : out STD_LOGIC_VECTOR(3 downto 0);

               Cout : out STD_LOGIC);

    end component;

    component Register_4bit

        Port ( CLK, RESET : in  STD_LOGIC;

               D          : in  STD_LOGIC_VECTOR(3 downto 0);

               Q          : out STD_LOGIC_VECTOR(3 downto 0));

    end component;

    signal sum_s  : STD_LOGIC_VECTOR(3 downto 0);

    signal cout_s : STD_LOGIC;

begin

    ADD: Adder_4bit    port map (A, B, '0', sum_s, cout_s);

    REG: Register_4bit port map (CLK, RESET, sum_s, Q);

end Structural;
