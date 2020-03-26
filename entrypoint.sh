#!/bin/sh

set -eu

# Creates .ssh Directory, copies private key in there and sets permissions
mkdir $HOME/.ssh && echo "$INPUT_SSH_PRIVATE_KEY" >> $HOME/.ssh/id_rsa && chmod 600 $HOME/.ssh/id_rsa

# Copies public key to known_hosts
echo "$INPUT_SSH_PUBLIC_KEY" >> /etc/ssh/ssh_known_hosts && chmod 600 /etc/ssh/ssh_known_hosts

# Adds private key to keystore
eval $(ssh-agent) && ssh-add $HOME/.ssh/id_rsa

# Connects to host and deploys
ssh -vvv -o "StrictHostKeyChecking no" -p "$INPUT_PORT" "$INPUT_SSHHOST"