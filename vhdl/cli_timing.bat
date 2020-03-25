@ECHO OFF

REM cli_timing.bat
REM  Version: 0.2
REM  2018-06-19: CEF

SET QBIN=c:/altera/13.0sp1/quartus/bin
SET PROJ=test_bench

%QBIN%/quartus_map --generate_functional_sim_netlist ^
                   --read_settings_files=on ^
                   --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
        ECHO ERROR in map stage!
        EXIT /B -1
)
%QBIN%/quartus_sim --simulation_results_form=VWF ^
	               --read_settings_files=on ^
                   --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
        ECHO ERROR in sim stage!
        EXIT /B -1
)

