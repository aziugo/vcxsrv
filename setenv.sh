#!/bin/bash

function on-error {
    echo "$1" >&2
    exit 1
}

_mhmake="$(which mhmake > /dev/null 2>&1)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -x "$_mhmake" ] ; then
  export PATH=$DIR/tools/mhmake/Release64:$PATH
  echo "PATH TO mhmake: $DIR/tools/mhmake/Release64"
fi

rm -f commands.sh
python2.7 setenv.py "$1" > commands.sh || on-error "Unable to local python2.7" 
chmod +x commands.sh
source commands.sh 
rm -f commands.sh
if [[ "$MHMAKECONF" == "" ]] ; then
  export MHMAKECONF=`cygpath -w $DIR`
  #export PYTHON3=c:\\Python3\\python.exe
fi

export IS64=$1

