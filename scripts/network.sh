#!/bin/sh
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

INTERFACE="${1:-wlan0}"

state="$(cat /sys/class/net/$INTERFACE/operstate)"

if [ "$state" != "up" ]; then
  echo "down"
  echo "down"
  echo "#FF0000"
  exit 0
fi

speed="$(cat /sys/class/net/$INTERFACE/speed 2> /dev/null)"

ipaddr="$(ip addr show $INTERFACE | perl -n -e'/inet (.+)\// && print $1')"
ipaddr="${ipaddr:-0.0.0.0}"

# full text
echo -n "$ipaddr"
[ -n "$speed" ] && echo " ($speed Mbits/s)" || echo

# short text
echo "$ipaddr"