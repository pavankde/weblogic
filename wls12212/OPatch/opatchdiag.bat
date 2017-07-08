@echo off
REM ######################################################################
REM #  Copyright (c) 2010, 2015, Oracle and/or its affiliates.  All rights reserved.
REM #
REM #  opatch  09/03/15   Update the year of copyright
REM #  opatch  12/21/10   Create and support
REM #                          -jdk, -jre, -oh
REM ######################################################################

setlocal

REM # Set the base path
set BASE=%~DP0%

REM # Get ORACLE_HOME from environment variable "ORACLE_HOME"
set OH=%ORACLE_HOME%

REM # Check for OPATCH_DEBUG env variable
set DEBUG=%OPATCH_DEBUG%

set DEBUGVAL=false
if "%DEBUG%" == "TRUE" (set DEBUGVAL=true) else if "%DEBUG%" == "true" (set DEBUGVAL=true)

REM # Look for OPATCH_PLATFORM_ID
set PLATFORM=%OPATCH_PLATFORM_ID%

REM # Preserve the PATH environment variable
set PATHENV=%PATH%

REM # If -oh is specified, use it to over-ride env. var. ORACLE_HOME
set getOH=0

REM # If -jre or -jdk are specified, use it to launch opatchdiag,
REM #   with -jdk > -jre.  And we expect there is a "bin/java" underneath
REM #   the value supplied
set getJRE=0
set getJDK=0

set JDK=
set JRE=

set PARAMS=%*

:FORLOOP

if "%1" == "" goto DONELOOP

if NOT "%getOH%" == "1" goto CHECK1 
set OH=%1
set getOH=0

:CHECK1
if NOT "%getJRE%" == "1" goto CHECK2 
set JRE=%1
set getJRE=0

:CHECK2
if NOT "%getJDK%" == "1" goto CHECK3 
set JDK=%1
set getJDK=0

:CHECK3

if /i "%1" neq "-oh" goto CHECK4
set getOH=1

:CHECK4
if /i "%1" neq "-jre" goto CHECK5
set getJRE=1

:CHECK5
if /i "%1" neq "-jdk" goto FORCHECK 
set getJDK=1

:FORCHECK
shift
goto FORLOOP

:DONELOOP

if "%OH%" == "" goto CHECKFMW3
@REM Remove quotes

set OH=%OH:"=%
if NOT EXIST %OH%\NUL (
   echo The Oracle Home %OH% could not be located. Please give proper Oracle Home.
   echo opatchdiag returns with error code = 1
   set %ERRORLEVEL% = 1
   goto OPATCHDONE
) else (
if "%FMW_COMPONENT_HOME%" == "" (
   set C_ORACLE_HOME=%OH%
) else (
   set C_ORACLE_HOME=%FMW_COMPONENT_HOME%
)
   if "%DEBUGVAL%" == "true" echo ORACLE_HOME is set at opatchdiag invocation
)

@REM Calculate Middleware Home simply by moving up IFF User set Oracle Home
for %%? in ("%C_ORACLE_HOME%\..") do set C_MW_HOME=%%~f?
goto CHECKFMW4

:CHECKFMW3
@REM Determine the location of this script...
SET SCRIPTPATH=%~DP0
FOR %%i IN ("%SCRIPTPATH%") DO SET SCRIPTPATH=%%~fsi

@REM Calculate the ORACLE_HOME relative to this script...
FOR %%i IN ("%SCRIPTPATH%\..\..") DO SET C_ORACLE_HOME=%%~fsi

@REM Set the MW_HOME relative to the ORACLE_HOME...
FOR %%i IN ("%C_ORACLE_HOME%\..") DO SET C_MW_HOME=%%~fsi

if "%DEBUGVAL%" == "true" echo ORACLE_HOME is NOT set at opatchdiag invocation

:CHECKFMW4
set FMW_ERROR=0
if NOT EXIST %C_MW_HOME%\registry.dat goto CHECKFMW8

@REM Invoking the setHomeDirs.sh script to set the WebLogic environment
@REM Set the MW_HOME env variable temporarily for the following scripts

set MW_HOME=%C_MW_HOME%

if NOT EXIST %C_ORACLE_HOME%\common\bin\setHomeDirs.cmd goto CHECKFMW5
call "%C_ORACLE_HOME%\common\bin\setHomeDirs.cmd"

:CHECKFMW5
if "%DEBUGVAL%" == "true" echo WL_HOME is set by setHomeDirs.cmd script to %WL_HOME%

if "%WL_HOME%" == "" goto CHECKFMW5A

if NOT EXIST %WL_HOME%\NUL goto CHECKFMW5A

if NOT EXIST %WL_HOME%\common\bin\commEnv.cmd goto CHECKFMW5B

call %WL_HOME%\common\bin\commEnv.cmd

