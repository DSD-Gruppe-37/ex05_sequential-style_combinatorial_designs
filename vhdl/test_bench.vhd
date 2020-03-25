LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY test_bench IS
    PORT (
        SW   : IN std_logic_vector(17 DOWNTO 0);
        KEY  : IN std_logic_vector(3 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0);
        HEX6 : OUT std_logic_vector(6 DOWNTO 0);
        HEX7 : OUT std_logic_vector(6 DOWNTO 0);
        LEDR : OUT std_logic_vector(17 DOWNTO 0)
    );
END;

ARCHITECTURE structural OF test_bench IS

BEGIN

    UUT : ENTITY guess_game
        PORT MAP
        (
            inputs => SW(7 DOWNTO 0),   -- inputs
            set    => key(3),           -- set predef. vals.
            show   => key(1),           -- show predef. vals.
            try    => key(0),           -- eval. guess
            hex1   => HEX6(6 DOWNTO 0), -- 7-seg ones
            hex10  => HEX7(6 DOWNTO 0)  -- 7-seg tens
        );

    -- UUT0 : ENTITY bin2hex(Behavioral)
    --     PORT MAP
    --     (
    --         -- INPUTS
    --         bin(3 DOWNTO 0)  => SW(3 DOWNTO 0),
    --         -- OUTPUTS
    --         Sseg(6 DOWNTO 0) => HEX0(6 DOWNTO 0)
    --     );

    -- UUT1 : ENTITY guesslatch(latch)
    --     PORT MAP
    --     (
    --         -- INPUTS         
    --         en => SW(4),
    --         d  => SW(11 DOWNTO 4),
    --         -- OUTPUTS 
    --         q  => LEDR(7 DOWNTO 0) -- Dummy 7;0
    --     );

    -- UUT2 : ENTITY CompareLogic(compare)
    --     PORT MAP
    --     (
    --         -- INPUTS         
    --         tryin => key(0),
    --         a     => SW(11 DOWNTO 4),
    --         b     => SW(7 DOWNTO 0),
    --         -- OUTPUTS
    --         o     => LEDR(9 DOWNTO 8) -- Dummy 9;8
    --     );

    -- UUT3 : ENTITY muxFour
    --     PORT MAP
    --     (
    --         -- INPUTS         
    --         inSelect => key(2 DOWNTO 1),
    --         inA      => SW(13 DOWNTO 0),
    --         inB      => SW(13 DOWNTO 0),
    --         -- OUTPUTS
    --         o        => LEDR(23 DOWNTO 10)
    --     );

    -- UUT4 : ENTITY muxTwo
    --     PORT MAP
    --     (
    --         -- INPUTS         
    --         inSelect => key(1 DOWNTO 0),
    --         inA      => SW(13 DOWNTO 0),
    --         inB      => SW(13 DOWNTO 0),
    --         -- OUTPUTS
    --         o        => Dummy(31 DOWNTO 11)
    --     );

END;