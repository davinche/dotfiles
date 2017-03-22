#!/bin/sh
DIR=$(dirname $0)
cd "$DIR"
PWD=$(pwd)
FILES=( $(find $DIR -name "*.symlink") )
CONFIGS=( $(ls -d $PWD/config/*) )
[ -d "$HOME/.config" ] || mkdir "$HOME/.config"

# Vim Unlinking
unlink ~/.vimrc > /dev/null 2>&1
unlink ~/.config/nvim > /dev/null 2>&1
unlink ~/.config/starship.toml > /dev/null 2>&1
ln -fs "$PWD/config/starship.toml" "$HOME/.config/starship.toml"

for i in "${FILES[@]}"
do
    FILE="${i##*/}"
    FILE=".${FILE%.*}"
    unlink "$HOME/$FILE" > /dev/null 2>&1
    ln -fs "$PWD/${i:2}" "$HOME/$FILE"
done

for d in "${CONFIGS[@]}"
do
    dest="$HOME/.config/${d##*/}"
    unlink "$dest" > /dev/null 2>&1
    ln -fs "$d" "$HOME/.config/${d##*/}"
done

# Vim Linking
ln -fs ~/.vim/init.vim ~/.vimrc
ln -fs ~/.vim ~/.config/nvim
