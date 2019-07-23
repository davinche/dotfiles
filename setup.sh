#!/bin/bash

# Mac Stuff -------------------------------------------------------------------
if [[ $(uname) == 'Darwin' ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install zsh
    brew install git
    brew install go
    brew install pyenv pyenv-virtualenv
    brew install rbenv
    brew install graphviz
    brew install icdiff
    brew install latex-mk
    brew install tree
    brew install pandoc
    brew install node

    # VIM + TMUX --------------------------------------------------------------
    brew install tmux
    brew install neovim/neovim/neovim
    brew install davinche/tools/gmux

    # Kubernetes ------------------------------------------------------------------
    brew install kubectl
    brew install kops
    brew cask install minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
    && chmod +x docker-machine-driver-hyperkit \
    && sudo mv docker-machine-driver-hyperkit /usr/local/bin/ \
    && sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
    && sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit

    # Utils -----------------------------------------------------------------------
    brew install jq ag fd ripgrep cmake ctags
    brew tap yudai/gotty
    brew install gotty
    brew install autojump
    # brew install fzf && /usr/local/opt/fzf/install --all

    # Dart
    brew tap dart-lang/dart
    brew install dart

    # Cask Installations
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    brew cask install google-chrome
    brew cask install caskroom/versions/firefox-developer-edition
    brew cask install basictex
    brew cask install unified-remote
    brew cask install iterm2
    brew cask install flux
    brew cask install quicksilver
    brew cask install sequel-pro
    brew cask install db-browser-for-sqlite
    brew cask install slack
    brew cask install postman

    # Fonts
    brew tap homebrew/cask-fonts
    brew cask install font-sourcecodepro-nerd-font-mono
    brew cask install font-firacode-nerd-font-mono
    brew cask install font-hack-nerd-font-mono
    brew cask install yubico-authenticator

    # imgcat
    curl -o /usr/local/bin/imgcat https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat
    chmod a+x /usr/local/bin/imgcat
fi

# Archlinux Stuff
if [ -n $(command -v pacman) ]; then
    packages=(
        go
        npm
    )
    for pack in ${packages[@]}; do
        pacman -S --noconfirm ${pack}
    done
    npm install -g n
fi
