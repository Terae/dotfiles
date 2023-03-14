#!/usr/bin/env bash

DIR_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR_ROOT}" || return 1

ansible-galaxy collection install -r requirements.yml
ansible-playbook -i inventory/hosts.yml dotfiles.yml --ask-become-pass
