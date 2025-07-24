#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
SPF13_ADDR="git@github.com:douglasjacobsen/spf13-vim.git"
KITTY_THEMES_ADDR="git@github.com:dexpota/kitty-themes.git"
TERMINATOR_THEMES_ADDR="git@github.com:EliverLara/terminator-themes.git"
TMUX_CONF_ADDR="git@github.com:douglasjacobsen/tmux-config.git"

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
# git clone -b 3.0 ${SPF13_ADDR} ~/.spf13-vim-3
# git clone --depth=1 ${KITTY_THEMES_ADDR} ~/.kitty_themes
git clone --depth=1 ${TERMINATOR_THEMES_ADDR} ~/.terminator_themes
git clone ${TMUX_CONF_ADDR} ~/.tmux-config

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

# for FILE in `ls -1 vim/.vimrc*`;
# do
#     ln -sf ${PWD}/${FILE} ~/.
# done

# Setup tmux
# ln -sf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
~/.tmux-config/install.sh

# Setup Kitty
# mkdir -p ~/.config/kitty
# ln -sf ~/.kitty_themes/themes/AdventureTime.conf ~/.config/kitty/theme.conf
# ln -sf ${PWD}/kitty/kitty.conf ~/.config/kitty/.

# Setup Terminator
mkdir -p ~/.config/terminator
ln -sf ${PWD}/terminator/config ~/.config/terminator/config

# Setup VIM
# ~/.spf13-vim-3/bootstrap.sh
#curl -sLf https://spacevim.org/install.sh | bash
git clone --revision v2.3.0 git@github.com:douglasjacobsen/SpaceVim ~/.SpaceVim
if [ -d ~/.vim ]; then
	rm -rf ~/.vim
fi
ln -s ~/.SpaceVim ~/.vim
mkdir -p ~/.SpaceVim.d
cp -r SpaceVim/* ~/.SpaceVim.d/.

# Setup LunarVim
wget https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh
chmod a+x install.sh
LV_BRANCH='release-1.2/neovim-0.8' ./install.sh --no-install-dependencies -y --overwrite &> ~/lunarvim_setup.log
rm install.sh

mkdir -p ~/.config/lvim
cp LunarVim/* ~/.config/lvim/.

# Setup Bash-it
./setup_bash_it.sh

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile "${PWD}/git/core_excludes"
git config --global init.templatedir "~/scripts/git_template"

echo " ************************* "
echo " Don't forget to install NerdFonts"
echo " https://github.com/getnf/getnf"
echo " ************************* "

