LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
ENTITY guess_game IS
    PORT
    (
        inputs : IN std_logic_vector(7 DOWNTO 0);
        set    : IN std_logic;                     -- set predef. vals.
        show   : IN std_logic;                     -- show predef. vals.
        try    : IN std_logic;                     -- eval. guess
        hex1   : OUT std_logic_vector(6 DOWNTO 0); -- 7-seg ones
        hex10  : OUT std_logic_vector(6 DOWNTO 0)  -- 7-seg tens
    );
END guess_game;

ARCHITECTURE guessgame OF guess_game IS

    SIGNAL secret_value : std_logic_vector(7 DOWNTO 0);
    SIGNAL muxTwoOut    : std_logic_vector(7 DOWNTO 0);
    SIGNAL bin2hexOut   : std_logic_vector(13 DOWNTO 0);
    SIGNAL muxFourSel   : std_logic_vector(1 DOWNTO 0);




    
BEGIN
    displayOnes : ENTITY bin2hex(Behavioral)
        PORT MAP
        (
            -- INPUTS
            bin(3 DOWNTO 0)  => muxTwoOut(3 DOWNTO 0),
            -- OUTPUTS
            Sseg(6 DOWNTO 0) => bin2hexOut(6 DOWNTO 0)
        );

    displayTens : ENTITY bin2hex(Behavioral)
        PORT
        MAP
        (
        -- INPUTS
        bin(3 DOWNTO 0)  => muxTwoOut(7 DOWNTO 4),
        -- OUTPUTS
        Sseg(6 DOWNTO 0) => bin2hexOut(13 DOWNTO 7)
        );

    Latcher : ENTITY guesslatch
        PORT
        MAP
        (
        -- INPUTS         
        en => set,
        d  => inputs(7 DOWNTO 0),
        -- OUTPUTS
        q  => secret_value(7 DOWNTO 0)
        );
    Compare : ENTITY CompareLogic(compare)
        PORT
        MAP
        (
        -- INPUTS         
        tryin => try,
        a     => inputs(7 DOWNTO 0),
        b     => secret_value(7 DOWNTO 0),
        -- OUTPUTS
        o     => muxFourSel(1 DOWNTO 0)
        );
    MultiplexFourOne : ENTITY mux(muxFour)
        PORT
        MAP
        (
        -- INPUTS         
        inSelect       => muxFourSel(1 DOWNTO 0),
        inA            => bin2hexOut(13 DOWNTO 0),
        inB => (OTHERS => '0'),
        inC => (OTHERS => '0'),
        inD => (OTHERS => '0'),
        -- OUTPUTS
        o(6 DOWNTO 0)  => hex1(6 DOWNTO 0),
        o(13 DOWNTO 7) => hex10(6 DOWNTO 0)
        );
    MultiplexTwoOne : ENTITY mux(muxTwo)
        PORT
        MAP
        (
        -- INPUTS         
        inSelect(0)     => show,
        inA(7 DOWNTO 0) => inputs,
        inB(7 DOWNTO 0) => secret_value,
        inC => (OTHERS => '0'),
        inD => (OTHERS => '0'),
        -- OUTPUTS
        o(7 DOWNTO 0)   => muxTwoOut
        );

END guessgame; -- guessgame