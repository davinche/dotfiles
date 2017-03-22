#!/bin/bash

# Mac Stuff -------------------------------------------------------------------
if [[ $(uname) == 'Darwin' ]]; then
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    brew install minikube
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
    brew install google-chrome
    brew install caskroom/versions/firefox-developer-edition
    brew install unified-remote
    brew install iterm2
    brew install sequel-pro
    brew install db-browser-for-sqlite
    brew install postman
    brew install karabiner-elements

    # Fonts
    brew tap homebrew/cask-fonts
    brew install svn
    brew install font-source-code-pro
    brew install font-fira-code
    brew install font-hack-nerd-font

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
