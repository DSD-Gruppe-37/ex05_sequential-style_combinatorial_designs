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
            IF a > b THEN
                comp <= "11";
            ELSIF a < b THEN
                comp <= "00";
            ELSIF a = b THEN
                comp <= "01";
            ELSE
                comp <= "10";
            END IF;
        END IF;
    END PROCESS;
END compare;