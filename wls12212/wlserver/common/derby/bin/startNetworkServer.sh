#!/bin/sh
SAVECP=$CLASSPATH
unset CLASSPATH
DERBY_HOME=L:/sw/java/servers/wls12212/wlserver/common/derby
export DERBY_HOME
L:/sw/java/servers/wls12212/wlserver/common/derby/bin/startNetworkServer $@ &
CLASSPATH=$SAVECP
export CLASSPATH
     
