#!/bin/sh
LOCATION=${1}
if [ -z "$1" ]
then
  LOCATION=moscow
fi
curl http://wttr.in/moon
curl http://wttr.in/${LOCATION}
