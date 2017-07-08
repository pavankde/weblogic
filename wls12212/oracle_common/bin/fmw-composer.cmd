@ECHO OFF

@REM fmw-composer.cmd
@REM
@REM Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
@REM
@REM    NAME
@REM      fmw-composer.cmd - Oracle Configuration Patcher
@REM
@REM    DESCRIPTION
@REM      Run "fmw-composer.cmd help" to see supported commands.
@REM
@REM

SET BASEDIR=%~dp0
@REM ECHO BASEDIR=%BASEDIR%
@REM ###########################################################
@REM # locate JRE
@REM #   If JAVA_HOME is set then we use it
@REM #   Otherwise we will try to use a JDK from ORACLE_HOME
@REM ###########################################################
if NOT DEFINED JAVA_HOME (
  if DEFINED ORACLE_HOME (
    if EXIST %ORACLE_HOME%/jdk/bin/java.exe (
      SET JAVA_HOME=%ORACLE_HOME%/jdk
    ) ELSE (
      ECHO JAVA_HOME is unset.
	  EXIT /B 1
	)
  ) ELSE (
      ECHO JAVA_HOME is unset. ORACLE_HOME is undefined.
	  EXIT /B 1
  )
)

SET JAVA="%JAVA_HOME%/bin/java.exe"
@REM ECHO "JAVA=%JAVA%"
if NOT EXIST %JAVA% (
  ECHO The Java executable $JAVA does not exist. 1>&2
  ECHO Set JAVA_HOME to reference a valid JRE. 1>&2
  EXIT /B 1
)

SET JRE_OPTIONS="-Xmx512m"
SET JRE_CP="%BASEDIR%../modules/features/oracle.fmwplatform.envspec_lib.jar"

@REM ECHO JRE_OPTIONS=%JRE_OPTIONS%
@REM ECHO JRE_CP=%JRE_CP%

%JAVA% %JRE_OPTION% -cp %JRE_CP% oracle.fmwplatform.tools.topeditor.Composer %*

SET EXIT_CODE=%ERRORLEVEL%
ECHO FMW-COMPOSER exited with code: %EXIT_CODE%.
EXIT /B %EXIT_CODE%
