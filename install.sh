#!/bin/bash

echo "🛠️ Installing Blues Sway dotfiles"

# Cegah eksekusi sebagai root
if [[ $EUID -eq 0 ]]; then
  echo "🚫 Jangan jalankan script ini sebagai root."
  exit 1
fi

# --- 1. Install yay (AUR helper) ---
if ! command -v yay &> /dev/null; then
  echo "📦 yay belum ada, menginstall..."
  sudo pacman -S base-devel git wget --noconfirm
  git clone https://aur.archlinux.org/yay.git ~/yay-tmp
  cd ~/yay-tmp
  makepkg -si --noconfirm
  cd ~
  rm -rf ~/yay-tmp
else
  echo "✅ yay sudah tersedia."
fi

# --- 2. Install semua dependensi utama ---
echo "📦 Menginstall semua paket..."

sudo pacman -S --needed --noconfirm \
  sway \
  swaybg \
  swayidle \
  waybar \
  wofi \
  eww \
  wlogout \
  grim \
  slurp \
  imagemagick \
  brightnessctl \
  libnotify \
  ttf-jetbrains-mono-nerd \
  papirus-icon-theme \
  kitty \
  jq \
  zsh \
  fzf

yay -S --needed --noconfirm swaylock-effects-git

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "✅ Semua software telah terinstall."

# --- 3. Copy konfigurasi ke ~/.config + backup dulu ---
CONFIGS=("sway" "waybar" "eww" "wofi" "wlogout" "fastfetch" "kitty")

for cfg in "${CONFIGS[@]}"; do
  src_path="./${cfg}"
  # Ambil nama terakhir saja untuk target
  name=$(basename "$cfg")
  target="$HOME/.config/$cfg"

  if [ -d "$target" ]; then
    echo "📦 Membackup: $target → ${target}.bak"
    mv "$target" "${target}.bak"
  fi

  echo "📁 Menyalin $src_path → $HOME/.config/$cfg"
  mkdir -p "$(dirname "$target")"
  cp -r "$src_path" "$HOME/.config/$cfg"
done

# --- 4. Buat folder screenshot jika belum ada ---
mkdir -p ~/Pictures/Screenshots
sudo cp -r ./font/* /usr/share/fonts
echo "✅ Selesai! Nikmati hari mu :D"

