#!/bin/bash 

if [ -n "$SWAYSOCK" ]; then
	level=$(brightnessctl get | awk '{ print int($1/10.23) }')
        notify-send -t 1000 "Keceraahn: $level%"
fi	
