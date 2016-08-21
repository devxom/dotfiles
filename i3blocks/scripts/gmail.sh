#!/bin/bash
USER=devxom
PASS=ilmvoomcvyaokkad

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
echo $COUNT

if [ "$COUNT" != "0" ]; then
   if [ "$COUNT" = "1" ];then
      WORD="mail";
   else
      WORD="mails";
   fi
fi

case $BLOCK_BUTTON in
  1) i3-msg exec "$BROWSER https://mail.google.com" > /dev/null
esac
