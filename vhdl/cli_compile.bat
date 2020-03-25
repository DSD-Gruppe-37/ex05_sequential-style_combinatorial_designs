@ECHO OFF

REM cli_compile.bat
REM  Version: 0.2
REM  2018-06-19: CEF

SET QBIN=c:/altera/13.0sp1/quartus/bin
SET PROJ=test_bench

%QBIN%/quartus_map --read_settings_files=on  --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
  ECHO ERROR in map stage!
  EXIT /B -1
)
%QBIN%/quartus_fit --read_settings_files=off --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
  ECHO ERROR in fit stage!
  EXIT /B -1
)
%QBIN%/quartus_asm --read_settings_files=off --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
  ECHO ERROR in asm stage!
  EXIT /B -1
)
REM NOTE: sta stage skipped
REM %QBIN%/quartus_sta %PROJ%
REM IF %ERRORLEVEL% NEQ 0 (
REM   ECHO ERROR in sta stage!
REM   EXIT /B -1
REM )
%QBIN%/quartus_eda --read_settings_files=off --write_settings_files=off %PROJ%
IF %ERRORLEVEL% NEQ 0 (
  ECHO ERROR in eda stage!
  EXIT /B -1
)
