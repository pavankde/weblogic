#!/bin/sh
SAVECP=$CLASSPATH
unset CLASSPATH
DERBY_HOME=@WL_HOME/common/derby
export DERBY_HOME
@WL_HOME/common/derby/bin/startNetworkServer $@ &
CLASSPATH=$SAVECP
export CLASSPATH
     
