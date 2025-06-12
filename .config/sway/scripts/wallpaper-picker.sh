#!/bin/bash

# Monitor Resolution
WIDTH=1366
HEIGHT=768

# Wallpaper Directory
WALL_DIR="$HOME/Pictures"
OUTPUT="$HOME/.config/sway/assets/current-wallpaper.png"

SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | wofi --show dmenu --prompt "Pilih wallpaper yang kamu suka")

[ -z "$SELECTED" ] && notify-send "Wallpaper" "Dibatalkan" && exit 0

convert "$SELECTED" -resize "${WIDTH}x${HEIGHT}^" -gravity center -extent ${WIDTH}x${HEIGHT} "$OUTPUT"

pkill swaybg
swaybg -i "$OUTPUT" --mode fill &

notify-send "Wallpaper diatur" "$(basename "$SELECTED")"
