LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY nand8 IS
  PORT (
    a          : IN std_logic_vector(7 DOWNTO 0);
    nandoutput : OUT std_logic
  );
END nand8;

ARCHITECTURE behavioral OF nand8 IS

BEGIN

  -- nandloop : PROCESS (a)
  --   VARIABLE nandTemp : std_logic_vector(0 downto 0);

  -- BEGIN
  --  FOR i IN [15] DOWNTO 0 LOOP
  --     nandTemp := nandTemp NAND a(i);
  --     END LOOP; -- [15]bitloop
  --     nandoutput <= nandTemp;
  --   END PROCESS; -- nandloop  

END behavioral; -- behavioral