LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ALL;

ENTITY test_bench IS
  PORT (
    SW   : IN std_logic_vector(3 DOWNTO 0);
    HEX0 : OUT std_logic_vector(6 DOWNTO 0)
  );
END;

ARCHITECTURE testbench OF bin2hex_tester IS
BEGIN
  UUT : ENTITY bin2hex(behavioral)
    PORT MAP
    (
      -- INPUTS
      bin => SW,
      -- OUTPUTS
      seg => HEX0
    );
END ARCHITECTURE testbench;