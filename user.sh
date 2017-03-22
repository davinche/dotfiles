#!/bin/bash
[ -d $HOME/.cargo ] || curl https://sh.rustup.rs -sSf | sh
[ -d $HOME/.pyenv ] || git clone --depth=1 https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ] || git clone https://github.com/pyenv/pyenv-virtualenv.git "$HOME/.pyenv/plugins/pyenv-virtualenv"
go get github.com/davinche/gmux

packages=(
    commitizen
    conventional-changelog-cli
    neovim
    nodemon
    prettier
    prettier-init
    typescript
    yarn
    sequelize-cli
    dotenv-cli
)

npm i -g ${packages[@]}
