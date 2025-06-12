#!/bin/bash 

if [ -n "$SWAYSOCK" ]; then
	swaylock \
		--image ~/.config/sway/assets/lockscreen.png \
		--clock \ 
		--indicator \
		--indicator-radius 100 \
		--indicator-thickness 8 \
		--effect-blur 10x3 \
		--effect-scale 1 \
		--ring-color 7aa2f7 \
		--key-hl-color bb9af7 \
		--inside-color 1a1b26 \
		--line-color 00000000 \
		--separator-color 00000000 \
		--text-color c0caf5 \
		--fade-in 0.2
fi
