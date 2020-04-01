-------------------------------------------------------------------------------------------
-- Multiplexers
-------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux IS
    PORT
    (
        inSelect : IN std_logic_vector(1 DOWNTO 0);   -- Selector
        inA      : IN std_logic_vector(13 DOWNTO 0);  -- input A vector
        inB      : IN std_logic_vector(13 DOWNTO 0);  -- input B vector
        inC      : IN std_logic_vector(13 DOWNTO 0);  -- input C vector
        inD      : IN std_logic_vector(13 DOWNTO 0);  -- input D vector
        o        : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o1       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o2       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o3       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o4       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o5       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o6       : OUT std_logic_vector(13 DOWNTO 0); -- Output vector
        o7       : OUT std_logic_vector(13 DOWNTO 0)  -- Output vector
    );
END mux;

-------------------------------------------------------------------------------------------
-- Mux 4-1
-------------------------------------------------------------------------------------------
ARCHITECTURE muxFour OF mux IS

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
END muxFour; -- muxFour

-------------------------------------------------------------------------------------------
-- Mux 2-1
-------------------------------------------------------------------------------------------
ARCHITECTURE muxTwo OF mux IS

BEGIN
    muxProcess : PROCESS (inSelect(0), inA, inB)
    BEGIN
        CASE(inSelect(0)) IS
            WHEN '1'    => o(7 DOWNTO 0)    <= inA(7 DOWNTO 0);-- 
            WHEN '0'    => o(7 DOWNTO 0)    <= inB(7 DOWNTO 0); --  
            WHEN OTHERS => o(7 DOWNTO 0) <= inA(7 DOWNTO 0);--
        END CASE;
    END PROCESS; -- muxProcess
END muxTwo;  -- muxTwo

-------------------------------------------------------------------------------------------
-- Mux 1-2 (act. 4 inputs -> 8 output..)
-------------------------------------------------------------------------------------------
ARCHITECTURE mux4In OF mux IS
BEGIN
            muxProcesser : PROCESS (inSelect, inA, inB, inC, inD)
            BEGIN
                CASE(inSelect(0)) IS
                WHEN '1' =>
                    o(0)           <= inA(0);--
                    o1(0)          <= inB(0);--
                    o2(7 DOWNTO 0) <= inC(7 DOWNTO 0);--
                    o3(0)          <= inD(0);--
                WHEN '0' =>
                    o4(0)          <= inA(0);
                    o5(0)          <= inB(0);
                    o6(7 DOWNTO 0) <= inC(7 DOWNTO 0);
                    o7(0)          <= inD(0);
                -- WHEN OTHERS => o(7 DOWNTO 0) <= inA(7 DOWNTO 0);--
                END CASE;

                -- IF (inSelect(0) = '0') THEN
                --     o(0)           <= inA(0);
                --     o1(0)          <= inB(0);
                --     o2(7 DOWNTO 0) <= inC(7 DOWNTO 0);
                --     o3(0)          <= inD(0);
                -- ELSIF (inSelect(0) = '1') THEN
                --     o4(0)          <= inA(0);
                --     o5(0)          <= inB(0);
                --     o6(7 DOWNTO 0) <= inC(7 DOWNTO 0);
                --     o7(0)          <= inD(0);
                -- END IF;
            END PROCESS;
    END mux4In; -- mux4In