#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\\n$fmt\\n" "$@"
}

if ! command -v brew >/dev/null; then
   fancy_echo "Installing Homebrew"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   fancy_echo "Update path of the homebrew"
   (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"

   fancy_echo "Reinstall brew cask"
   brew reinstall cask
fi

fancy_echo "Installing essential apps"
fancy_echo "-------------------------"

gui=("evkey" "brave-browser" "the-unarchiver" "raycast" "obsidian" "megasync" "vlc" "cold-turkey-blocker")
for gui in ${gui[*]}; do
    if ! brew list $gui; then
        fancy_echo "Installing $gui"
        brew install --cask $gui
    fi
done

