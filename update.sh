#!/bin/bash
OMZSH_ADDR="git://github.com/robbyrussell/oh-my-zsh.git"

if [ ! -d ~/.oh_my_zsh ]; then
	git clone ${OMZSH_ADDR} ~/.oh-my-zsh
fi

# Update oh-my-zsh
LAST_DIR=`pwd`
cd ~/.oh_my_zsh
git fetch origin &> /dev/null
git reset --hard origin/master &> /dev/null
cd $LAST_DIR

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

cp zsh/.zsh ~/.
cp zsh/colorful* ~/.oh_my_zsh/themes/.

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q
