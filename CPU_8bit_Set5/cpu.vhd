-- Top level: Mini 8-bit Accumulator CPU (Set 5: LDI, ADD, OR, NOT, SHR)

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity cpu is

    port (

        clk   : in  std_logic;

        reset : in  std_logic;

        q     : out std_logic_vector(7 downto 0);    -- ACC

        z     : out std_logic;

        pc_o  : out std_logic_vector(3 downto 0)

    );

end cpu;



architecture structural of cpu is

    signal pc_s    : std_logic_vector(3 downto 0);

    signal instr_s : std_logic_vector(11 downto 0);

    signal sel_s   : std_logic_vector(2 downto 0);

    signal we_s    : std_logic;

    signal acc_s   : std_logic_vector(7 downto 0);

    signal res_s   : std_logic_vector(7 downto 0);

begin

    u_pc  : entity work.pc

        port map (clk => clk, reset => reset, pc_out => pc_s);



    u_rom : entity work.rom

        port map (addr => pc_s, instr => instr_s);



    u_ctl : entity work.control_unit

        port map (opcode => instr_s(11 downto 8), alu_sel => sel_s, acc_we => we_s);



    u_alu : entity work.alu

        port map (acc => acc_s, operand => instr_s(7 downto 0), sel => sel_s, result => res_s);



    u_acc : entity work.acc_z

        port map (clk => clk, reset => reset, we => we_s, d => res_s, acc => acc_s, z => z);



    q    <= acc_s;

    pc_o <= pc_s;

end structural;
