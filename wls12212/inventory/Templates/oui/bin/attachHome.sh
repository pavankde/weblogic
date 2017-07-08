#!/bin/sh

CMD=attachHome.sh

USAGE="Usage: $CMD [ option ... ]"

OHOME="@ORACLE_HOME@"
OHOMENAME="@ORACLE_HOME_NAME@"

# fail if executed as ". attachHome.sh"
b="`basename $0 2>/dev/null`"
if [ "$b" != "$CMD" ] ; then
	echo "$USAGE"
	return
fi

# Variables are not operation specific
# so all variables are not valid in all contexts.
# However, to avoid silently overriding an explicitly-passed variable
# on the generated commend line, check here.
# WARNING: command-line variables silently override response file variables.
# WARNING: other variables may be silently ignored or overridden
# by downstream processing.
for arg in "$@" ; do
	# warn if user attempts to attach another Oracle Home
	# by passing ORACLE_HOME=, regardless of the value
	ohvar="`echo $arg|sed 's/^ORACLE_HOME=.*//'`"
	if [ -z "$ohvar" ] ; then
		echo "WARNING: Ignoring ORACLE_HOME=<value> on the command line (cannot override the Oracle Home to be attached)"
	fi
done

d="`dirname $0`"

# ensure ORACLE_HOME can't be overridden by specifying it explicitly and last
# but allow ORACLE_HOME_NAME to be overridden
# if attaching to another inventory where name is already present
# or if it has changed since initial install by previous attachHome
"$d/launch.sh" -attachHome ORACLE_HOME_NAME="$OHOMENAME" "$@" ORACLE_HOME="$OHOME"
