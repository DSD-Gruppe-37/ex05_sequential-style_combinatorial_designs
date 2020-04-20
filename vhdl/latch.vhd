LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE work.ALL;

ENTITY generic_latch IS
    GENERIC (
        bits : INTEGER := 8
    );
    PORT (
        d  : IN std_logic_vector(bits - 1 DOWNTO 0); -- Input 
        en : IN std_logic;                           -- Enable switch
        q  : OUT std_logic_vector(bits - 1 DOWNTO 0) -- Output
    );
END generic_latch;

ARCHITECTURE latch OF generic_latch IS
BEGIN
    PROCESS (en, d)
    BEGIN
        IF en = '0' THEN -- Hvis en = TRUE
            q <= d;          -- q gets what d is
        END IF;
    END PROCESS;
END latch;