set CURRDIR=%~dp0
set FEATURES=../../../features
set ACTIONS=../../../../..
set CP=jetty-runner.jar;%FEATURES%/oracle.fmwplatform.common_lib.jar
cd %CURRDIR%
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=7777 -cp %CP% -Dactions.root=%ACTIONS% org.eclipse.jetty.runner.Runner --config jetty.xml --path /action lcmagent-rest.war
