#!/bin/bash

if [ -n "$BLOCK_BUTTON" ]; then
    selected=$(echo -e "Sleep\nReboot\nShutdown" | rofi -p "power" -dmenu -location 5 -lines 3 -width 10 -yoffset -28)
    case $selected in
        Reboot)
            systemctl reboot
            ;;
        Sleep)
            systemctl suspend
            ;;
        Shutdown)
            systemctl poweroff
            ;;
    esac
fi

echo '<span bgcolor="#222222"> <span fgcolor="#FFFFFF" font_size="large" rise="-1000"></span> </span>'
