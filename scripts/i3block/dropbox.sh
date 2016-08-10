#!/bin/bash
# Get the status from command line applet
DROP_STATUS="$(dropbox-cli status)"

# Define comparison strings
SYNCED="Up to date"
STOPPED="Dropbox isn't running!"
if [ "$DROP_STATUS" == "$STOPPED" ]; then
  echo "   "    # Long message
elif [ "$DROP_STATUS" == "$SYNCED" ]; then
  echo "   "      # Long message
else
  echo "   "    # Long message
fi
