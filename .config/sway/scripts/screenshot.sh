#!/bin/bash 

if [ -n "$SWAYSOCK" ]; then
	mkdir -p ~/Pictures/Screenshots
	grim -g "$(slurp)" ~/Pictures/Screenshots/shot-$(date + '%d%m%Y-%H%M%S').png
	notify-send "Screenshot berhasil disimpan."
fi
