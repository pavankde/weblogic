@ECHO OFF

FOR %%i IN ("%MW_HOME%") DO SET MW_HOME=%%~fsi

SET WL_HOME=%MW_HOME%\wlserver
FOR %%i IN ("%WL_HOME%") DO SET WL_HOME=%%~fsi

@REM Set common components home...
SET COMMON_COMPONENTS_HOME=%MW_HOME%\oracle_common
IF EXIST %COMMON_COMPONENTS_HOME% FOR %%i IN ("%MW_HOME%\oracle_common") DO SET COMMON_COMPONENTS_HOME=%%~fsi

if DEFINED JAVA_HOME if  DEFINED JAVA_VENDOR goto noReset
SET COMMON_JAVA_HOME=@JAVA_HOME@

@REM This logic won't shorten the COMMON_JAVA_HOME if it is set to empty
IF DEFINED COMMON_JAVA_HOME (
  FOR %%i IN ("%COMMON_JAVA_HOME%") DO SET COMMON_JAVA_HOME=%%~fsi
)

IF EXIST "%COMMON_JAVA_HOME%" ( 
 SET JAVA_HOME=%COMMON_JAVA_HOME%
 SET JAVA_VENDOR=@JAVA_VENDOR@
)
IF NOT EXIST "%JAVA_HOME%" (
 echo The installation jdk %COMMON_JAVA_HOME% is not accessible.
 echo Please set appropriate JAVA_HOME and run again.
 IF DEFINED USE_CMD_EXIT (
  EXIT 1
 ) ELSE (
  EXIT /B 1
 )
)

:noReset
FOR %%i IN ("%JAVA_HOME%") DO SET JAVA_HOME=%%~fsi
