@echo off
REM Copyright (c) 2017, Oracle Corporation.  All rights reserved

echo This script is going to rollback the changes made to system files on
echo this Oracle Home only. It does not perform any of the following:
echo - Inventory update
echo - Running init/pre/post scripts
echo - Customized steps performed manually by user
echo Please use this script with supervision from Oracle Technical Support.
echo To rollback a patch, please use 'opatch rollback'.

 echo NOTE: JDK should be present in the Oracle Home to rollback Java Archives.

REM # Get ORACLE_HOME from environment variable "ORACLE_HOME"
set OH=%ORACLE_HOME%

REM # Error out if OH is not set
if NOT "$OH" == ""  goto MODIFY_FILES
    echo Oracle Home is not set.
    echo Please set env. variable ORACLE_HOME and try again.
    echo Script failed to proceed.
    set %ERROR_LEVEL% = 1
    exit %ERROR_LEVEL%

:MODIFY_FILES

echo About to modify Oracle Home( %OH% )
echo Do you want to proceed? [Y/N]
if "%1" == "-silent" goto PROCEED
set /p response= ^>

if "%response%" == "Y" goto PROCEED
if "%response%" == "y" goto PROCEED
echo User responded with : %response%
exit 0;

:PROCEED
echo User responded with : Y


echo Date   Time : %date% %time% >> %OH%\cfgtoollogs\opatch\opatch_history.txt
echo Oracle Home : %OH% >> %OH%\cfgtoollogs\opatch\opatch_history.txt
echo Command     : rollback.bat >> %OH%\cfgtoollogs\opatch\opatch_history.txt


cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster$5.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster$5.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\Cluster$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\Cluster$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\Cluster$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\Cluster$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$7.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$7.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$7.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$7.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$9.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$9.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$9.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$9.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$1XSelector.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$1XSelector.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$1XSelector.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$1XSelector.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$Event.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$Event.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$Event.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$Event.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$2$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$2$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$2$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$2$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$Event$Status.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$Event$Status.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$Event$Status.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$Event$Status.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$Stats.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$Stats.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$Stats.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$Stats.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$Event$EventType.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$Event$EventType.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$Event$EventType.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$Event$EventType.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$8.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$8.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$8.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$8.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$StatsOne.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$StatsOne.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$StatsOne.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$StatsOne.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$10.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$10.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$10.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$10.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$5.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$5.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$2$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$2$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$2$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$2$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$6.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$6.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$6.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$6.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver$1$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver$1$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver$1$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver$1$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\FailoverDriver.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\FailoverDriver.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\FailoverDriver.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\FailoverDriver.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Event$Flag.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Event$Flag.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Event$Flag.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Event$Flag.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$1AffinitySelector.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$1AffinitySelector.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$1AffinitySelector.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$1AffinitySelector.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats$CloseResultsCounter.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats$CloseResultsCounter.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats$CloseResultsCounter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats$CloseResultsCounter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats$BorrowResultsCounter.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats$BorrowResultsCounter.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats$BorrowResultsCounter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats$BorrowResultsCounter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats$Counter.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats$Counter.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats$Counter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats$Counter.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$1$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$1$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$1$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$1$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Event.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Event.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Event.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Event.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$MixTable.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$MixTable.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$MixTable.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$MixTable.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats$PeakBorrowed.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats$PeakBorrowed.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats$PeakBorrowed.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats$PeakBorrowed.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer$Stats$Times.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer$Stats$Times.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer$Stats$Times.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer$Stats$Times.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\LoadBalancer.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\LoadBalancer.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\LoadBalancer.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\LoadBalancer.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\ONSDriver$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\ONSDriver$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\ONSDriver$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\ONSDriver$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\ONSDriver.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\ONSDriver.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\ONSDriver.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\ONSDriver.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$CoreConnectionWrapper.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$CoreConnectionWrapper.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$CoreConnectionWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$CoreConnectionWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$5.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$5.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$5.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$FailoverEventWrapper.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$FailoverEventWrapper.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$FailoverEventWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$FailoverEventWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$3.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$InitialRACCallback.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$InitialRACCallback.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$InitialRACCallback.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$InitialRACCallback.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$7.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$7.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$7.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$7.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$6.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$6.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$6.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$6.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$4.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\common\wls\WebLogicCluster$LoadBalanceEventWrapper$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSDatabaseEventHandlerTask.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSDatabaseEventHandlerTask.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSDatabaseEventHandlerTask.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSDatabaseEventHandlerTask.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSOracleFailoverEventSubscriber.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSOracleFailoverEventSubscriber.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSOracleFailoverEventSubscriber.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSOracleFailoverEventSubscriber.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSOracleRuntimeLBEventSubscriber.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSOracleRuntimeLBEventSubscriber.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSOracleRuntimeLBEventSubscriber.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSOracleRuntimeLBEventSubscriber.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSRuntimeLBEventHandlerTask.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSRuntimeLBEventHandlerTask.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSRuntimeLBEventHandlerTask.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSRuntimeLBEventHandlerTask.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSSubscriberBase$Mocker.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSSubscriberBase$Mocker.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSSubscriberBase$Mocker.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSSubscriberBase$Mocker.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSSubscriberBase$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSSubscriberBase$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSSubscriberBase$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSSubscriberBase$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\ONSSubscriberBase.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\ONSSubscriberBase.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\ONSSubscriberBase.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\ONSSubscriberBase.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\RACManagerImpl$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\RACManagerImpl$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\RACManagerImpl$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\RACManagerImpl$1.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\RACManagerImpl$RACCallbackExtended.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\RACManagerImpl$RACCallbackExtended.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\RACManagerImpl$RACCallbackExtended.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\RACManagerImpl$RACCallbackExtended.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\RACManagerImpl.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\RACManagerImpl.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\RACManagerImpl.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\RACManagerImpl.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\jdbc\oracle\RACManagerImpl$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\jdbc\oracle\RACManagerImpl$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\jdbc\oracle\RACManagerImpl$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\jdbc\oracle\RACManagerImpl$2.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\util\UCPErrorHandler.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\util\UCPErrorHandler.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\util\UCPErrorHandler.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\util\UCPErrorHandler.class
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar \oracle\ucp\util\UCPMessages.properties
copy /Y L:\sw\java\servers\wls12212\.patch_storage\18905788_Mar_7_2015_00_43_09\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.ucp.jar\oracle\ucp\util\UCPMessages.properties L:\sw\java\servers\wls12212\oracle_common\modules\oracle\ucp\util\UCPMessages.properties
cd %OH%\oracle_common\modules
%OH%\oracle_common\modules\oracle.ucp.jar -C %OH%\oracle_common\modules \oracle\ucp\util\UCPMessages.properties
echo Rollback script completed.
