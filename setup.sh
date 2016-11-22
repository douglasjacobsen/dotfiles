#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
SPF13_ADDR="git@github.com:douglasjacobsen/spf13-vim.git"

if [ -f ~/.vim ]; then
    mkdir -p ~/VimBackups
    mv ~/.vim ~/VimBackups/.vim
fi

if [ -f ~/.vimrc ]; then
    mkdir -p ~/VimBackups
    mv ~/.vimrc ~/VimBackups/.vimrc
fi

if [ -f ~/.bashrc ]; then
    mkdir -p ~/BashBackups
    mv ~/.bashrc ~/BashBackups/.
fi

if [ -f ~/.bash_profile ]; then
    mkdir -p ~/BashBackups
    mv ~/.bash_profile ~/BashBackups/.
fi

git clone ${BASH_IT_ADDR} ~/.bash_it
git clone -b 3.0 ${SPF13_ADDR} ~/.spf13-vim-3

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

for FILE in `ls -1 vim/.vimrc*`;
do
    ln -sf ${PWD}/${FILE} ~/.
done
ln -sf ${PWD}/tmux/.tmux.conf ~/.tmux.conf

~/.spf13-vim-3/bootstrap.sh
./setup_bash_it.sh

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.
