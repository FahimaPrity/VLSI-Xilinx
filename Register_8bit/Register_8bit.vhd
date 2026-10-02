library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity Register_8bit is

    Port ( D   : in  STD_LOGIC_VECTOR (7 downto 0);

           Clk : in  STD_LOGIC;

           Q   : out STD_LOGIC_VECTOR (7 downto 0));

end Register_8bit;



architecture Structural of Register_8bit is

    component Register_1bit

        Port ( D   : in  STD_LOGIC;

               Clk : in  STD_LOGIC;

               Q   : out STD_LOGIC);

    end component;

begin

    gen: for i in 0 to 7 generate

        R: Register_1bit port map (D => D(i), Clk => Clk, Q => Q(i));

    end generate;

end Structural;
