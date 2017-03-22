#!/bin/bash

if [ -n "$BLOCK_BUTTON" ]; then
    pavucontrol &
fi

volume=
while [ -z "$volume" ]; do
    query=$(pacmd list-sinks | grep "* index" -A11 | awk '/^\s+volume\:/ { print $5}; /mute/ { print $2 }')
    volume=$(echo $query | cut -d ' ' -f 1)
    muted=$(echo $query | cut -d ' ' -f 2)
done

if [[ "$muted" == "yes" ]]; then
    icon=""
    volume=MUTED
else
    icon=""
fi
result='<span fgcolor="#FFFFFF">'
result+='<span font_size="x-large" rise="-2000">'
result+="$icon</span>"
result+="  $volume</span>"
echo $result
