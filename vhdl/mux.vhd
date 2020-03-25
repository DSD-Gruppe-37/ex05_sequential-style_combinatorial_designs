LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY muxFour IS
    PORT (
        inSelect : IN std_logic_vector(1 DOWNTO 0);  -- input fra CompareLogic
        inA      : IN std_logic_vector(13 DOWNTO 0); -- input fra 
        o        : OUT std_logic_vector(13 DOWNTO 0) -- output til 2 x hex displays
    );
END muxFour;

-- Mux 4-1 - Outputs "Lo","--","Hi", "[INPUT]".
ARCHITECTURE mux OF muxFour IS

    -- inSelect = Enable
    ----
    -- inSelect = "01" DISPLAY: --- "01"
    -- inSelect = "11" DISPLAY: HI "11"
    -- inSelect = "00" DISPLAY: LO "00"
    -- inSelect = "--" DISPLAY: Input from 2 x bin2hex

BEGIN
    muxProcess : PROCESS (inSelect, inA)
    BEGIN
        CASE(inSelect) IS
            WHEN "00"   => o   <= "10001110100011";-- "Lo" = 
            WHEN "01"   => o   <= "01111110111111";-- -- =  
            WHEN "11"   => o   <= "00010011101111";-- "Hi" = 
            WHEN "10"   => o   <= inA; -- Numbers from input
            WHEN OTHERS => o <= inA;
        END CASE;
    END PROCESS; -- muxProcess
END mux;     -- mux
------------------------ MUX TWO to ONE
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY muxTwo IS
    PORT (
        inSelect : IN std_logic;                    -- input fra CompareLogic
        inA      : IN std_logic_vector(7 DOWNTO 0); --  
        inB      : IN std_logic_vector(7 DOWNTO 0); -- 
        o        : OUT std_logic_vector(7 DOWNTO 0) -- 
    );
END muxTwo;

-- Mux 2-1
ARCHITECTURE mux OF muxTwo IS

    -- inSelect = Enable
    -- inSelect = "1" DISPLAY: User input
    -- inSelect = "0" DISPLAY: Latch output

BEGIN
    muxProcess : PROCESS (inSelect, inA,inB)
    BEGIN
        CASE(inSelect) IS
            WHEN '1'    => o    <= inA(7 DOWNTO 0);-- 
            WHEN '0'    => o    <= inB(7 DOWNTO 0); --  
            WHEN OTHERS => o <= inA(7 DOWNTO 0);--
        END CASE;
    END PROCESS; -- muxProcess
END mux;     -- mux