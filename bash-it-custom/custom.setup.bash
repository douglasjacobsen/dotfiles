#########################################################################################
#					Set Commands for Terminal History Search							#
#########################################################################################
if [ "${SHELL##*/}" == "bash" ]; then
	set filec
	set history = 100 
	set savehist = 100 
	
	bind -r "\e[A"
	bind -r "\e[B"
	bind -r "\e[1;5C"
	bind -r "\e[1;5D"
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
	bind '"\e[1;5C": forward-word'
	bind '"\e[1;5D": backward-word' 
fi

ON_UBUNTU=`uname -a | grep "Ubuntu"`

if [ -n "${ON_UBUNTU}" ]; then
    export PATH="${PATH}:/home/douglasj/Documents/metis-4.0"
    export PATH="${PATH}:/home/douglasj/AndroidTools/android-studio/sdk/platform-tools"
    export PYTHONPATH="${PYTHONPATH}:/home/douglasj/software/python/lib/python2.7/site-packages"

    shopt -s direxpand
fi

export PATH="${PATH}:${HOME}/scripts"

source ~/scripts/git-sh-prompt
