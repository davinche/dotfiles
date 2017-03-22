#!/bin/bash

# Mac Stuff -------------------------------------------------------------------
if [[ $(uname) == 'Darwin' ]]; then
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Utils -------------------------------------------------------------------
    brew tap FelixKratz/formulae
    brew install zsh
    brew install git
    brew install go
    brew install dart-sdk
    brew install pyenv pyenv-virtualenv
    brew install rbenv
    brew install fnm
    brew install latex-mk
    brew install tree
    brew install pandoc
    brew install node
    brew install podman
    brew install podman-compose
    brew install jq
    brew install ag
    brew install fd
    brew install ripgrep
    brew install cmake
    brew install ctags
    brew install sorenisanerd/gotty/gotty
    brew install gotty
    brew install autojump
    brew install jesseduffield/lazygit/lazygit
    brew install fzf && /usr/local/opt/fzf/install --all
    brew install zsh-autosuggestions

    # VIM + TMUX --------------------------------------------------------------
    brew install tmux
    brew install neovim/neovim/neovim
    brew install davinche/tools/gmux
    brew install starship
    brew install borders

    # Cask Installations
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    brew install --cask ghostty
    brew install --cask nikitabobko/tap/aerospace
    brew install --cask podman-desktop
    brew install --cask aldente
    brew install --cask stats
    brew install --cask google-chrome
    brew install --cask hiddenbar
    brew install --cask db-browser-for-sqlite
    brew install --cask insomnia
    brew install --cask shottr

    # Fonts
    # brew install --cask font-source-code-pro
    # brew install --cask font-sauce-code-pro-nerd-font
    # brew install --cask font-fira-code
    # brew install --cask font-hack-nerd-font
    # brew install --cask font-jetbrains-mono
    brew install --cask font-jetbrains-mono-nerd-font
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
