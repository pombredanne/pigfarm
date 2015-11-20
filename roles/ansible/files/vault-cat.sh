#!/bin/bash

HEADER=`head -n 1 "$1"`

case "$HEADER" in
    \$ANSIBLE_VAULT*)
        ansible-vault view --vault-password-file $HOME/.ansible/passwd "$1"
        ;;
    *)
        cat "$1"
        ;;
esac
