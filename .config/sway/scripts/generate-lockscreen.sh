#!/bin/bash 
if [ -n "$SWAYSOCK" ]; then
	convert -size 1920x1080 xc:'#1a1b26' ~/.config/sway/assets/profile.png -resize 256x256 -gravity center -composite ~/.config/sway/assets/lockscreen.png

fi
