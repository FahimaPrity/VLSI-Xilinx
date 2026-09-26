LIBRARY ieee;

USE ieee.std_logic_1164.ALL;



ENTITY Half_adder_tb IS

END Half_adder_tb;



ARCHITECTURE behavior OF Half_adder_tb IS 



    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Half_adder

    PORT(

         A : IN  std_logic;

         B : IN  std_logic;

         Sum : OUT  std_logic;

         Carry : OUT  std_logic

        );

    END COMPONENT;



    --Inputs

    signal A : std_logic := '0';

    signal B : std_logic := '0';



    --Outputs

    signal Sum : std_logic;

    signal Carry : std_logic;



BEGIN



    -- Instantiate the Unit Under Test (UUT)

    uut: Half_adder PORT MAP (

          A => A,

          B => B,

          Sum => Sum,

          Carry => Carry

        );



    -- Stimulus process

    stim_proc: process

    begin

        A <= '0'; B <= '0';

        wait for 100 ns;



        A <= '0'; B <= '1';

        wait for 100 ns;



        A <= '1'; B <= '0';

        wait for 100 ns;



        A <= '1'; B <= '1';

        wait for 100 ns;



        wait;

    end process;



END;
