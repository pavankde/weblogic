@ECHO OFF

SETLOCAL

SET ALLARGS=%*

SET OHOME=@ORACLE_HOME@

@REM Get drive letter and directory path
SET SCRIPT_PATH=%~dp0

@REM Get fully-qualified short name
FOR %%i in ("%SCRIPT_PATH%") DO SET SCRIPT_PATH=%%~fsi

@REM Look for ORACLE_HOME, report an error rather than silently overriding
:PARSEARGS
SET ARG1=%~1

IF "%ARG1%" == "" (
  GOTO RUN
)

@REM variables are case sensitive unlike options
IF "%ARG1%" == "ORACLE_HOME" (
  ECHO WARNING: Ignoring ORACLE_HOME=value on the command line (cannot override the Oracle Home to be detached)
)

SHIFT
GOTO PARSEARGS

:RUN

@REM detachHome no longer calls execUAC (ilaunch.exe)
@REM to avoid UAC prompt for non-interactive usage
@REM because detachHome does not modify Windows registry.
@REM Implication: privilege is not elevated, therefore updates to
@REM central inventory by ora-installer may fail.
@REM Communicate no execUAC via env variable only.
SET NOEXECUAC=TRUE
"%SCRIPT_PATH%\internal\ilaunch.cmd" -detachHome %ALLARGS% ORACLE_HOME="%OHOME%"
SET RETURN_CODE=%ERRORLEVEL%

EXIT /b %RETURN_CODE%
