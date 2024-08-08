#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Installing essential apps"
fancy_echo "-------------------------"

gui=("evkey" "brave-browser" "notion-calendar" "the-unarchiver" "raycast" "mochi" "obsidian" "vlc" "proton-drive")
for gui in ${gui[*]}; do
    if ! brew list $gui; then
        fancy_echo "Installing $gui"
        brew install --cask $gui
    fi
done

