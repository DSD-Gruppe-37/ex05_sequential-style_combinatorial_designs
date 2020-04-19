LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CountOnes IS
    PORT
    (
        A    : IN std_logic_vector(7 DOWNTO 0);
        ones : OUT std_logic_vector(3 DOWNTO 0)
    );
END ENTITY CountOnes;
ARCHITECTURE Count OF CountOnes IS
BEGIN
    Counter : PROCESS (A)
        VARIABLE OneCounter : INTEGER;
    BEGIN
        OneCounter := 0;
        FOR I IN 0 TO 7 LOOP
            IF a(i) = '1' THEN
                OneCounter := OneCounter + 1;
            END IF;
        END LOOP;
        ones <= std_logic_vector(to_unsigned(OneCounter,4));
    END PROCESS Counter;
END ARCHITECTURE Count;

--     SIGNAL CountOutput : std_logic_vector(3 DOWNTO 0);
-- BEGIN
--     CountOne : PROCESS (A)
--         VARIABLE counter : INTEGER;
--     BEGIN
--     counter := 0;
--     -- FOR I IN 0 TO 7 LOOP
--     --     counter := counter + to_integer(unsigned(A(I)));

--     -- END LOOP;
--     -- CountOutput <= std_logic_vector(to_unsigned(counter, 4));

--     for I in 0 TO 7 loop
--         if A(I) = "1" then
--             counter := (counter + 1);
--         end if;
--     end loop;

--     END PROCESS CountOne;

--     Hexdisplay : ENTITY bin2hex(Behavioral)
--         PORT MAP
--         (
--             -- INPUTS
--             bin(3 DOWNTO 0)  => CountOutput(3 DOWNTO 0),
--             -- OUTPUTS
--             Sseg(6 DOWNTO 0) => ones(6 DOWNTO 0)
--         );