#########################################################################################
#						Set Aliases for Ease of Use										#
#########################################################################################
alias adb-start="adb kill-server && sudo /home/douglasj/AndroidSDK/adt-bundle-linux-x86_64-20130917/sdk/platform-tools/adb start-server"
alias tunhome="ssh -4fgN -D 23000 home"
alias tunhome_ip="ssh -4fgN -D 23000 174.56.101.93"
alias gnuplot="rlwrap -a -c gnuplot"
alias mountiso="sudo mount -o loop -t iso9660"
alias ssh='ssh -X'
alias prepare-wine='echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope'
alias mpas_tcs='svn co https://svn-mpas-model.cgd.ucar.edu/branches/ocean_projects/ocean_test_cases_staging/ocean'
alias ps2pdf='ps2pdf13 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 -dCompatibilityLevel=1.3'

ON_UBUNTU=`uname -a | grep "Ubuntu"`

if [ -n "${ON_UBUNTU}" ]; then
    alias module='/home/douglasj/software/sources/modules-3.2.10/modulecmd bash'
fi

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

alias git_lettuce='git clone git@github.com:douglasjacobsen/mpas-lettuce testing_mpas; cd testing_mpas; git submodule update --init --remote; cd features/ocean; git checkout master; cd ../../../'

alias reset_unity='stop unity-panel-service; start unity-panel-service'
