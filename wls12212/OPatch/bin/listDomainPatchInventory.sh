#!/bin/sh

#help detect
help=0;
if [ "$1" = "-h" ]; then
   help=1
elif [ "$1" = "-help" ]; then
   help=1
fi
if [ $help = 1 ]; then
   echo "Syntax:  listDomainPatchInventory <domain_directory>"
   echo "Usage: This command provides the information about configured" 
   echo "       actions and patches in the domain inventory."
   exit ;
fi

# Get domain home directory
if [ "$1" == "" ] ; then 
   echo "Please enter the domain home directory (e.g. $0 \$DOMAIN_HOME)";
   exit ;
else 
   DOMAIN_HOME="$1" ;
#   echo $DOMAIN_HOME ;
fi

# Set classpath
mypwd="`pwd`"

	# Determine the location of this script...
SCRIPTNAME=$0
case ${SCRIPTNAME} in
/*)  SCRIPTPATH=`dirname "${SCRIPTNAME}"` ;;
 *)  SCRIPTPATH=`dirname "${mypwd}/${SCRIPTNAME}"` ;;
esac

MODULES_DIR=`cd ${SCRIPTPATH}/../modules ; pwd`
CLASSPATH="${MODULES_DIR}/features/oracle.glcm.opatch.common.api.classpath.jar"

# Set java command
JAVA_HOME=C:/Program Files/Java/jdk1.8.0_131
JAVA=${JAVA_HOME}/bin/java

# Run the utility to check config patch inventory
$JAVA -cp $CLASSPATH oracle.glcm.opatch.common.utils.CheckConfigPatchInventory $DOMAIN_HOME
