#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
OMZSH_ADDR="git://github.com/robbyrussell/oh-my-zsh.git"
VUNDLE_ADDR="git@github.com:gmarik/Vundle.vim.git"

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

if [ -f ~/.zshrc ]; then
	mkdir -p ~/ZshBackups
	mv ~/.zshrc ~/ZshBackups/.
fi

git clone ${VUNDLE_ADDR} ~/.vim/bundle/Vundle.vim
git clone ${BASH_IT_ADDR} ~/.bash_it
git clone ${OMZSH_ADDR} ~/.oh-my-zsh

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.
cp zsh/.zshrc ~/.
cp zsh/colorful* ~/.oh_my_zsh/themes/.

ln -s ${PWD}/vim/.vimrc ~/.vimrc
ln -s ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf

./setup_bash_it.sh

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q

