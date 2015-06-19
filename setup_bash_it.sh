###################
## Setup bash_it ##
###################

## Plugins
if [ ! -d ~/.bash_it/plugins/enabled ]; then
	mkdir -p ~/.bash_it/plugins/enabled
fi
ln -sf ~/.bash_it/plugins/available/base.plugin.bash ~/.bash_it/plugins/enabled/base.plugin.bash
ln -sf ~/.bash_it/plugins/available/battery.plugin.bash ~/.bash_it/plugins/enabled/battery.plugin.bash
ln -sf ~/.bash_it/plugins/available/extract.plugin.bash ~/.bash_it/plugins/enabled/extract.plugin.bash
ln -sf ~/.bash_it/plugins/available/git.plugin.bash ~/.bash_it/plugins/enabled/git.plugin.bash
ln -sf ~/.bash_it/plugins/available/latex.plugin.bash ~/.bash_it/plugins/enabled/latex.plugin.bash
ln -sf ~/.bash_it/plugins/available/python.plugin.bash ~/.bash_it/plugins/enabled/python.plugin.bash
ln -sf ~/.bash_it/plugins/available/ssh.plugin.bash ~/.bash_it/plugins/enabled/ssh.plugin.bash
ln -sf ~/.bash_it/plugins/available/subversion.plugin.bash ~/.bash_it/plugins/enabled/subversion.plugin.bash
ln -sf ~/.bash_it/plugins/available/tmuxinator.plugin.bash ~/.bash_it/plugins/enabled/tmuxinator.plugin.bash
ln -sf ~/.bash_it/plugins/available/tmux.plugin.bash ~/.bash_it/plugins/enabled/tmux.plugin.bash

## Aliases
if [ ! -d ~/.bash_it/aliases/enabled ]; then
	mkdir -p ~/.bash_it/aliases/enabled
fi
ln -sf ~/.bash_it/aliases/available/general.aliases.bash ~/.bash_it/aliases/enabled/general.aliases.bash
ln -sf ~/.bash_it/aliases/available/git.aliases.bash ~/.bash_it/aliases/enabled/git.aliases.bash
ln -sf ~/.bash_it/aliases/available/vim.aliases.bash ~/.bash_it/aliases/enabled/vim.aliases.bash

## Completion
if [ ! -d ~/.bash_it/completion/enabled ]; then
	mkdir -p ~/.bash_it/completion/enabled
fi
ln -sf ~/.bash_it/completion/available/bash-it.completion.bash ~/.bash_it/completion/enabled/bash-it.completion.bash
ln -sf ~/.bash_it/completion/available/defaults.completion.bash ~/.bash_it/completion/enabled/defaults.completion.bash
ln -sf ~/.bash_it/completion/available/git.completion.bash ~/.bash_it/completion/enabled/git.completion.bash
ln -sf ~/.bash_it/completion/available/git_flow.completion.bash ~/.bash_it/completion/enabled/git_flow.completion.bash
ln -sf ~/.bash_it/completion/available/ssh.completion.bash ~/.bash_it/completion/enabled/ssh.completion.bash
ln -sf ~/.bash_it/completion/available/tmux.completion.bash ~/.bash_it/completion/enabled/tmux.completion.bash

