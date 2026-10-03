library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity FA_1bit is

    Port ( A, B, Cin : in  STD_LOGIC;

           Sum, Cout : out STD_LOGIC);

end FA_1bit;



architecture Dataflow of FA_1bit is

begin

    Sum  <= A xor B xor Cin;

    Cout <= (A and B) or (Cin and (A xor B));

end Dataflow;
