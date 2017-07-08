#!/bin/sh
DERBY_HOME=@WL_HOME/common/derby
export DERBY_HOME
@WL_HOME/common/derby/bin/stopNetworkServer $@ &
 
