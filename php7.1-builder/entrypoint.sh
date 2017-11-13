#!/usr/bin/env bash

set -e

if [ "$SSH_PRIVATE_KEY" != "" ]; then
    eval $(ssh-agent -s)
    mkdir -p ~/.ssh
    echo "$SSH_PRIVATE_KEY" | ssh-add -
    [[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
fi

if [ -z "$DOCKER_HOST" -a "$DOCKER_PORT_2375_TCP" ]; then
	export DOCKER_HOST='tcp://docker:2375'
fi

exec "$@"