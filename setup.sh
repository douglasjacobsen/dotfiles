#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
VUNDLE_ADDR="git@github.com:gmarik/Vundle.vim.git"

BUNDLES=0

while [[ $# > 0 ]]
do
	key="$1"

	case $key in
		-b|--bundles)
		BUNDLES=1
		shift # past argument
		;;
		*)
				# unknown option
		;;
	esac
	shift # past argument or value
done

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

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

ln -sf ${PWD}/vim/.vimrc ~/.vimrc
ln -sf ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles
ln -sf ${PWD}/tmux/.tmux.conf ~/.tmux.conf

./setup_bash_it.sh

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

if [ ${BUNDLES} == 1 ]; then
	vim -u ~/.vimrc.bundles +BundleInstall +q
fi

