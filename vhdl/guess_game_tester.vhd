LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY guess_game_tester IS
    PORT (
        SW   : IN std_logic_vector(7 DOWNTO 0);
        KEY  : IN std_logic_vector(2 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0);
        HEX1 : OUT std_logic_vector(6 DOWNTO 0)
    );
END guess_game_tester;

ARCHITECTURE testbench OF guess_game_tester IS
BEGIN
    uut : ENTITY guess_game
        PORT MAP
        (
            inputs => SW,
            set    => KEY(0),
            try    => KEY(1),
            show   => KEY(2),
            hex1   => HEX0,
            hex10  => HEX1
        );
END testbench;