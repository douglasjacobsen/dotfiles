#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#########################################################################################
#						Set Aliases for Ease of Use										#
#########################################################################################
alias adb-start="adb kill-server && sudo /home/douglasj/AndroidTools/android-studio/sdk/platform-tools/adb start-server"
alias tunhome="ssh -4fgN -D 23000 home"
alias tunhome_ip="ssh -4fgN -D 23000 174.56.101.93"
alias gnuplot="rlwrap -a -c gnuplot"
alias mountiso="sudo mount -o loop -t iso9660"
alias ssh='ssh -X'
alias prepare-wine='echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope'
alias mpas_tcs='svn co https://svn-mpas-model.cgd.ucar.edu/branches/ocean_projects/ocean_test_cases_staging/ocean'
alias ps2pdf='ps2pdf13 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 -dCompatibilityLevel=1.3'

#########################################################################################
#					Set Aliases for LANL Computers										#
#########################################################################################
alias sshlob='ssh wtrw -t ssh lo-fe'
alias sshcon='ssh wtrw -t ssh cj-fe'
alias sshmap='ssh wtrw -t ssh mp-fe'
alias sshmus='ssh wtrw -t ssh mu-fe'
alias sshmol='ssh wtrw -t ssh ml-fe'
alias sshwol='ssh wtrw -t ssh wf-fe1'
alias sshgpfs='ssh wtrw -t ssh gpfst7-fe'

#########################################################################################
#					Set Aliases for Job Queues	    									#
#########################################################################################
alias myq_msub='showq -u `whoami`'

alias git_lettuce='git clone git@github.com:douglasjacobsen/mpas-lettuce-testing testing_mpas'

alias reset_unity='stop unity-panel-service; start unity-panel-service'

#########################################################################################
#					Set Commands for Terminal History Search							#
#########################################################################################
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

ON_UBUNTU=`uname -a | grep "Ubuntu"`

if [ -n "${ON_UBUNTU}" ]; then
    export PATH="${PATH}:/home/douglasj/Documents/metis-4.0"
    export PATH="${PATH}:/home/douglasj/AndroidTools/android-studio/sdk/platform-tools"
    export PYTHONPATH="${PYTHONPATH}:/home/douglasj/software/python/lib/python2.7/site-packages"

    shopt -s direxpand
fi

export PATH="${PATH}:${HOME}/scripts"
