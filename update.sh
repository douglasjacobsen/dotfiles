#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
SPF13_ADDR="git@github.com:douglasjacobsen/spf13-vim.git"
KITTY_THEMES_ADDR="git@github.com:dexpota/kitty-themes.git"
TERMINATOR_THEMES_ADDR="git@github.com:EliverLara/terminator-themes.git"
TMUX_CONF_ADDR="git@github.com:douglasjacobsen/tmux-config.git"

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

# # Update spf13-vim-3
# if [ -d ~/.spf13-vim-3 ];
# then
#     LAST_DIR=`pwd`
#     cd ~/.spf13-vim-3
#     OLD_VER=`git log -n 1 --format="%H"`
#     git fetch origin &> /dev/null
#     git reset --hard origin/3.0 &> /dev/null
#     NEW_VER=`git log -n 1 --format="%H"`
# 
#     if [ "${OLD_VER}" != "${NEW_VER}" ]; then
#         echo "Updating SPF13-Vim version"
#         sh ./bootstrap.sh
#     else
#         echo "No new commits in SPF13-Vim. Skipping update..."
#     fi
#     cd $LAST_DIR
# else
#     git clone -b 3.0 ${SPF13_ADDR} ~/.spf13-vim-3 &> /dev/null
#     sh ~/.spf13-vim-3/bootstrap.sh
# fi

# Update SpaceVim
if [ -d ~/.SpaceVim ];
then
  LAST_DIR=`pwd`
  cd ~/.SpaceVim
  git pull &> /dev/null
  vim -c ":SPUpdate"

  cd ${LAST_DIR}
  rm -rf ~/.SpaceVim.d
  mkdir -p ~/.SpaceVim.d
  cp -r SpaceVim/* ~/.SpaceVim.d/.
fi

# Update tmux config
if [ -d ~/.tmux-config ];
then
    LAST_DIR=`pwd`
    cd ~/.tmux-config
    OLD_VER=`git log -n 1 --format="%H"`
    git fetch origin &> /dev/null
    git reset --hard origin/master &> /dev/null
    NEW_VER=`git log -n 1 --format="%H"`
    if [ "${OLD_VER}" != "${NEW_VER}" ]; then
        echo "Updating Tmux-Config version"
        if [ -d ~/.tmux ];
        then
            rm -rf ~/.tmux
        fi
        sh ~/.tmux-config/install.sh
    else
        echo "No new commits in tmux-config. Skipping update..."
    fi
    cd ${LAST_DIR}
else
    git clone ${TMUX_CONF_ADDR} ~/.tmux-config
    sh ~/.tmux-config/install.sh
fi

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

# rm -f ~/.vimswap/* ~/.vimviews/* ~/.viminfo
# for FILE in `ls -1 vim/.vimrc*`;
# do
#     ln -sf ${PWD}/${FILE} ~/.
# done

# Update terminator config
if [ ! -d ~/.config/terminator ]; then
    mkdir -p ~/.config/terminator
fi

if [ ! -f ~/.config/terminator/config ]; then
    ln -sf ${PWD}/terminator/config ~/.config/terminator/config
fi

# Update scripts
mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"
git config --global init.templatedir "~/scripts/git_template"

./setup_bash_it.sh
