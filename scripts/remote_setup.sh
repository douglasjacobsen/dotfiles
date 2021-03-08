#!/usr/bin/bash

COMP_NAME=$1
COMP_TYPE=$2

DOTFILES_ADDR=git@github.com:douglasjacobsen/dotfiles

usage() {
    echo "gcp_setup.sh [COMP_NAME] [COMP_TYPE]"
    echo "    [COMP_NAME] - This arugment should be the equivalent of what you would ssh into"
    echo "    [COMP_TYPE] - This arugment should be one of {debian, centos}"
}

if [ -z ${COMP_NAME} ]; then
    echo "COMP_NAME argument is empty. Exiting..."
    echo
    usage
    exit
fi

if [ -z $COMP_TYPE ]; then
    echo "COMP_TYPE argument is empty. Exiting..."
    echo
    usage
    exit
fi

# Test ssh
ERR=`ssh -qT ${COMP_NAME} -- echo "0" || echo "1"`

if [ $ERR == "1" ]; then
    echo "SSH Failed to ${COMP_NAME}. Exiting..."
    exit
fi


# Transfer ssh key
scp ~/.ssh/id_github_rsa ${COMP_NAME}:~/.ssh/.

# Setup the ssh config
echo "Host github.com" > new_config
echo "    Hostname github.com" >> new_config
echo "    User git" >> new_config
echo "    ControlPersist no" >> new_config
echo "    ControlMaster no" >> new_config
echo "    IdentityFile ~/.ssh/id_github_rsa" >> new_config
scp new_config ${COMP_NAME}:~/.ssh/config
ssh -qT ${COMP_NAME} -- chmod 600 ~/.ssh/config
rm new_config

# Test git
ssh -qT ${COMP_NAME} -- "ssh-keyscan github.com >> ~/.ssh/known_hosts"
echo "--- Git Test ---"
ssh -qT ${COMP_NAME} -- "ssh -T git@github.com"
echo "--- End of Git Test ---"

# Copy the term-info
kitty +kitten ssh -qT ${COMP_NAME}

# Install vim and git
if [ $COMP_TYPE == "debian" ]; then
    ssh -qT ${COMP_NAME} -- sudo apt -y install git vim
elif [ ${COMP_TYPE} == "centos" ]; then
    ssh -qT ${COMP_NAME} -- sudo yum -y install git vim
fi

# Setup terminal
ssh -qT ${COMP_NAME} -- "mkdir -p Development && cd Development && git clone ${DOTFILES_ADDR}"
ssh -qT ${COMP_NAME} -- "cd Development/dotfiles && ./setup.sh"
