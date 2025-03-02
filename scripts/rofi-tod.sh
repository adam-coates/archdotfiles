#!/usr/bin/env bash

set -e

TODO=$(rofi -dmenu \
    -l 0 \
    -yoffset -300 \
    -width 40 \
    -no-config \
    -theme-str 'entry { placeholder: "Enter your task..."; text-color: #D4BE98; }' \
    -theme-str 'window { transparency: "real"; background-color: #32302F; border: 1; border-color: #D4BE98; }' \
    -theme-str 'textbox-prompt-colon { str: " "; text-color: #D4BE98; }' \
    -theme-str 'listview { background-color: #32302F; }' \
    -theme-str 'element-text { text-color: #D4BE98; }' \
    -p "Todo:")

if [[ -n $TODO ]]; then
    tod t q -c "$TODO"
    notify-send -a Todoist "Saved Todo: $TODO"
fi

