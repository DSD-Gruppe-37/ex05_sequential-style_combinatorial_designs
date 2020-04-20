LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ALL;

ENTITY countOnesTester IS
    PORT (
        a_in   : IN std_logic_vector(7 DOWNTO 0);
        hexout : OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY countOnesTester;

ARCHITECTURE rtl OF countOnesTester IS

    SIGNAL OnesCount : std_logic_vector(3 DOWNTO 0);

BEGIN

    CountOne : ENTITY CountOnes
        PORT MAP
        (
            A    => a_in,
            ones => OnesCount
        );

    Hexdisplay : ENTITY bin2hex(Behavioral)
        PORT MAP
        (
            -- INPUTS
            bin => OnesCount,
            -- OUTPUTS
            seg => hexout
        );
END ARCHITECTURE rtl;