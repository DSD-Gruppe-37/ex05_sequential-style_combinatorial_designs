LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ALL;

ENTITY nand_8_tester IS
    PORT (
        SW   : IN std_logic_vector(7 DOWNTO 0);
        LEDR : OUT std_logic_vector(0 DOWNTO 0)
    );
END ENTITY nand_8_tester;

ARCHITECTURE testbench OF nand_8_tester IS
BEGIN

    UUT : ENTITY nand_8
        PORT MAP(
            a => SW,
            y => LEDR(0)
        );

END ARCHITECTURE testbench;