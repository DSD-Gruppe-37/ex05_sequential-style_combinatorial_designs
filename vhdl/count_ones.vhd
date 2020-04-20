LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ALL;

ENTITY count_ones IS
    PORT (
        SW   : IN std_logic_vector(7 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY count_ones;

ARCHITECTURE behavioural OF count_ones IS
    SIGNAL ones_counted : std_logic_vector(3 DOWNTO 0);
BEGIN

    PROCESS (SW)
        VARIABLE count : unsigned(3 DOWNTO 0);
    BEGIN
        count := (OTHERS => '0');

        FOR i IN 7 DOWNTO 0 LOOP
            IF SW(i) = '1' THEN
                count := count + 1;
            END IF;
        END LOOP;

        ones_counted <= std_logic_vector(count);
    END PROCESS;

    b2h : ENTITY bin2hex
        PORT MAP
        (
            bin => ones_counted,
            seg => HEX0
        );
END ARCHITECTURE;