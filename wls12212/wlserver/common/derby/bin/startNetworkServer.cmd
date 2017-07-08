set SAVECP=%CLASSPATH%
set CLASSPATH=
start /b "Derby Server for WLS Examples Server" cmd /c "L:\sw\java\servers\wls12212\wlserver\common\derby\bin\startNetworkServer.bat %*"
set CLASSPATH=%SAVECP%
     
