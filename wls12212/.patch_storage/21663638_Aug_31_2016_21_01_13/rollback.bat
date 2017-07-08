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


cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6_g.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc6dms.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc6dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7_g.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7_g.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\AQMessageI.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\AQMessageI.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\AQMessageI.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$4.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$4.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$4.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$BufferCacheStore.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection$DrcpState.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection$DrcpState.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\PhysicalConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\PhysicalConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\PhysicalConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4CConnection$1.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4CConnection$1.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$1.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4CConnection$2.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4CConnection$2.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$2.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4CConnection$3.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4CConnection$3.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$3.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4CConnection$ReplayMode.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4CConnection$ReplayMode.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection$ReplayMode.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4CConnection.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4CConnection.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4CConnection.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4Caqdq.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4Caqdq.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqdq.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar \oracle\jdbc\driver\T4Caqe.class
copy /Y L:\sw\java\servers\wls12212\.patch_storage\21663638_Aug_31_2016_21_01_13\files\oracle.javavm.jrf\12.1.0.2.1\rdbms.jrf.common.symbol\modules\oracle.jdbc\ojdbc7dms.jar\oracle\jdbc\driver\T4Caqe.class L:\sw\java\servers\wls12212\oracle_common\modules\oracle.jdbc\oracle\jdbc\driver\T4Caqe.class
cd %OH%\oracle_common\modules\oracle.jdbc
%OH%\oracle_common\modules\oracle.jdbc\ojdbc7dms.jar -C %OH%\oracle_common\modules\oracle.jdbc \oracle\jdbc\driver\T4Caqe.class
echo Rollback script completed.
