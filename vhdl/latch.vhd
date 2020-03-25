LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY guesslatch IS
    PORT (
        d  : IN std_logic_vector(7 DOWNTO 0);
        en : IN std_logic;
        q  : OUT std_logic_vector(7 DOWNTO 0)
    );
END guesslatch;

ARCHITECTURE latch OF guesslatch IS

    SIGNAL qsig : std_logic_vector(7 DOWNTO 0);

BEGIN
    guesslatchprocess : PROCESS (en, d,qsig)
    BEGIN
        IF en = '0' THEN -- Hvis en = TRUE
            qsig <= d;          -- q gets what d is
        ELSE
            qsig <= qsig; -- q stays whatever q was
        END IF;
        q <= qsig;
    END PROCESS guesslatchprocess;
END latch; -- latch