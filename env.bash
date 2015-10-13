# This script adds toolchains built by doit to $PATH. It should sourced from within bash like:
# . path/to/env.sh

OS=`uname`
HOSTARCH=`uname -m`
DIR=`dirname "$BASH_SOURCE"`
SELF=`basename "$BASH_SOURCE"`

if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    echo "$SELF must be sourced, not executed"
    exit 1
fi

for p in `find $DIR -type d -wholename "$DIR/*-$OS-$HOSTARCH/bin"`;
do
    echo "added $p";
    export PATH=$p:$PATH;
done