IF EXIST %C_ORACLE_HOME%\common\bin\setWlstEnv.cmd CALL %C_ORACLE_HOME%\common\bin\setWlstEnv.cmd

IF EXIST %COMMON_COMPONENTS_HOME%\common\bin\setWlstEnvExtns.cmd CALL %COMMON_COMPONENTS_HOME%\common\bin\setWlstEnvExtns.cmd

:CHECKFMW5A
set FMW_ERROR=-1
if "%DEBUGVAL%" == "true" (
   echo "Fusion Middleware Home maybe corrupted (WebLogic Home is not found)!"
   echo opatchdiag will proceed only if JVM launcher found
)

goto CHECKFMW6

:CHECKFMW5B
set FMW_ERROR=-2
if "%DEBUGVAL%" == "true" (
   echo "Fusion Middleware Home maybe corrupted (Common Env Script missing or Not executable)!"
   echo opatchdiag will proceed only if JVM launcher found
)
goto CHECKFMW6

:CHECKFMW6
if "%OH%" == "" set OH=%C_ORACLE_HOME%

@REM We will use the JDK used by WebLogic unless user knows better and wants to override
if NOT "%JDK%" == "" goto CHECKFMW7
if NOT "%JRE%" == "" goto CHECKFMW7

set JDK=%JAVA_HOME%

:CHECKFMW7
set JRE_MEMORY_OPTIONS=%MEM_ARGS% %JVM_D64%
set JAVA_VM_OPTION=

if "%JAVA_VENDOR%" == "Oracle" goto CHECKFMW8
if "%JAVA_VENDOR%" == "HP" goto CHECKFMW8
if "%JAVA_VENDOR%" == "Sun" goto CHECKFMW8

set JAVA_VM_OPTION=-client

goto INVOKEJAVA

:CHECKFMW8
REM # If Oracle Home not set, error out
if NOT "%OH%" == "" goto INVOKEJAVA
if NOT EXIST %C_ORACLE_HOME%\oui (
   echo The Oracle Home %C_ORACLE_HOME% is not OUI based home. Please give proper Oracle Home.
   echo opatchdiag returns with error code = 1
   set %ERRORLEVEL% = 1
   goto OPATCHDONE
)
set OH=%C_ORACLE_HOME%

for %%a in (%OH%.) do set OH=%%~dpfa

:INVOKEJAVA
set CP=%OH%\oui\jlib

REM # Use ORACLE_HOME to set Java CLASS_PATH
REM # default location
set JAVA=

REM # Use JDK if supplied
if NOT "%JAVA%" == "" goto CHECKJRE
if "%JDK%" == "" goto CHECKJRE
REM if NOT EXIST %JDK%\bin\java.exe goto CHECKJRE
set JAVA=%JDK%\bin\java.exe
REM if EXIST %JAVA% goto JAVATEST
goto JAVATEST
REM set JAVA=

:CHECKJRE
REM # Use JRE if supplied
if NOT "%JAVA%" == "" goto CHECKOHJRE
if "%JRE%" == "" goto CHECKOHJRE
REM if NOT EXIST %JRE%\bin\java.exe goto CHECKOHJRE
set JAVA=%JRE%\bin\java.exe
REM if EXIST %JAVA% goto JAVATEST
goto JAVATEST
REM set JAVA=

:CHECKOHJRE
REM # Use OH\jre\*, it should be 1.5 or above
if NOT "%JAVA%" == "" goto CHECKOHJDK
set JRE_HIGH=
if NOT EXIST %OH%\jre goto CHECKOHJDK
for /F "usebackq tokens=1" %%A in (`dir /ON /B %OH%\jre`) do set JRE_HIGH=%%A
if "%JRE_HIGH%" == "" goto CHECKOHJDK
set JRE_HIGH_FIRST=
set JRE_HIGH_SECOND=
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_FIRST=%%A
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_SECOND=%%B
if "%JRE_HIGH_FIRST%" LSS "1" goto CHECKOHJDK
if "%JRE_HIGH_SECOND%" LSS "5" goto CHECKOHJDK
set JAVA=%OH%\jre\%JRE_HIGH%\bin\java.exe
if EXIST %JAVA% goto JAVATEST
set JAVA=

:CHECKOHJDK
REM # Check for jdk location inside OH
if NOT "%JAVA%" == "" goto CHECKORAPARAM
if NOT EXIST %OH%\jdk\bin\java.exe goto CHECKORAPARAM
set JAVA=%OH%\jdk\bin\java.exe
if EXIST %JAVA% goto JAVATEST
set JAVA=

