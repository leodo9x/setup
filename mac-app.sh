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

cli=("git" "node" "yarn")
for cli in ${cli[*]}; do
    if ! brew list $cli; then
        fancy_echo "Installing $cli"
        brew install $cli
    fi
done

fancy_echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fancy_echo "Installing zsh-syntax-highlighting for zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fancy_echo "Installing zsh-autosuggestions for zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

gui=("evkey" "docker" "tableplus" "brave-browser" "visual-studio-code" "font-fira-code" "slack" "notion" "the-unarchiver" "raycast"  "warp" "cron" "postman" "headset" "cold-turkey-blocker")
for gui in ${gui[*]}; do
    if ! brew list $gui; then
        fancy_echo "Installing $gui"
        brew install --cask $gui
    fi
done
