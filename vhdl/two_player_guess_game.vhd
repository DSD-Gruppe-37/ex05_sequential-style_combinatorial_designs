library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE work.ALL;
ENTITY two_player_guess_game IS
    PORT (
        inputs    : IN std_logic_vector(7 DOWNTO 0);
        playerSel : IN std_logic;                     -- set predef. vals.
        set       : IN std_logic;                     -- set predef. vals.
        show      : IN std_logic;                     -- show predef. vals.
        try       : IN std_logic;                     -- eval. guess
        hexOnes   : OUT std_logic_vector(6 DOWNTO 0); -- 7-seg ones
        hexTens   : OUT std_logic_vector(6 DOWNTO 0); -- 7-seg tens
        hexPlayer : OUT std_logic_vector(6 DOWNTO 0)  -- 7-seg player
    );
END two_player_guess_game;

ARCHITECTURE TwoPlayerGame OF two_player_guess_game IS

    -- Player one signals
    SIGNAL p1Show   : std_logic;
    SIGNAL p1Set    : std_logic;
    SIGNAL p1Input  : std_logic_vector(7 DOWNTO 0);
    SIGNAL p1Try    : std_logic;
    SIGNAL p1Output : std_logic_vector(13 DOWNTO 0);
    -- Player two signals
    SIGNAL p2Show   : std_logic;
    SIGNAL p2Set    : std_logic;
    SIGNAL p2Input  : std_logic_vector(7 DOWNTO 0);
    SIGNAL p2Try    : std_logic;
    SIGNAL p2Output : std_logic_vector(13 DOWNTO 0);

BEGIN

    displayPlayer : ENTITY bin2hex(Behavioral)
        PORT MAP
        (
            -- INPUTS
            bin(0) => playerSel,
            -- OUTPUTS
            seg => hexPlayer
        );
    playerOneGame : ENTITY guess_game
        PORT MAP
        (
            inputs(7 DOWNTO 0) => p1Input, -- => (OTHERS => '0'),
            set                => p1Set,
            show               => p1Show,
            try                => p1Try,
            -- OUTPUTS
            hex1  => p1Output(6 DOWNTO 0),
            hex10 => p1Output(13 DOWNTO 7)
        );

    playerTwoGame : ENTITY guess_game
        PORT MAP
        (
            inputs(7 DOWNTO 0) => p2Input, -- => (OTHERS => '0'),
            set                => p2Set,
            show               => p2Show,
            try                => p2Try,
            -- OUTPUTS
            hex1  => p2Output(6 DOWNTO 0),
            hex10 => p2Output(13 DOWNTO 7)
        );
    MultiplexPlayerSelect : ENTITY mux(mux4In)
        PORT MAP
        (
            -- INPUTS         
            inSelect(0)     => playerSel,
            inA(0)          => show,
            inB(0)          => set,
            inC(7 DOWNTO 0) => inputs,
            inD(0)          => try,
            -- OUTPUTS
            ---- P1
            o(0)           => p1Show,
            o1(0)          => p1Set,
            o2(7 DOWNTO 0) => p1Input,
            o3(0)          => p1Try,
            ---- P2
            o4(0)          => p2Show,
            o5(0)          => p2Set,
            o6(7 DOWNTO 0) => p2Input,
            o7(0)          => p2Try
        );

    MultiplexShowPlayer : ENTITY mux(muxTwo)
        PORT MAP
        (
            -- INPUTS         
            inSelect(0)      => playerSel,
            inA(13 DOWNTO 0) => p1Output(13 DOWNTO 0),
            inB(13 DOWNTO 0) => p2Output(13 DOWNTO 0),
            inC => (OTHERS => '0'),
            inD => (OTHERS => '0'),
            -- OUTPUTS
            o(6 DOWNTO 0)  => hexOnes(6 DOWNTO 0),
            o(13 DOWNTO 7) => hexTens(6 DOWNTO 0),
            o1             => OPEN, -- Unused
            o2             => OPEN, -- Unused
            o3             => OPEN, -- Unused
            o4             => OPEN, -- Unused
            o5             => OPEN, -- Unused
            o6             => OPEN, -- Unused
            o7             => OPEN  -- Unused
        );
END TwoPlayerGame; -- TwoPlayerGame