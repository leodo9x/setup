#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Installing development apps"
fancy_echo "--------------------------"

gui=("docker" "tableplus" "cursor" "font-fira-code" "warp" "postman")
for gui in ${gui[*]}; do
    if ! brew list $gui; then
        fancy_echo "Installing $gui"
        brew install --cask $gui
    fi
done

fancy_echo "Installing development cli"
fancy_echo "--------------------------"

cli=("git" "node" "yarn" "pnpm" "composer")
for cli in ${cli[*]}; do
    if ! brew list $cli; then
        fancy_echo "Installing $cli"
        brew install $cli
    fi
done

fancy_echo "Customizing the git"
fancy_echo "-------------------"

fancy_echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fancy_echo "Installing zsh-syntax-highlighting for zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fancy_echo "Installing zsh-autosuggestions for zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
