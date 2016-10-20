#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"

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

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

if [ ${BUNDLES} == 1 ]; then
	vim -u ~/.vimrc.bundles +BundleInstall +q
fi

./setup_bash_it.sh
