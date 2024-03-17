#!/usr/bin/env bash
polybar-msg cmd quit >/dev/null 2>&1
killall -q polybar
echo "----" | tee -a /tmp/dubsbar.log
polybar -r dubsbar 2>&1 | tee -a /tmp/dubsbar.log & disown &
picom --experimental-backends -b
feh --no-fehbg --bg-fill -z $HOME/Pictures/WP/
killall -q glava
#glava --desktop