:CHECKORAPARAM
REM # Last option is to look inside oraparam.ini for JRE_LOCATION
if NOT "%JAVA%" == "" goto JAVATEST
if NOT EXIST %OH%\oui\oraparam.ini goto JAVATEST
set JRE_LOCATION=
for /F "usebackq tokens=2 delims==" %%A in (`findstr "JRE_LOCATION=" %OH%\oui\oraparam.ini`) do set JRE_LOCATION=%%A
if "%JRE_LOCATION%" == "" goto JAVATEST
set ABS_PATH=
for /F "eol=\ tokens=1" %%A in ("%JRE_LOCATION%") do set ABS_PATH=%%A
if "%ABS_PATH%" == "" goto JAVAABSPATH
for /F "tokens=1,2 delims=:" %%A in ("%JRE_LOCATION%") do set ABS_PATH=%%B
if NOT "%ABS_PATH%" == "" goto JAVAABSPATH
set JAVA=%OH%\oui\bin\%JRE_LOCATION%\bin\java.exe
goto JAVATEST

:JAVAABSPATH
set JAVA=%JRE_LOCATION%\bin\java.exe
goto JAVATEST

REM # Java executable exists and has execute permission, exit otherwise
:JAVATEST
if NOT "%JAVA%" == "" goto JAVATEST1
echo Java could not be located. opatchdiag cannot proceed!
set ERRORLEVEL=1
goto OPATCHDONE

:JAVATEST1
if EXIST %JAVA% goto CALLOPATCH
if %FMW_ERROR% == -1 echo Fusion Middleware Home is corrupted (WebLogic Home is not found)!
if %FMW_ERROR% == -2 echo Fusion Middleware Home is corrupted (Common Env Script missing or Not executable)!
echo %JAVA% could not be located. opatchdiag cannot proceed!
set ERRORLEVEL=1
goto OPATCHDONE

REM echo.
REM echo.
REM echo Path to Java binary    %JAVA%
REM echo Classpath for java     %CP%
REM echo Oracle Home to be used %OH%
REM echo.
REM echo.

:CALLOPATCH
if NOT "%DEBUGVAL%" == "true" goto CALLOPATCHNODEBUG
echo %JAVA% %JAVA_VM_OPTION% %JRE_MEMORY_OPTIONS% -cp %BASE%\ocm\lib\emocmutl.jar;%BASE%\ocm\lib\emocmclnt.jar;%CP%\emCfg.jar;%CP%\OraInstaller.jar;%CP%\OraPrereq.jar;%CP%\share.jar;%CP%\srvm.jar;%CP%\orai18n-mapping.jar;%CP%\xmlparserv2.jar;%CP%\ojmisc.jar;%BASE%jlib\opatch.jar;%BASE%jlib\opatchsdk.jar;%BASE%jlib\jaxb\activation.jar;%BASE%jlib\jaxb\jaxb-api.jar;%BASE%jlib\jaxb\jaxb-impl.jar;%BASE%jlib\jaxb\jsr173_1.0_api.jar;%BASE%jlib\oracle.opatch.classpath.jar;%CLASSPATH%;.\;. -DOPatchDiag.ORACLE_HOME=%OH% oracle/opatch/diagtool/OPatchDiag %PARAMS%

:CALLOPATCHNODEBUG
%JAVA% %JAVA_VM_OPTION% %JRE_MEMORY_OPTIONS% -cp "%BASE%\ocm\lib\emocmutl.jar;%BASE%\ocm\lib\emocmclnt.jar;%CP%\emCfg.jar;%CP%\OraInstaller.jar;%CP%\OraPrereq.jar;%CP%\share.jar;%CP%\srvm.jar;%CP%\orai18n-mapping.jar;%CP%\xmlparserv2.jar;%CP%\ojmisc.jar;%BASE%jlib\opatch.jar;%BASE%jlib\opatchsdk.jar;%BASE%jlib\jaxb\activation.jar;%BASE%jlib\jaxb\jaxb-api.jar;%BASE%jlib\jaxb\jaxb-impl.jar;%BASE%jlib\jaxb\jsr173_1.0_api.jar;%BASE%jlib\oracle.opatch.classpath.jar;%CLASSPATH%;.\;." -DOPatchDiag.ORACLE_HOME=%OH% oracle/opatch/diagtool/OPatchDiag %PARAMS% 
:OPATCHDONE
set RESULT=%ERRORLEVEL%
if "%ERRORLEVEL%" == "0" goto SUCCEXIT
if "%ERRORLEVEL%" LSS "201" goto FAILEXIT
if "%ERRORLEVEL%" GTR "203" goto WARNEXIT
echo.
echo opatchdiag stopped on request.
set RESULT=0
goto EXIT

:WARNEXIT
if "%ERRORLEVEL%" GTR "210" goto FAILEXIT
echo.
echo opatchdiag completed with warnings.
set RESULT=0
goto EXIT

:FAILEXIT
echo.
echo opatchdiag failed with error code = %RESULT%
goto EXIT

:SUCCEXIT
echo.
echo opatchdiag succeeded.
goto EXIT

:EXIT
exit /b %RESULT%

