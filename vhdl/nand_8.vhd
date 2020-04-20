LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nand_8 IS
    GENERIC (bits : POSITIVE := 8);
    PORT (
        a : IN std_logic_vector(bits - 1 DOWNTO 0);
        y : OUT std_logic
    );
END ENTITY nand_8;

ARCHITECTURE genericType OF nand_8 IS
BEGIN
    PROCESS (a)
        VARIABLE nandOut : std_logic;
    BEGIN
        nandOut := a(0);

        FOR I IN 1 TO (bits - 1) LOOP
            nandOut := nandOut AND a(I);
        END LOOP;

        y <= NOT(nandOut);
    END PROCESS;
END genericType;