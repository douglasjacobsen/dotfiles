#!/bin/bash

HOST_CHECK=`echo ${HOSTNAME%-*} | sed "s/[0-9]//g"`

if [ "${HOST_CHECK}" == "mu" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load python-epd/7.3.2 cmake/2.8.8
	module load libevent tmux
elif [ "${HOST_CHECK}" == "lo" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load git/1.7.7.1 cmake/2.8.8 subversion/1.6.15 python-epd/7.3.2 
elif [ "${HOST_CHECK}" == "cj" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load cmake/2.8.8 python-epd/7.3.2 subversion/1.6.15 
elif [ "${HOST_CHECK}" == "ml" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load python-epd/7.3.2 cmake/2.8.8 
elif [ "${HOST_CHECK}" == "yslogin" ]; then
	export LIBEVENT=/glade/u/home/douglasj/libevent/2.1.3
	export TMUX=/glade/u/home/douglasj/tmux/1.8
	export LD_LIBRARY_PATH="${LIBEVENT}/lib:${LD_LIBRARY_PATH}"
	export PATH="${TMUX}/bin:${PATH}"
elif [ "${HOST_CHECK}" == "hopper" ]; then
    module load git
else # Ubuntu?
	source /usr/local/Modules/3.2.10/init/bash
fi

