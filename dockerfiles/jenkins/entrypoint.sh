#!/bin/bash

# echo $PATH
# echo ${DOCKER_SOCKET}
# if [ -S ${DOCKER_SOCKET} ]; then
DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
echo $DOCKER_GID
groupadd -for -g ${DOCKER_GID} dockerhost
usermod -aG dockerhost jenkins
# fi

exec sudo -E -H -u jenkins bash -c /usr/local/bin/jenkins.sh
