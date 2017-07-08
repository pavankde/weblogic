@ECHO OFF
SETLOCAL

:: Help detect
SET help=0
IF  [%1] == [-h]  (
SET help=1
) ELSE IF [%1] == [-help] (
SET help=1
)

IF [%help%] == [1] (
echo Syntax:  listDomainPatchInventory ^<domain_directory^>
echo Usage: This command provides the information about configured 
echo        actions and patches in the domain inventory.
exit /b
)


:: Get DOMAIN_HOME
IF  [%1] == []  (
	echo Please enter DOMAIN_HOME directory, e.g %~0 domain_home_directory
	exit /b
) ELSE (
  SET DOMAIN_HOME=%1
) 

:: Set classpath
SET SCRIPTPATH=%~dp0
FOR %%i IN ("%SCRIPTPATH%\..\modules") DO SET MODULES_DIR=%%~fsi
SET CLASSPATH=%MODULES_DIR%\features\oracle.glcm.opatch.common.api.classpath.jar

:: Set java command
SET JAVA_HOME=@JAVA_HOME_LOCATION@
SET JAVA=%JAVA_HOME%\bin\java.exe

:: Run the utility to check config patch inventory
%JAVA% -cp %CLASSPATH%  oracle.glcm.opatch.common.utils.CheckConfigPatchInventory %DOMAIN_HOME%

