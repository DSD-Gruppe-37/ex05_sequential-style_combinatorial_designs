LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY nand8 IS
  PORT (
    input : IN std_logic_vector(7 DOWNTO 0);
    nandout : OUT std_logic_vector(0 downto 0)
  );
END nand8;

ARCHITECTURE behavioral OF nand8 IS

BEGIN

  PROCESS (input)
    VARIABLE nandTemp : std_logic_vector(0 downto 0);

  BEGIN
    FOR i IN (7) DOWNTO 0 LOOP
      nandTemp(0) := nandTemp(0) NAND input(i);
    END LOOP; -- 
    nandout <= nandTemp;
  END PROCESS; -- nandloop  

END behavioral; -- behavioral
