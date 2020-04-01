LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CountOnes IS
    PORT
    (
        in1  : IN std_logic_vector(7 DOWNTO 0);
        out1 : OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY CountOnes;
ARCHITECTURE Counts OF CountOnes IS

    SIGNAL CountOutput : std_logic_vector(3 DOWNTO 0);
BEGIN
    CountOne : PROCESS (in1)
        VARIABLE counter : INTEGER;
    BEGIN
    counter := 0;
    -- FOR I IN 0 TO 7 LOOP
    --     counter := counter + to_integer(unsigned(in1(I)));

    -- END LOOP;
    -- CountOutput <= std_logic_vector(to_unsigned(counter, 4));

    for I in 0 TO 7 loop
        if in1(I) = "1" then
            counter := (counter + 1);
        end if;
    end loop;
    
    END PROCESS CountOne;

    Hexdisplay : ENTITY bin2hex(Behavioral)
        PORT MAP
        (
            -- INPUTS
            bin(3 DOWNTO 0)  => CountOutput(3 DOWNTO 0),
            -- OUTPUTS
            Sseg(6 DOWNTO 0) => out1(6 DOWNTO 0)
        );
END ARCHITECTURE Counts;