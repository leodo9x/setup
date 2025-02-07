#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Config dotfile"
fancy_echo "--------------------------"

cp "./dotfile/.alias" "$HOME"
cp "./dotfile/.zshrc" "$HOME"
cp "./dotfile/.gitconfig" "$HOME"
cp "./dotfile/.gitconfig-personal" "$HOME"


fancy_echo "Config warp themes"
fancy_echo "--------------------------"

if [ ! -d "$HOME/.warp/themes" ]; then
   mkdir "$HOME/.warp/themes"
fi

cp "./warp-themes/cobalt2-light.yaml" "$HOME/.warp/themes"
cp "./warp-themes/cobalt2.yaml" "$HOME/.warp/themes"

fancy_echo "Config cursor settings"
fancy_echo "--------------------------"

cp "./cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User"
cp "./cursor/settings.json" "$HOME/Library/Application Support/Cursor/User"

fancy_echo "All done!"
fancy_echo "--------------------------"