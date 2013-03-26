#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser"
  exit $E_BADARGS
fi

sudo -u postgres createdb -O $2 $1
