# This script adds toolchains built by doit to $PATH. It should sourced from within bash like:
# . path/to/env.sh

OS=`uname`
HOSTARCH=`uname -m`
DIR=`dirname "$BASH_SOURCE"`
SELF=`basename "$BASH_SOURCE"`
# OSX readlink doesn't support -f, but greadlink is the gnu version
# that Linux uses
READLINK=`which greadlink || which readlink`

if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    echo "$SELF must be sourced, not executed"
    exit 1
fi

for p in `ls -d $DIR/*-$OS-$HOSTARCH | grep -v build`;
do
    if [ -d $p/bin ]; then
        ABS_PATH=`$READLINK -f $p`
        echo "added $ABS_PATH";
        export PATH=$ABS_PATH/bin:$PATH;
    fi
done
