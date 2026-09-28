LIBRARY ieee;

USE ieee.std_logic_1164.ALL;



ENTITY Full_Adder_8bit_tb IS

END Full_Adder_8bit_tb;



ARCHITECTURE behavior OF Full_Adder_8bit_tb IS 



    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Full_Adder_8bit

    PORT(

         A    : IN  std_logic_vector(7 downto 0);

         B    : IN  std_logic_vector(7 downto 0);

         Cin  : IN  std_logic;

         Sum  : OUT std_logic_vector(7 downto 0);

         Cout : OUT std_logic

        );

    END COMPONENT;



   --Inputs

   signal A   : std_logic_vector(7 downto 0) := (others => '0');

   signal B   : std_logic_vector(7 downto 0) := (others => '0');

   signal Cin : std_logic := '0';



   --Outputs

   signal Sum  : std_logic_vector(7 downto 0);

   signal Cout : std_logic;



BEGIN



   -- Instantiate the Unit Under Test (UUT)

   uut: Full_Adder_8bit PORT MAP (

          A => A,

          B => B,

          Cin => Cin,

          Sum => Sum,

          Cout => Cout

        );



   -- Stimulus process (Test Cases)

   stim_proc: process

   begin		

      -- Initial delay

      wait for 100 ns;	



      -- Test Case 1: 10 + 20 + 0 = 30

      A <= "00001010"; B <= "00010100"; Cin <= '0';

      wait for 100 ns;	



      -- Test Case 2: 15 + 10 + 1 = 26

      A <= "00001111"; B <= "00001010"; Cin <= '1';

      wait for 100 ns;



      -- Test Case 3: 255 + 1 + 0 = 256 (Sum = 0, Cout = 1)

      A <= "11111111"; B <= "00000001"; Cin <= '0';

      wait for 100 ns;



      wait;

   end process;



END behavior;
