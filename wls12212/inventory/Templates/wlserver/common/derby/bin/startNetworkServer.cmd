set SAVECP=%CLASSPATH%
set CLASSPATH=
start /b "Derby Server for WLS Examples Server" cmd /c "@WL_HOME\common\derby\bin\startNetworkServer.bat %*"
set CLASSPATH=%SAVECP%
     
