LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY CompareLogic IS
    PORT (
        a    : IN std_logic_vector(7 DOWNTO 0);
        b    : IN std_logic_vector(7 DOWNTO 0);
        en   : IN std_logic;
        comp : OUT std_logic_vector(1 DOWNTO 0)
    );
END CompareLogic;

ARCHITECTURE compare OF CompareLogic IS
BEGIN
    PROCESS (en, a, b)
    BEGIN
        comp <= "10";

        IF en = '0' THEN
            comp <= "11" WHEN a > b ELSE
                "00" WHEN a < b ELSE
                "01" WHEN a = b ELSE
                "10";
        END IF;
    END PROCESS;
END compare;