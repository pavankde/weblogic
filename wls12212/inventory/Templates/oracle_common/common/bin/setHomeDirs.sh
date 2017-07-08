#!/bin/sh

WL_HOME="${MW_HOME}/wlserver"
export WL_HOME

# Set common components home...
COMMON_COMPONENTS_HOME="${MW_HOME}/oracle_common"
if [ -d "${COMMON_COMPONENTS_HOME}" ] ; then
  COMMON_COMPONENTS_HOME=`cd "${MW_HOME}/oracle_common" ; pwd`
fi
export COMMON_COMPONENTS_HOME

if [ -z "${JAVA_HOME}" -o -z "${JAVA_VENDOR}" ]; then
 COMMON_JAVA_HOME=@JAVA_HOME@
 if [ -d "${COMMON_JAVA_HOME}" ]; then
   JAVA_HOME="${COMMON_JAVA_HOME}"
   JAVA_VENDOR=@JAVA_VENDOR@
   export JAVA_VENDOR
 else
   if [ ! -d "${JAVA_HOME}" ]; then
    echo "The installation jdk ${COMMON_JAVA_HOME} is not accessible."
    echo "Please set appropriate JAVA_HOME and run again."  
    exit 1
   fi
 fi
fi

export JAVA_HOME 
