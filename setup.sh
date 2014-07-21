#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
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

git clone ${VUNDLE_ADDR} ~/.vim/bundle/Vundle.vim
git clone ${BASH_IT_ADDR} ~/.bash_it

~/.bash_it/install.sh

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

CUSTOM_FILES=`ls bash-it-custom/`
for FILE in ${CUSTOM_FILES}
do
	ln -sf ${PWD}/bash-it-custom/${FILE} ~/.bash_it/custom/.
done

ln -s ${PWD}/vim/.vimrc ~/.vimrc
ln -s ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q
