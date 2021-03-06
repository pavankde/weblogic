@ECHO OFF
SETLOCAL


rem
rem where am I?
rem
set TOOLHOME=%~dp0\..
set TOOLROOT=%~dp0\..\..

rem Locate Java
if ("%ORACLE_HOME%") == () goto :check_javahome

if exist "%ORACLE_HOME%\jdk\bin\java.exe" goto :setjava_orahome

:check_javahome
if (%JAVA_HOME%) == () goto :check_toolhome
 if exist %JAVA_HOME%\bin\java.exe (
    goto :locate_jars
 ) else (
    goto :error_badjavahome
 )

:check_toolhome
if not exist %TOOLHOME%\jdk\bin\java.exe goto :error_nojava
set JAVA_HOME=%TOOLHOME%\jdk
goto :locate_jars

:setjava_orahome
set JAVA_HOME="%ORACLE_HOME%\jdk"
goto :locate_jars

:error_badjavahome
echo "ERROR: No Java"
echo "JAVA_HOME should point to valid Java runtime"
goto :exit


:error_nojava
echo "ERROR: No Java"
echo "%TOOLHOME%\jdk or JAVA_HOME should point to valid Java runtime"
goto :exit

rem
rem determine the location of jar files
rem

:locate_jars
if not exist %TOOLROOT%\oracle_common goto :check_srchome
  rem oracle_common exists
  set MW_MOD=%TOOLROOT%\oracle_common\modules
  set PKILOC=%MW_MOD%\oracle.pki
  set OSDTLOC=%MW_MOD%\oracle.osdt
  goto set_jars

:check_srchome
if (%SRCHOME%) == () goto :check_orahome
  rem SRCHOME is defined
  set PROD_DIST=%SRCHOME%\entsec\dist
  set PKILOC=%PROD_DIST%\oracle.pki\modules\oracle.pki
  set OSDTLOC=%PROD_DIST%\oracle.osdt.core\modules\oracle.osdt
  goto :set_jars

:check_orahome
if ("%ORACLE_HOME%") == () goto :no_orahome
if not exist %ORACLE_HOME% goto :no_orahome
  set OJLIB="%ORACLE_HOME%\jlib"
  set PKILOC=%OJLIB%
  set OSDTLOC=%OJLIB%
  goto :set_jars

:no_orahome
  set OJLIB=%TOOLHOME%\jlib
  set PKILOC=%OJLIB%
  set OSDTLOC=%OJLIB%

:set_jars
set PKI=%PKILOC%\oraclepki.jar
set OSDT_CORE=%OSDTLOC%\osdt_core.jar
set OSDT_CERT=%OSDTLOC%\osdt_cert.jar

:run_tool
%JAVA_HOME%\bin\java -classpath %PKI%;%OSDT_CORE%;%OSDT_CERT% oracle.security.pki.OracleSecretStoreTextUI %*

goto :exit

:exit
endlocal

