LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY CompareLogic IS
    PORT (
        a     : IN std_logic_vector(7 DOWNTO 0); -- input fra Switches
        b     : IN std_logic_vector(7 DOWNTO 0); -- input fra guesslatch
        tryin : IN std_logic;                    -- input fra Try switch
        o     : OUT std_logic_vector(1 DOWNTO 0) -- output til MUX(5-1)
    );
END CompareLogic;

ARCHITECTURE compare OF CompareLogic IS

    SIGNAL ua : unsigned(7 DOWNTO 0);
    SIGNAL ub : unsigned(7 DOWNTO 0);

BEGIN
    ua <= unsigned(a);
    ub <= unsigned(b);

    -- TRY = 1
    ---- Test om a, b relation
    ------- a = b   DISPLAY: --- "01"
    ------- a > b   DISPLAY: HI "11"
    ------- a < b   DISPLAY: LO "00"
    -- TRY = 0 
    ---- Do nothing. "--"

    CompareLogicprocess : PROCESS (tryin, ua, ub)
    BEGIN
        o <= "10";
        IF tryin = '0' THEN --
            IF ua = ub THEN
                o <= "01";
            ELSIF ua < ub THEN
                o <= "00";
            ELSIF ua > ub THEN
                o <= "11";
            END IF;
        ELSE
            o <= "10";
        END IF;
    END PROCESS CompareLogicprocess;
END compare; -- compare