#!/usr/bin/env bash

eval $(ssh-agent -s)
mkdir -p ~/.ssh
if [[ -z "${SSH_PRIVATE_KEY}" ]]; then
    echo "$SSH_PRIVATE_KEY" | ssh-add -
fi
[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

exec "$@"
