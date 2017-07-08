#!/bin/sh
DERBY_HOME=L:/sw/java/servers/wls12212/wlserver/common/derby
export DERBY_HOME
L:/sw/java/servers/wls12212/wlserver/common/derby/bin/stopNetworkServer $@ &
 
