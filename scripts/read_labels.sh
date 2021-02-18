#!/bin/bash

O_AUTH_TOKEN="OAUTH_TOKEN_HERE"
GITHUB_USERNAME="GITHUB_USERNAME_HERE"
MAX_EVENT=815

REPO_NAME="MPAS-Model"

ROOT_DIR=`pwd`

ERROR=0

if [ "${O_AUTH_TOKEN}" == "OAUTH_TOKEN_HERE" ]; then
	echo "Please create an OAuth token at github.com and set the O_AUTH_TOKEN variable equal to it in this script."
	ERROR=1
fi

if [ "${GITHUB_USERNAME}" == "GITHUB_USERNAME_HERE" ]; then
	echo "Please set the GITHUB_USERNAME variable equal to your github username in this script."
	ERROR=1
fi

if [ ${ERROR} == 1 ]; then
	exit
fi

echo "{" > all_labels.json

#for ISSUE in (( 810; ${MAX_EVENT}; 1 ))
for ISSUE in $(seq 1 ${MAX_EVENT})
do
    echo "Reading issue ${ISSUE}"
    EVENT_URL="https://api.github.com/repos/MPAS-Dev/MPAS-Model/issues/${ISSUE}/events"
    LABELS=`curl -s -H "Authorization: TOKEN ${O_AUTH_TOKEN}" -i ${EVENT_URL} | grep '"label": {' -A 3`
    echo "${LABELS}" >> all_labels.json

done
echo "}" >> all_labels.json
