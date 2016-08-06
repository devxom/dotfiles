#!/bin/bash

session=$(ps aux | grep kiosk | grep slack | wc -l)

mkdir -p ~/.config/chrome-slack/
ln -s ~/.config/chrome-slack/ ~/.config/chrome-slack-$session

exec google-chrome-unstable --user-data-dir=~/.config/chrome-slack-$session/ --kiosk \
    http://agiledesigns.slack.com/