#!/bin/bash

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbuser"
  exit $E_BADARGS
fi

sudo -u postgres createuser --login --pwprompt --createdb --no-createrole --superuser $1
