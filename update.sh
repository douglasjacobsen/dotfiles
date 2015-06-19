#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
OMZSH_ADDR="git://github.com/robbyrussell/oh-my-zsh.git"

# Update oh-my-zsh
if [ -d ~/.oh-my-zsh ];
then
	LAST_DIR=`pwd`
	cd ~/.oh-my-zsh
	git fetch origin &> /dev/null
	git reset --hard origin/master &> /dev/null
	cd $LAST_DIR
else
	git clone ${OMZSH_ADDR} ~/.oh-my-zsh &> /dev/null
fi

# Update bash_it
if [ -d ~/.bash_it ];
then
	LAST_DIR=`pwd`
	cd ~/.bash_it
	git fetch origin &> /dev/null
	git reset --hard origin/master &> /dev/null
	cd $LAST_DIR
else
	git clone ${BASH_IT_ADDR} ~/.bash_it &> /dev/null
fi

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

cp zsh/.zshrc ~/.
cp zsh/colorful* ~/.oh-my-zsh/themes/.

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q

./setup_bash_it.sh
